-module(kal_gen).

%-include_lib("llevm/include/llevm.hrl").

-export([gen_function/3]).

gen_function(M, B, {function,Name,Args,Body}) ->
       
    FunRef = gen_prototype(M, Name, Args),

    Params = get_params(FunRef, Args, 0),

    BB = llevm:'LLVMAppendBasicBlock'(FunRef,"entry"),
    llevm:'LLVMPositionBuilderAtEnd'(B, BB),

    BodyRef = gen_body(M, B, Params, Body),

    llevm:'LLVMBuildRet'(B, BodyRef),
    FunRef;
gen_function(M, _B, {extern, Name, Args}) ->
    gen_prototype(M, Name, Args).


gen_prototype(M, Name, Args) ->

    FunctionTypeRef = llevm:'LLVMFunctionType'(
			llevm:'LLVMDoubleType'(),
			list_to_tuple([llevm:'LLVMDoubleType'() || _ <- Args]),
			length(Args), false),

    llevm:'LLVMAddFunction'(M, Name, FunctionTypeRef).


gen_body(M, B, Params, {Op,LHS,RHS}) 
  when Op == '+'; Op == '-'; Op == '*'; Op == '<' ->
    LHSRef = gen_body(M,B,Params,LHS),
    RHSRef = gen_body(M,B,Params,RHS),
    case Op of
	'+' -> llevm:'LLVMBuildFAdd'(B, LHSRef, RHSRef, "addtmp");
	'-' -> llevm:'LLVMBuildFSub'(B, LHSRef, RHSRef, "subtmp");
	'*' -> llevm:'LLVMBuildFMul'(B, LHSRef, RHSRef, "multmp");
	'<' ->
	    L = llevm:'LLVMBuildFCmp'(B, {'LLVMRealPredicate',13},LHSRef, RHSRef, "cmptmp"),
	    %% Convert bool 0/1 to double 0.0 or 1.0
	    llevm:'LLVMBuildUIToFP'(B, L, llevm:'LLVMDoubleType'(), "booltmp")
    end;
gen_body(_M, _B, _Params, {const, Val}) ->
    llevm:'LLVMConstReal'(llevm:'LLVMDoubleType'(),list_to_float(Val));
gen_body(_M, _B, Params, {variable, Name}) ->
    proplists:get_value(Name, Params);
gen_body(M, B, Params, {call, Name, CParams}) ->
    CalleeRef = llevm:'LLVMGetNamedFunction'(M,Name),
    CParamsRefs = list_to_tuple([gen_body(M, B, Params, CParam) || CParam <- CParams]),
    llevm:'LLVMBuildCall'(B, CalleeRef, CParamsRefs, length(CParams), "calltmp");
gen_body(M, B, Params, {'if', Cond, Then, Else}) ->
    CondRef = gen_body(M, B, Params, Cond),
    CmpRef = llevm:'LLVMBuildFCmp'(B, {'LLVMRealPredicate',7}, CondRef,
				   gen_body(M, B, Params, {const,"0.0"}),
				   "ifcond"),
    FunRef = llevm:'LLVMGetBasicBlockParent'(
	       llevm:'LLVMGetInsertBlock'(B)),
    ThenBB = llevm:'LLVMAppendBasicBlock'(FunRef, "then"),
    ElseBB = llevm:'LLVMAppendBasicBlock'(FunRef, "else"),
    ContBB = llevm:'LLVMAppendBasicBlock'(FunRef, "if_cont"),

    llevm:'LLVMBuildCondBr'(B, CmpRef, ThenBB, ElseBB),
    
    llevm:'LLVMPositionBuilderAtEnd'(B, ThenBB),
    ThenV = gen_body(M, B, Params, Then),
    llevm:'LLVMBuildBr'(B, ContBB),
    
    llevm:'LLVMPositionBuilderAtEnd'(B, ElseBB),
    ElseV = gen_body(M, B, Params, Else),
    llevm:'LLVMBuildBr'(B, ContBB),

    llevm:'LLVMPositionBuilderAtEnd'(B, ContBB),
    PhiNode = llevm:'LLVMBuildPhi'(B, llevm:'LLVMDoubleType'(), "iftmp"),
    llevm:'LLVMAddIncoming'(PhiNode, {ThenV,ElseV},{ThenBB,ElseBB},2),
    PhiNode.
    
    
get_params(FunRef, [{variable, Name}|Rest], I) ->
    [{Name, llevm:'LLVMGetParam'(FunRef, I)} | get_params(FunRef, Rest, I + 1)];
get_params(_FunRef, [], _I) ->
    [].

			
