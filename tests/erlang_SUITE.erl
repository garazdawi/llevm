-module(erlang_SUITE).

-compile(export_all).

%-include_lib("common_test/include/ct.hrl").

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
    [factorial, nfactorial, nfactorial_perf].

factorial(_Config) ->
    {ModRef, [Fact]} = build([fact]),
    run(ModRef, Fact, [10]).

nfactorial(_Config) ->
    {ModRef, [_Fact,NFact]} = build([fact,nfact]),
    run(ModRef, NFact, [10]).


nfactorial_perf(_Config) ->
    {ModRef, [_Fact,NFact]} = build([fact,nfact]),
    
    {_, EERef, _} = llevm:'LLVMCreateExecutionEngineForModule'(ModRef),
    LLVMFact = fun(I) ->
		      Args = {llevm:'LLVMCreateGenericValueOfInt'(
				llevm:'LLVMInt32Type'(),I, true)},
		      Res = llevm:'LLVMRunFunction'(
			      EERef, NFact, 1,
			      Args),
		      element(2,llevm:'LLVMGenericValueToInt'(Res, false))
	      end,
    LLVMFact(1),
    ErlangFact = fun nfact/1,
    {N,_R} = timer:tc(fun() -> LLVMFact(1000000) end),
    {E,_} = timer:tc(fun() -> ErlangFact(1000000) end),
    ct:pal("N = ~p~nE = ~p~n",[N,E]).

get_erlang_ast(Name) ->
    {beam_file,_Mod,_Export,_Vsn,_Opts,Function} = beam_disasm:file(code:which(?MODULE)),
    lists:keyfind(Name, 2, Function).
    

run(ModRef, FunRef, Args) ->
    IntArgs = list_to_tuple([llevm:'LLVMCreateGenericValueOfInt'(
				 llevm:'LLVMInt32Type'(),Int32, false) || Int32 <- Args]),
    {_, EERef, _} = llevm:'LLVMCreateExecutionEngineForModule'(ModRef),
    Res = llevm:'LLVMRunFunction'(
	    EERef, FunRef, length(Args),
	    IntArgs),
    llevm:'LLVMGenericValueToInt'(Res, false).
    
build(Funcs) ->
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
    FunRefs = lists:map(fun(Func) ->
				EAST = get_erlang_ast(Func),
				ct:print("EAST: ~p",[EAST]),
				FunRef = erlang_gen:gen_function(ModRef,BuildRef,EAST),
				llevm:'LLVMRunFunctionPassManager'(FPMRef, FunRef),
				FunRef
			end,Funcs),
    llevm:'LLVMFinalizeFunctionPassManager'(FPMRef),
    llevm:'LLVMDumpModule'(ModRef),
    {ModRef,FunRefs}.


fact(0) -> 1;fact(N) -> N * fact(N-1).
nfact(1) -> 0; nfact(N) -> (fact((N rem 10)+1)+nfact(N-1)) rem (1 bsl 30).
