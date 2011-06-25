-module(llevm).

-include("llevm.hrl").

-on_load(load_my_nifs/0).

%% @@EXPORTS@@
%% -- Start generating from Scalar_8h.xml on {{2011,6,25},{15,38,45}}--

-export(['LLVMAddCFGSimplificationPass'/1]).
-export(['LLVMAddGVNPass'/1]).
-export(['LLVMAddInstructionCombiningPass'/1]).
-export(['LLVMAddReassociatePass'/1]).
%% --- Stop generating from Scalar_8h.xml

%% -- Start generating from IPO_8h.xml on {{2011,6,25},{15,38,45}}--

%% --- Stop generating from IPO_8h.xml

%% -- Start generating from Core_8h.xml on {{2011,6,25},{15,38,45}}--

-export(['LLVMGetGlobalContext'/0]).
-export(['LLVMModuleCreateWithName'/1]).
-export(['LLVMDumpModule'/1]).
-export(['LLVMInt1TypeInContext'/1]).
-export(['LLVMInt8TypeInContext'/1]).
-export(['LLVMInt16TypeInContext'/1]).
-export(['LLVMInt32TypeInContext'/1]).
-export(['LLVMInt64TypeInContext'/1]).
-export(['LLVMIntTypeInContext'/2]).
-export(['LLVMInt1Type'/0]).
-export(['LLVMInt8Type'/0]).
-export(['LLVMInt16Type'/0]).
-export(['LLVMInt32Type'/0]).
-export(['LLVMInt64Type'/0]).
-export(['LLVMIntType'/1]).
-export(['LLVMFloatTypeInContext'/1]).
-export(['LLVMDoubleTypeInContext'/1]).
-export(['LLVMFP128TypeInContext'/1]).
-export(['LLVMPPCFP128TypeInContext'/1]).
-export(['LLVMFloatType'/0]).
-export(['LLVMDoubleType'/0]).
-export(['LLVMFP128Type'/0]).
-export(['LLVMPPCFP128Type'/0]).
-export(['LLVMFunctionType'/4]).
-export(['LLVMDumpValue'/1]).
-export(['LLVMConstNull'/1]).
-export(['LLVMConstReal'/2]).
-export(['LLVMGetLinkage'/1]).
-export(['LLVMSetLinkage'/2]).
-export(['LLVMAddFunction'/3]).
-export(['LLVMGetNamedFunction'/2]).
-export(['LLVMGetParam'/2]).
-export(['LLVMGetBasicBlockParent'/1]).
-export(['LLVMAppendBasicBlock'/2]).
-export(['LLVMAddIncoming'/4]).
-export(['LLVMCreateBuilderInContext'/1]).
-export(['LLVMPositionBuilderAtEnd'/2]).
-export(['LLVMGetInsertBlock'/1]).
-export(['LLVMBuildRet'/2]).
-export(['LLVMBuildBr'/2]).
-export(['LLVMBuildCondBr'/4]).
-export(['LLVMBuildFAdd'/4]).
-export(['LLVMBuildFSub'/4]).
-export(['LLVMBuildFMul'/4]).
-export(['LLVMBuildUIToFP'/4]).
-export(['LLVMBuildFCmp'/5]).
-export(['LLVMBuildPhi'/3]).
-export(['LLVMBuildCall'/5]).
-export(['LLVMCreateFunctionPassManagerForModule'/1]).
-export(['LLVMRunPassManager'/2]).
-export(['LLVMInitializeFunctionPassManager'/1]).
-export(['LLVMRunFunctionPassManager'/2]).
-export(['LLVMFinalizeFunctionPassManager'/1]).
%% --- Stop generating from Core_8h.xml


-type llvm_ptr(Base) :: {llvm_ptr, Base}.

%% @@TYPES@@
%% -- Start generating from Scalar_8h.xml on {{2011,6,25},{15,38,45}}--

%% --- Stop generating from Scalar_8h.xml

%% -- Start generating from IPO_8h.xml on {{2011,6,25},{15,38,45}}--

%% --- Stop generating from IPO_8h.xml

%% -- Start generating from Core_8h.xml on {{2011,6,25},{15,38,45}}--

