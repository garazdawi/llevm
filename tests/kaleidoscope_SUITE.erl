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
    [adder, complex, extern, condition, compile].

adder(_Config) ->
    build(["def adding(test1,test2) test1+test2;"]).

complex(_Config) ->
    build(["def foo(a,b) a*a + 2.0*a*b + b*b;",
	     "def bar(a) foo(a, 4.0) + bar(31337.0);"]).

extern(_Config) ->
    build(["extern cos(x);",
	     "cos(1.234);"]).

condition(_Config) ->
    build(["def fib(x) if x < 3.0 then 1.0 else fib(x-1.0)+fib(x-2.0);"]).

for(_Config) ->
    build(["extern putchard(char);",
	     "def printstar(n) for i = 1.0, i < n, 1.0 in putchard(42.0);",
	     "def printstar2(n) for i = 1.0, i < n in putchard(42.0);"]).


compile(_Config) ->
    {ModRef, [FunRef]} = build(["def mult(i) i * 3.0;"]),

    R = {_, EERef, _} = llevm:'LLVMCreateExecutionEngineForModule'(ModRef),
    ct:pal("EE create res: ~p~n",[R]),
    Res = llevm:'LLVMRunFunction'(
	    EERef, FunRef, 1, 
	    {llevm:'LLVMCreateGenericValueOfFloat'(
	       llevm:'LLVMDoubleType'(),3.0)}),
    {float, 9.0} = llevm:'LLVMGenericValueToFloat'(llevm:'LLVMDoubleType'(),Res).
    


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
