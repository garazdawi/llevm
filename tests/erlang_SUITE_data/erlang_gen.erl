-module(erlang_gen).

%-include_lib("llevm/include/llevm.hrl").

%{function,fib,1,2,
% [{label,1},
%  {func_info,{atom,tmp},{atom,fib},1},
%  {label,2},
%  {test,is_eq_exact,{f,3},[{x,0},{integer,1}]},
%  return,
%  {label,3},
%  {allocate_zero,1,1},
%  {gc_bif,'-',{f,0},1,[{x,0},{integer,1}],{x,1}},
%  {move,{x,0},{y,0}},
%  {move,{x,1},{x,0}},
%  {call,1,{tmp,fib,1}},
%  {gc_bif,'*',{f,0},1,[{y,0},{x,0}],{x,0}},
%  {deallocate,1},
%  return]}

-export([gen_function/3]).

gen_function(M, B, {function,Name,ArgNum,_StartLabel,Body}) ->
    
    FunRef = gen_prototype(M, Name, ArgNum),

    Params = get_params(FunRef, ArgNum, 0),

    AllBBs = gen_bb(FunRef, Name, Body),

    gen_body(M, B, Params, AllBBs, Body),

    FunRef;
gen_function(M, _B, {extern, Name, Args}) ->
    gen_prototype(M, Name, Args).


gen_prototype(M, Name, NumArgs) ->

    FunctionTypeRef = llevm:'LLVMFunctionType'(
			llevm:'LLVMInt32Type'(),
			list_to_tuple([llevm:'LLVMInt32Type'() || _ <- lists:seq(1,NumArgs)]),
			NumArgs, false),

    llevm:'LLVMAddFunction'(
      M, atom_to_list(Name)++"_"++integer_to_list(NumArgs), FunctionTypeRef).

get_params(_FunRef, 0, _I) ->
    [];
get_params(FunRef, Cnt, I) ->
    [{{x,I}, llevm:'LLVMGetParam'(FunRef, I)} | get_params(FunRef, Cnt-1, I + 1)].

gen_bb(FunRef, Name, [{label, _},{func_info, _,_,_}|Rest]) ->
    gen_bb(FunRef, Name, Rest);
gen_bb(FunRef, Name, [{label, No}|Rest]) ->
    [{No, llevm:'LLVMAppendBasicBlock'(FunRef, atom_to_list(Name)++"_"++integer_to_list(No))}|
     gen_bb(FunRef, Name, Rest)];
gen_bb(FunRef, Name, [_|Body]) ->
    gen_bb(FunRef, Name, Body);
gen_bb(_FunRef, _Name, []) ->
    [].

gen_body(M, B, V, BBs, [{label, _},{func_info, _, _, _}|Body]) ->
    gen_body(M, B, V, BBs, Body);
gen_body(M, B, V, BBs, [{label, No}|Body]) ->
    llevm:'LLVMPositionBuilderAtEnd'(B, proplists:get_value(No, BBs)),
    gen_body(M, B, V, BBs, Body);
gen_body(M, B, V, BBs, [{test, is_eq_exact, {f, FBB}, [A1,A2]}|Body]) ->
    A1Ref = get_ref(V, A1),
    A2Ref = get_ref(V, A2),
    CmpRef = llevm:'LLVMBuildICmp'(B, {'LLVMIntPredicate',32},
				    A1Ref, A2Ref, "cmptmp"),
    FunRef = llevm:'LLVMGetBasicBlockParent'(
	       llevm:'LLVMGetInsertBlock'(B)),
    ThenBB = llevm:'LLVMAppendBasicBlock'(FunRef, "then"),
    
    llevm:'LLVMBuildCondBr'(B, CmpRef, ThenBB, proplists:get_value(FBB, BBs)),
    llevm:'LLVMPositionBuilderAtEnd'(B, ThenBB),
    gen_body(M, B, V, BBs, Body);
gen_body(M, B, V, BBs, [return|Body]) ->
    llevm:'LLVMBuildRet'(B, proplists:get_value({x,0},V)),
    gen_body(M, B, V, BBs, Body);
gen_body(M, B, V, BBs, [{gc_bif, Op, _Fail, _Needed, [A1,A2], Result}|Body]) ->
    A1Ref = get_ref(V, A1),
    A2Ref = get_ref(V, A2),
    NewRegRef = case Op of
		    '-' -> llevm:'LLVMBuildSub'(B, A1Ref, A2Ref, 
						reg_to_string(Result));
		    '*' -> llevm:'LLVMBuildMul'(B, A1Ref, A2Ref, 
						reg_to_string(Result))
		end,
    gen_body(M, B, [{Result, NewRegRef}|V], BBs, Body);
gen_body(M, B, V, BBs, [{move, From, To}|Body]) ->
    FromRef = get_ref(V, From),
    gen_body(M, B, [{To, FromRef}|V], BBs, Body);
gen_body(M, B, V, BBs, [{call, _Needed, {Mo,F,A}}|Body]) ->
    CalleeRef = llevm:'LLVMGetNamedFunction'(
		  M, atom_to_list(F)++"_"++integer_to_list(A)),
    CParamsRefs = list_to_tuple([get_ref(V, {x,I}) || I <- lists:seq(0,A-1)]),
    NewRegRef = llevm:'LLVMBuildCall'(B, CalleeRef, CParamsRefs, A, "calltmp"),
    gen_body(M, B, [{{x,0},NewRegRef}|V], BBs, Body);
gen_body(M, B, V, BBs, [_|Body]) ->
    gen_body(M, B, V, BBs, Body);
gen_body(M, B, V, BBs, []) ->
    ok.

get_ref(_V, {integer, Num}) ->
    llevm:'LLVMConstInt'(llevm:'LLVMInt32Type'(), Num, true);
get_ref(V, {XY, _Num} = Reg) when XY == x; XY == y ->
    proplists:get_value(Reg, V).
    
    
    
reg_to_string({XY,No}) ->
    atom_to_list(XY)++integer_to_list(No)++"_".