-opaque 'LLVMAttribute'() :: {'LLVMAttribute',integer()}.
-opaque 'LLVMOpcode'() :: {'LLVMOpcode',integer()}.
-opaque 'LLVMTypeKind'() :: {'LLVMTypeKind',integer()}.
-opaque 'LLVMLinkage'() :: {'LLVMLinkage',integer()}.
-opaque 'LLVMVisibility'() :: {'LLVMVisibility',integer()}.
-opaque 'LLVMCallConv'() :: {'LLVMCallConv',integer()}.
-opaque 'LLVMIntPredicate'() :: {'LLVMIntPredicate',integer()}.
-opaque 'LLVMRealPredicate'() :: {'LLVMRealPredicate',integer()}.
-type 'LLVMBool'() :: integer().
%% 

-opaque 'LLVMContextRef'() :: {'LLVMContextRef',binary()}.
%% The top-level container for all LLVM global data. See the LLVMContext class. 
-opaque 'LLVMModuleRef'() :: {'LLVMModuleRef',binary()}.
%% The top-level container for all other LLVM Intermediate Representation (IR) objects. See the llvm::Module class. 
-opaque 'LLVMTypeRef'() :: {'LLVMTypeRef',binary()}.
%% Each value in the LLVM IR has a type, an LLVMTypeRef. See the llvm::Type class. 
-opaque 'LLVMTypeHandleRef'() :: {'LLVMTypeHandleRef',binary()}.
%% When building recursive types using LLVMRefineType, LLVMTypeRef values may become invalid; use LLVMTypeHandleRef to resolve this problem. See the llvm::AbstractTypeHolder class. 
-opaque 'LLVMValueRef'() :: {'LLVMValueRef',binary()}.
%% 
-opaque 'LLVMBasicBlockRef'() :: {'LLVMBasicBlockRef',binary()}.
%% 
-opaque 'LLVMBuilderRef'() :: {'LLVMBuilderRef',binary()}.
%% 
-opaque 'LLVMModuleProviderRef'() :: {'LLVMModuleProviderRef',binary()}.
%% 
-opaque 'LLVMMemoryBufferRef'() :: {'LLVMMemoryBufferRef',binary()}.
%% 
-opaque 'LLVMPassManagerRef'() :: {'LLVMPassManagerRef',binary()}.
%% See the llvm::PassManagerBase class. 
-opaque 'LLVMPassRegistryRef'() :: {'LLVMPassRegistryRef',binary()}.
%% See the llvm::PassRegistry class. 
-opaque 'LLVMUseRef'() :: {'LLVMUseRef',binary()}.
%% Used to get the users and usees of a Value. See the llvm::Use class. 
%% --- Stop generating from Core_8h.xml


load_my_nifs() ->
    erlang:load_nif(filename:join([code:priv_dir(llevm),"x86_64/llevm"]),0).

%% @@FUNCTIONS@@
%% -- Start generating from Scalar_8h.xml on {{2011,6,25},{15,38,45}}--

%% @doc See llvm::createCFGSimplificationPass function. 
-spec 'LLVMAddCFGSimplificationPass'(PM :: 'LLVMPassManagerRef'()) -> atom().
'LLVMAddCFGSimplificationPass'({'LLVMPassManagerRef',PM}) ->
	{atom,'LLVMAddCFGSimplificationPass_internal'(PM)}.
'LLVMAddCFGSimplificationPass_internal'(_PM) ->
	nif_not_loaded.

%% @doc See llvm::createGVNPass function. 
-spec 'LLVMAddGVNPass'(PM :: 'LLVMPassManagerRef'()) -> atom().
'LLVMAddGVNPass'({'LLVMPassManagerRef',PM}) ->
	{atom,'LLVMAddGVNPass_internal'(PM)}.
'LLVMAddGVNPass_internal'(_PM) ->
	nif_not_loaded.

%% @doc See llvm::createInstructionCombiningPass function. 
-spec 'LLVMAddInstructionCombiningPass'(PM :: 'LLVMPassManagerRef'()) -> atom().
'LLVMAddInstructionCombiningPass'({'LLVMPassManagerRef',PM}) ->
	{atom,'LLVMAddInstructionCombiningPass_internal'(PM)}.
'LLVMAddInstructionCombiningPass_internal'(_PM) ->
	nif_not_loaded.

