-module(erlang_SUITE).

-compile(export_all).

-include_lib("common_test/include/ct.hrl").

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
    [fibonacci, fibonacci_perf].

fibonacci(Config) ->
    {ModRef, [Fib]} = 
	build(Config, [{fib, "fib(1) -> 1;fib(N) -> N * fib(N-1)."}]),
    run(ModRef, Fib, [10]).


fibonacci_perf(Config) ->
    {ModRef, [Fib]} = 
	build(Config, [{fib, "fib(1) -> 1;fib(N) -> N * fib(N-1)."}]),
    
    {_, EERef, _} = llevm:'LLVMCreateExecutionEngineForModule'(ModRef),
    LLVMFib = fun(I) ->
		      Args = {llevm:'LLVMCreateGenericValueOfInt'(
				llevm:'LLVMInt32Type'(),I, true)},
		      Res = llevm:'LLVMRunFunction'(
			      EERef, Fib, 1,
			      Args),
		      llevm:'LLVMGenericValueToInt'(Res, false)
	      end,
    ErlangFib = fun fib/1,
    {N,_R} = timer:tc(fun() -> [LLVMFib((I rem 5)+1) || I <- lists:seq(1,100000)] end),
    {E,R} = timer:tc(fun() -> [ErlangFib((I rem 5)+1) || I <- lists:seq(1,100000)] end),
    ct:pal("N = ~p~nE = ~p~n",[N,E]).

get_erlang_ast(Config, Name, Str) ->
    Erl = filename:join(proplists:get_value(priv_dir, Config),"tmp.erl"),
    Beam = filename:join(proplists:get_value(priv_dir, Config),"tmp.beam"),
    {ok, D} = file:open(Erl,[write]),
    io:format(D,"-module(tmp).~n-compile(export_all).~n",[]),
    io:format(D,Str,[]),
    file:close(D),
    {ok,_} = compile:file(Erl,[{outdir,proplists:get_value(priv_dir, Config)}]),
    {beam_file,_Mod,_Export,_Vsn,_Opts,Function} = beam_disasm:file(Beam),
    lists:keyfind(Name, 2, Function).
    

run(ModRef, FunRef, Args) ->
    IntArgs = list_to_tuple([llevm:'LLVMCreateGenericValueOfInt'(
				 llevm:'LLVMInt32Type'(),Int32, false) || Int32 <- Args]),
    {_, EERef, _} = llevm:'LLVMCreateExecutionEngineForModule'(ModRef),
    Res = llevm:'LLVMRunFunction'(
	    EERef, FunRef, length(Args),
	    IntArgs),
    llevm:'LLVMGenericValueToInt'(Res, false).
    
build(Config, Strs) ->
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
    FunRefs = lists:map(fun({Func,Str}) ->
				EAST = get_erlang_ast(Config, Func, Str),
				FunRef = erlang_gen:gen_function(ModRef,BuildRef,EAST),
				llevm:'LLVMRunFunctionPassManager'(FPMRef, FunRef),
				FunRef
			end,Strs),
    llevm:'LLVMFinalizeFunctionPassManager'(FPMRef),
    llevm:'LLVMDumpModule'(ModRef),
    {ModRef,FunRefs}.


fib(1) -> 1;fib(N) -> N * fib(N-1).
