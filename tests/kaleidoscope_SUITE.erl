-module(kaleidoscope_SUITE).

-compile(export_all).

-define(PRINT(Str,Args), ct:pal(Str,Args)).

init_per_suite(Config) ->
    code:add_patha(proplists:get_value(data_dir,Config)),
    Yrls = filelib:wildcard(filename:join(proplists:get_value(data_dir, Config),
					  "*.yrl")),
    [{ok,_} = yecc:file(Yrl,[{parserfile,filename:rootname(Yrl)++".erl"}]) || Yrl <- Yrls],
    Erls = filelib:wildcard(filename:join(proplists:get_value(data_dir, Config),
					  "*.erl")),
    [{ok,_} = compile:file(Erl,[{outdir,proplists:get_value(data_dir, Config)}]) || Erl <- Erls],
    Config.
    

end_per_suite(_Config) ->
    ok.

init_per_testcase(_Tc, Config) ->
    Config.

end_per_testcase(_Tc, _Config) ->
    ok.

all() ->
    [adder, complex, extern, condition, for].

adder(_Config) ->
    {ModRef, [FunRef]} = build(["def adding(test1,test2) test1+test2;"]),
    {float, 2.0} = run(ModRef, FunRef, [1.0,1.0]),
    {float, 3.0} = run(ModRef, FunRef, [1.0,2.0]),
    {float, 4.0} = run(ModRef, FunRef, [3.0,1.0]),
    {float, 5.0} = run(ModRef, FunRef, [1.0,4.0]),
    {float, 6.0} = run(ModRef, FunRef, [5.0,1.0]),
    {float, 7.0} = run(ModRef, FunRef, [1.0,6.0]).


complex(_Config) ->
    {ModRef, [_Foo, Bar]} = build(["def foo(a,b) a*a + 2.0*a*b + b*b;",
				   "def bar(a) if 1337.0 < a then 1337.0 else "
				   " foo(a, 4.0) + bar(a*5.0);"]),
    {float,151629.0} = run(ModRef, Bar, [3.0]).

extern(_Config) ->
    {ModRef, [_, FunRef]} = build(["extern cos(x);",
				   "cos(1.234);"]),
    {float,0.33046510807172985} = run(ModRef, FunRef, []).

condition(_Config) ->
    {ModRef, [FunRef]} =
	build(["def fib(x) if x < 3.0 then 1.0 else fib(x-1.0)+fib(x-2.0);"]),
    {float, 8.0} = run(ModRef, FunRef, [6.0]).


for(_Config) ->
    build(["extern putchard(char);",
	     "def printstar(n) for i = 1.0, i < n, 1.0 in putchard(42.0);",
	     "def printstar2(n) for i = 1.0, i < n in putchard(42.0);"]).

run(ModRef, FunRef, Args) ->
    FloatArgs = list_to_tuple([llevm:'LLVMCreateGenericValueOfFloat'(
				 llevm:'LLVMDoubleType'(),Float) || Float <- Args]),
    {_, EERef, _} = llevm:'LLVMCreateExecutionEngineForModule'(ModRef),
    Res = llevm:'LLVMRunFunction'(
	    EERef, FunRef, length(Args),
	    FloatArgs),
    llevm:'LLVMGenericValueToFloat'(llevm:'LLVMDoubleType'(),Res).
    


build(Strs) ->
%    llevm:'LLVMInitializeCore'(llevm:'LLVMGetGlobalPassRegistry'()),
    llevm:'LLVMLinkInInterpreter'(),

    Ctx = llevm:'LLVMGetGlobalContext'(),
    ModRef = llevm:'LLVMModuleCreateWithName'("test"),
    BuildRef = llevm:'LLVMCreateBuilderInContext'(Ctx),
    FPMRef = llevm:'LLVMCreateFunctionPassManagerForModule'(ModRef),
    
    llevm:'LLVMAddInstructionCombiningPass'(FPMRef),
    llevm:'LLVMAddReassociatePass'(FPMRef),
    llevm:'LLVMAddGVNPass'(FPMRef),
    llevm:'LLVMAddCFGSimplificationPass'(FPMRef),

    llevm:'LLVMInitializeFunctionPassManager'(FPMRef),
    FunRefs = lists:map(fun(Str) ->
				AST = scan_and_parse(Str),
				FunRef = kal_gen:gen_function(ModRef,BuildRef,AST),
				llevm:'LLVMRunFunctionPassManager'(FPMRef, FunRef),
				FunRef
			end,Strs),
    llevm:'LLVMFinalizeFunctionPassManager'(FPMRef),
    llevm:'LLVMDumpModule'(ModRef),
    {ModRef,FunRefs}.
    
    
    

scan_and_parse(Str) ->
    Toks = kal_scan:string(Str),
    ?PRINT("Toks: ~p~n",[Toks]),
    {ok,[AST]} = kal_parse:parse(Toks),
    ?PRINT("AST: ~p~n",[AST]),
    AST.