%% @doc See llvm::createReassociatePass function. 
-spec 'LLVMAddReassociatePass'(PM :: 'LLVMPassManagerRef'()) -> atom().
'LLVMAddReassociatePass'({'LLVMPassManagerRef',PM}) ->
	{atom,'LLVMAddReassociatePass_internal'(PM)}.
'LLVMAddReassociatePass_internal'(_PM) ->
	nif_not_loaded.

%% --- Stop generating from Scalar_8h.xml

%% -- Start generating from IPO_8h.xml on {{2011,6,25},{15,38,45}}--

%% --- Stop generating from IPO_8h.xml

%% -- Start generating from Core_8h.xml on {{2011,6,25},{15,38,45}}--

%% @doc 
-spec 'LLVMGetGlobalContext'() -> 'LLVMContextRef'().
'LLVMGetGlobalContext'() ->
	{'LLVMContextRef','LLVMGetGlobalContext_internal'()}.
'LLVMGetGlobalContext_internal'() ->
	nif_not_loaded.

%% @doc See llvm::Module::Module. 
-spec 'LLVMModuleCreateWithName'(ModuleID :: string()) -> 'LLVMModuleRef'().
'LLVMModuleCreateWithName'(ModuleID) ->
	{'LLVMModuleRef','LLVMModuleCreateWithName_internal'(ModuleID)}.
'LLVMModuleCreateWithName_internal'(_ModuleID) ->
	nif_not_loaded.

%% @doc See Module::dump. 
-spec 'LLVMDumpModule'(M :: 'LLVMModuleRef'()) -> atom().
'LLVMDumpModule'({'LLVMModuleRef',M}) ->
	{atom,'LLVMDumpModule_internal'(M)}.
'LLVMDumpModule_internal'(_M) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMInt1TypeInContext'(C :: 'LLVMContextRef'()) -> 'LLVMTypeRef'().
'LLVMInt1TypeInContext'({'LLVMContextRef',C}) ->
	{'LLVMTypeRef','LLVMInt1TypeInContext_internal'(C)}.
'LLVMInt1TypeInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMInt8TypeInContext'(C :: 'LLVMContextRef'()) -> 'LLVMTypeRef'().
'LLVMInt8TypeInContext'({'LLVMContextRef',C}) ->
	{'LLVMTypeRef','LLVMInt8TypeInContext_internal'(C)}.
'LLVMInt8TypeInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMInt16TypeInContext'(C :: 'LLVMContextRef'()) -> 'LLVMTypeRef'().
'LLVMInt16TypeInContext'({'LLVMContextRef',C}) ->
	{'LLVMTypeRef','LLVMInt16TypeInContext_internal'(C)}.
'LLVMInt16TypeInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMInt32TypeInContext'(C :: 'LLVMContextRef'()) -> 'LLVMTypeRef'().
'LLVMInt32TypeInContext'({'LLVMContextRef',C}) ->
	{'LLVMTypeRef','LLVMInt32TypeInContext_internal'(C)}.
'LLVMInt32TypeInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMInt64TypeInContext'(C :: 'LLVMContextRef'()) -> 'LLVMTypeRef'().
'LLVMInt64TypeInContext'({'LLVMContextRef',C}) ->
	{'LLVMTypeRef','LLVMInt64TypeInContext_internal'(C)}.
'LLVMInt64TypeInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIntTypeInContext'(C :: 'LLVMContextRef'(),NumBits :: integer()) -> 'LLVMTypeRef'().
'LLVMIntTypeInContext'({'LLVMContextRef',C},NumBits) ->
	{'LLVMTypeRef','LLVMIntTypeInContext_internal'(C,NumBits)}.
'LLVMIntTypeInContext_internal'(_C,_NumBits) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMInt1Type'() -> 'LLVMTypeRef'().
'LLVMInt1Type'() ->
	{'LLVMTypeRef','LLVMInt1Type_internal'()}.
'LLVMInt1Type_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMInt8Type'() -> 'LLVMTypeRef'().
'LLVMInt8Type'() ->
	{'LLVMTypeRef','LLVMInt8Type_internal'()}.
