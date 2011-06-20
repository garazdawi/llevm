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
    [adder, complex, extern, condition].

adder(_Config) ->
    compile(["def adding(test1,test2) test1+test2;"]).

complex(_Config) ->
    compile(["def foo(a,b) a*a + 2.0*a*b + b*b;",
	     "def bar(a) foo(a, 4.0) + bar(31337.0);"]).

extern(_Config) ->
    compile(["extern cos(x);",
	     "cos(1.234);"]).

condition(_Config) ->
    compile(["def fib(x) if x < 3.0 then 1.0 else fib(x-1.0)+fib(x-2.0);"]).

for(_Config) ->
    compile(["extern putchard(char);",
	     "def printstar(n) for i = 1.0, i < n, 1.0 in putchard(42.0);",
	     "def printstar2(n) for i = 1.0, i < n in putchard(42.0);"]).

compile(Strs) ->
    Ctx = llevm:'LLVMGetGlobalContext'(),
    ModRef = llevm:'LLVMModuleCreateWithName'("test"),
    BuildRef = llevm:'LLVMCreateBuilderInContext'(Ctx),
    lists:map(fun(Str) ->
		      AST = scan_and_parse(Str),
		      FunRef = kal_gen:gen_function(ModRef,BuildRef,AST),
		      llevm:'LLVMDumpValue'(FunRef),
		      FunRef
	      end,Strs),
    llevm:'LLVMDumpModule'(ModRef).
    

scan_and_parse(Str) ->
    Toks = kal_scan:string(Str),
    ?PRINT("Toks: ~p~n",[Toks]),
    {ok,[AST]} = kal_parse:parse(Toks),
    ?PRINT("AST: ~p~n",[AST]),
    AST.