'LLVMInt8Type_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMInt16Type'() -> 'LLVMTypeRef'().
'LLVMInt16Type'() ->
	{'LLVMTypeRef','LLVMInt16Type_internal'()}.
'LLVMInt16Type_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMInt32Type'() -> 'LLVMTypeRef'().
'LLVMInt32Type'() ->
	{'LLVMTypeRef','LLVMInt32Type_internal'()}.
'LLVMInt32Type_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMInt64Type'() -> 'LLVMTypeRef'().
'LLVMInt64Type'() ->
	{'LLVMTypeRef','LLVMInt64Type_internal'()}.
'LLVMInt64Type_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIntType'(NumBits :: integer()) -> 'LLVMTypeRef'().
'LLVMIntType'(NumBits) ->
	{'LLVMTypeRef','LLVMIntType_internal'(NumBits)}.
'LLVMIntType_internal'(_NumBits) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMFloatTypeInContext'(C :: 'LLVMContextRef'()) -> 'LLVMTypeRef'().
'LLVMFloatTypeInContext'({'LLVMContextRef',C}) ->
	{'LLVMTypeRef','LLVMFloatTypeInContext_internal'(C)}.
'LLVMFloatTypeInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMDoubleTypeInContext'(C :: 'LLVMContextRef'()) -> 'LLVMTypeRef'().
'LLVMDoubleTypeInContext'({'LLVMContextRef',C}) ->
	{'LLVMTypeRef','LLVMDoubleTypeInContext_internal'(C)}.
'LLVMDoubleTypeInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMFP128TypeInContext'(C :: 'LLVMContextRef'()) -> 'LLVMTypeRef'().
'LLVMFP128TypeInContext'({'LLVMContextRef',C}) ->
	{'LLVMTypeRef','LLVMFP128TypeInContext_internal'(C)}.
'LLVMFP128TypeInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMPPCFP128TypeInContext'(C :: 'LLVMContextRef'()) -> 'LLVMTypeRef'().
'LLVMPPCFP128TypeInContext'({'LLVMContextRef',C}) ->
	{'LLVMTypeRef','LLVMPPCFP128TypeInContext_internal'(C)}.
'LLVMPPCFP128TypeInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMFloatType'() -> 'LLVMTypeRef'().
'LLVMFloatType'() ->
	{'LLVMTypeRef','LLVMFloatType_internal'()}.
'LLVMFloatType_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMDoubleType'() -> 'LLVMTypeRef'().
'LLVMDoubleType'() ->
	{'LLVMTypeRef','LLVMDoubleType_internal'()}.
'LLVMDoubleType_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMFP128Type'() -> 'LLVMTypeRef'().
'LLVMFP128Type'() ->
	{'LLVMTypeRef','LLVMFP128Type_internal'()}.
'LLVMFP128Type_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMPPCFP128Type'() -> 'LLVMTypeRef'().
'LLVMPPCFP128Type'() ->
	{'LLVMTypeRef','LLVMPPCFP128Type_internal'()}.
'LLVMPPCFP128Type_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMFunctionType'(ReturnType :: 'LLVMTypeRef'(),ParamTypes :: tuple('LLVMTypeRef'()),ParamCount :: integer(),IsVarArg :: boolean()) -> 'LLVMTypeRef'().
'LLVMFunctionType'({'LLVMTypeRef',ReturnType},ParamTypes,ParamCount,IsVarArg) ->
	{'LLVMTypeRef','LLVMFunctionType_internal'(ReturnType,ParamTypes,ParamCount,IsVarArg)}.
'LLVMFunctionType_internal'(_ReturnType,_ParamTypes,_ParamCount,_IsVarArg) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMDumpValue'(Val :: 'LLVMValueRef'()) -> atom().
'LLVMDumpValue'({'LLVMValueRef',Val}) ->
	{atom,'LLVMDumpValue_internal'(Val)}.
'LLVMDumpValue_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstNull'(Ty :: 'LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMConstNull'({'LLVMTypeRef',Ty}) ->
	{'LLVMValueRef','LLVMConstNull_internal'(Ty)}.
'LLVMConstNull_internal'(_Ty) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstReal'(RealTy :: 'LLVMTypeRef'(),N :: float()) -> 'LLVMValueRef'().
'LLVMConstReal'({'LLVMTypeRef',RealTy},N) ->
	{'LLVMValueRef','LLVMConstReal_internal'(RealTy,N)}.
'LLVMConstReal_internal'(_RealTy,_N) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetLinkage'(Global :: 'LLVMValueRef'()) -> 'LLVMLinkage'().
'LLVMGetLinkage'({'LLVMValueRef',Global}) ->
	{'LLVMLinkage','LLVMGetLinkage_internal'(Global)}.
'LLVMGetLinkage_internal'(_Global) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMSetLinkage'(Global :: 'LLVMValueRef'(),Linkage :: 'LLVMLinkage'()) -> atom().
'LLVMSetLinkage'({'LLVMValueRef',Global},{'LLVMLinkage',Linkage}) ->
	{atom,'LLVMSetLinkage_internal'(Global,Linkage)}.
'LLVMSetLinkage_internal'(_Global,_Linkage) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMAddFunction'(M :: 'LLVMModuleRef'(),Name :: string(),FunctionTy :: 'LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMAddFunction'({'LLVMModuleRef',M},Name,{'LLVMTypeRef',FunctionTy}) ->
	{'LLVMValueRef','LLVMAddFunction_internal'(M,Name,FunctionTy)}.
'LLVMAddFunction_internal'(_M,_Name,_FunctionTy) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetNamedFunction'(M :: 'LLVMModuleRef'(),Name :: string()) -> 'LLVMValueRef'().
'LLVMGetNamedFunction'({'LLVMModuleRef',M},Name) ->
	{'LLVMValueRef','LLVMGetNamedFunction_internal'(M,Name)}.
'LLVMGetNamedFunction_internal'(_M,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetParam'(Fn :: 'LLVMValueRef'(),Index :: integer()) -> 'LLVMValueRef'().
'LLVMGetParam'({'LLVMValueRef',Fn},Index) ->
	{'LLVMValueRef','LLVMGetParam_internal'(Fn,Index)}.
'LLVMGetParam_internal'(_Fn,_Index) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetBasicBlockParent'(BB :: 'LLVMBasicBlockRef'()) -> 'LLVMValueRef'().
'LLVMGetBasicBlockParent'({'LLVMBasicBlockRef',BB}) ->
	{'LLVMValueRef','LLVMGetBasicBlockParent_internal'(BB)}.
'LLVMGetBasicBlockParent_internal'(_BB) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMAppendBasicBlock'(Fn :: 'LLVMValueRef'(),Name :: string()) -> 'LLVMBasicBlockRef'().
'LLVMAppendBasicBlock'({'LLVMValueRef',Fn},Name) ->
	{'LLVMBasicBlockRef','LLVMAppendBasicBlock_internal'(Fn,Name)}.
'LLVMAppendBasicBlock_internal'(_Fn,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMAddIncoming'(PhiNode :: 'LLVMValueRef'(),IncomingValues :: tuple('LLVMValueRef'()),IncomingBlocks :: tuple('LLVMBasicBlockRef'()),Count :: integer()) -> atom().
'LLVMAddIncoming'({'LLVMValueRef',PhiNode},IncomingValues,IncomingBlocks,Count) ->
	{atom,'LLVMAddIncoming_internal'(PhiNode,IncomingValues,IncomingBlocks,Count)}.
'LLVMAddIncoming_internal'(_PhiNode,_IncomingValues,_IncomingBlocks,_Count) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMCreateBuilderInContext'(C :: 'LLVMContextRef'()) -> 'LLVMBuilderRef'().
'LLVMCreateBuilderInContext'({'LLVMContextRef',C}) ->
	{'LLVMBuilderRef','LLVMCreateBuilderInContext_internal'(C)}.
'LLVMCreateBuilderInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMPositionBuilderAtEnd'(Builder :: 'LLVMBuilderRef'(),Block :: 'LLVMBasicBlockRef'()) -> atom().
'LLVMPositionBuilderAtEnd'({'LLVMBuilderRef',Builder},{'LLVMBasicBlockRef',Block}) ->
	{atom,'LLVMPositionBuilderAtEnd_internal'(Builder,Block)}.
'LLVMPositionBuilderAtEnd_internal'(_Builder,_Block) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetInsertBlock'(Builder :: 'LLVMBuilderRef'()) -> 'LLVMBasicBlockRef'().
'LLVMGetInsertBlock'({'LLVMBuilderRef',Builder}) ->
	{'LLVMBasicBlockRef','LLVMGetInsertBlock_internal'(Builder)}.
'LLVMGetInsertBlock_internal'(_Builder) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildRet'(B :: 'LLVMBuilderRef'(),V :: 'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMBuildRet'({'LLVMBuilderRef',B},{'LLVMValueRef',V}) ->
	{'LLVMValueRef','LLVMBuildRet_internal'(B,V)}.
'LLVMBuildRet_internal'(_B,_V) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildBr'(B :: 'LLVMBuilderRef'(),Dest :: 'LLVMBasicBlockRef'()) -> 'LLVMValueRef'().
'LLVMBuildBr'({'LLVMBuilderRef',B},{'LLVMBasicBlockRef',Dest}) ->
	{'LLVMValueRef','LLVMBuildBr_internal'(B,Dest)}.
'LLVMBuildBr_internal'(_B,_Dest) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildCondBr'(B :: 'LLVMBuilderRef'(),If :: 'LLVMValueRef'(),Then :: 'LLVMBasicBlockRef'(),Else :: 'LLVMBasicBlockRef'()) -> 'LLVMValueRef'().
'LLVMBuildCondBr'({'LLVMBuilderRef',B},{'LLVMValueRef',If},{'LLVMBasicBlockRef',Then},{'LLVMBasicBlockRef',Else}) ->
	{'LLVMValueRef','LLVMBuildCondBr_internal'(B,If,Then,Else)}.
'LLVMBuildCondBr_internal'(_B,_If,_Then,_Else) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildFAdd'(B :: 'LLVMBuilderRef'(),LHS :: 'LLVMValueRef'(),RHS :: 'LLVMValueRef'(),Name :: string()) -> 'LLVMValueRef'().
'LLVMBuildFAdd'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	{'LLVMValueRef','LLVMBuildFAdd_internal'(B,LHS,RHS,Name)}.
'LLVMBuildFAdd_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildFSub'(B :: 'LLVMBuilderRef'(),LHS :: 'LLVMValueRef'(),RHS :: 'LLVMValueRef'(),Name :: string()) -> 'LLVMValueRef'().
'LLVMBuildFSub'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	{'LLVMValueRef','LLVMBuildFSub_internal'(B,LHS,RHS,Name)}.
'LLVMBuildFSub_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildFMul'(B :: 'LLVMBuilderRef'(),LHS :: 'LLVMValueRef'(),RHS :: 'LLVMValueRef'(),Name :: string()) -> 'LLVMValueRef'().
'LLVMBuildFMul'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	{'LLVMValueRef','LLVMBuildFMul_internal'(B,LHS,RHS,Name)}.
'LLVMBuildFMul_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildUIToFP'(B :: 'LLVMBuilderRef'(),Val :: 'LLVMValueRef'(),DestTy :: 'LLVMTypeRef'(),Name :: string()) -> 'LLVMValueRef'().
'LLVMBuildUIToFP'({'LLVMBuilderRef',B},{'LLVMValueRef',Val},{'LLVMTypeRef',DestTy},Name) ->
	{'LLVMValueRef','LLVMBuildUIToFP_internal'(B,Val,DestTy,Name)}.
'LLVMBuildUIToFP_internal'(_B,_Val,_DestTy,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildFCmp'(B :: 'LLVMBuilderRef'(),Op :: 'LLVMRealPredicate'(),LHS :: 'LLVMValueRef'(),RHS :: 'LLVMValueRef'(),Name :: string()) -> 'LLVMValueRef'().
'LLVMBuildFCmp'({'LLVMBuilderRef',B},{'LLVMRealPredicate',Op},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	{'LLVMValueRef','LLVMBuildFCmp_internal'(B,Op,LHS,RHS,Name)}.
'LLVMBuildFCmp_internal'(_B,_Op,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildPhi'(B :: 'LLVMBuilderRef'(),Ty :: 'LLVMTypeRef'(),Name :: string()) -> 'LLVMValueRef'().
'LLVMBuildPhi'({'LLVMBuilderRef',B},{'LLVMTypeRef',Ty},Name) ->
	{'LLVMValueRef','LLVMBuildPhi_internal'(B,Ty,Name)}.
'LLVMBuildPhi_internal'(_B,_Ty,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildCall'(B :: 'LLVMBuilderRef'(),Fn :: 'LLVMValueRef'(),Args :: tuple('LLVMValueRef'()),NumArgs :: integer(),Name :: string()) -> 'LLVMValueRef'().
'LLVMBuildCall'({'LLVMBuilderRef',B},{'LLVMValueRef',Fn},Args,NumArgs,Name) ->
	{'LLVMValueRef','LLVMBuildCall_internal'(B,Fn,Args,NumArgs,Name)}.
'LLVMBuildCall_internal'(_B,_Fn,_Args,_NumArgs,_Name) ->
	nif_not_loaded.

%% @doc Constructs a new function-by-function pass pipeline over the module provider. It does not take ownership of the module provider. This type of pipeline is suitable for code generation and JIT compilation tasks. See llvm::FunctionPassManager::FunctionPassManager. 
-spec 'LLVMCreateFunctionPassManagerForModule'(M :: 'LLVMModuleRef'()) -> 'LLVMPassManagerRef'().
'LLVMCreateFunctionPassManagerForModule'({'LLVMModuleRef',M}) ->
	{'LLVMPassManagerRef','LLVMCreateFunctionPassManagerForModule_internal'(M)}.
'LLVMCreateFunctionPassManagerForModule_internal'(_M) ->
	nif_not_loaded.

%% @doc Initializes, executes on the provided module, and finalizes all of the passes scheduled in the pass manager. Returns 1 if any of the passes modified the module, 0 otherwise. See llvm::PassManager::run(Module&amp;). 
-spec 'LLVMRunPassManager'(PM :: 'LLVMPassManagerRef'(),M :: 'LLVMModuleRef'()) -> boolean().
'LLVMRunPassManager'({'LLVMPassManagerRef',PM},{'LLVMModuleRef',M}) ->
	{boolean,'LLVMRunPassManager_internal'(PM,M)}.
'LLVMRunPassManager_internal'(_PM,_M) ->
	nif_not_loaded.

%% @doc Initializes all of the function passes scheduled in the function pass manager. Returns 1 if any of the passes modified the module, 0 otherwise. See llvm::FunctionPassManager::doInitialization. 
-spec 'LLVMInitializeFunctionPassManager'(FPM :: 'LLVMPassManagerRef'()) -> boolean().
'LLVMInitializeFunctionPassManager'({'LLVMPassManagerRef',FPM}) ->
	{boolean,'LLVMInitializeFunctionPassManager_internal'(FPM)}.
'LLVMInitializeFunctionPassManager_internal'(_FPM) ->
	nif_not_loaded.

%% @doc Executes all of the function passes scheduled in the function pass manager on the provided function. Returns 1 if any of the passes modified the function, false otherwise. See llvm::FunctionPassManager::run(Function&amp;). 
-spec 'LLVMRunFunctionPassManager'(FPM :: 'LLVMPassManagerRef'(),F :: 'LLVMValueRef'()) -> boolean().
'LLVMRunFunctionPassManager'({'LLVMPassManagerRef',FPM},{'LLVMValueRef',F}) ->
	{boolean,'LLVMRunFunctionPassManager_internal'(FPM,F)}.
'LLVMRunFunctionPassManager_internal'(_FPM,_F) ->
	nif_not_loaded.

%% @doc Finalizes all of the function passes scheduled in in the function pass manager. Returns 1 if any of the passes modified the module, 0 otherwise. See llvm::FunctionPassManager::doFinalization. 
-spec 'LLVMFinalizeFunctionPassManager'(FPM :: 'LLVMPassManagerRef'()) -> boolean().
'LLVMFinalizeFunctionPassManager'({'LLVMPassManagerRef',FPM}) ->
	{boolean,'LLVMFinalizeFunctionPassManager_internal'(FPM)}.
'LLVMFinalizeFunctionPassManager_internal'(_FPM) ->
	nif_not_loaded.

%% --- Stop generating from Core_8h.xml

