-module(llevm).

-include("llevm.hrl").

-on_load(load_my_nifs/0).

%% -- Start generating from Core_8h.xml on {{2011,6,19},{2,27,32}}--

-export(['LLVMGetGlobalContext'/0]).
-export(['LLVMModuleCreateWithName'/1]).
-export(['LLVMDumpModule'/1]).
-export(['LLVMDoubleType'/0]).
-export(['LLVMFunctionType'/4]).
-export(['LLVMConstReal'/2]).
-export(['LLVMAddFunction'/3]).
-export(['LLVMAppendBasicBlockInContext'/3]).
-export(['LLVMCreateBuilderInContext'/1]).
-export(['LLVMBuildRet'/2]).
%% --- Stop generating from Core_8h.xml


-type llvm_ptr(Base) :: {llvm_ptr, Base}.

%% -- Start generating from Core_8h.xml on {{2011,6,19},{2,27,32}}--

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

%% -- Start generating from Core_8h.xml on {{2011,6,19},{2,27,32}}--

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
-spec 'LLVMDoubleType'() -> 'LLVMTypeRef'().
'LLVMDoubleType'() ->
	{'LLVMTypeRef','LLVMDoubleType_internal'()}.
'LLVMDoubleType_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMFunctionType'(ReturnType :: 'LLVMTypeRef'(),ParamTypes :: tuple('LLVMTypeRef'()),ParamCount :: integer(),IsVarArg :: boolean()) -> 'LLVMTypeRef'().
'LLVMFunctionType'({'LLVMTypeRef',ReturnType},ParamTypes,ParamCount,IsVarArg) ->
	{'LLVMTypeRef','LLVMFunctionType_internal'(ReturnType,ParamTypes,ParamCount,IsVarArg)}.
'LLVMFunctionType_internal'(_ReturnType,_ParamTypes,_ParamCount,_IsVarArg) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstReal'(RealTy :: 'LLVMTypeRef'(),N :: float()) -> 'LLVMValueRef'().
'LLVMConstReal'({'LLVMTypeRef',RealTy},N) ->
	{'LLVMValueRef','LLVMConstReal_internal'(RealTy,N)}.
'LLVMConstReal_internal'(_RealTy,_N) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMAddFunction'(M :: 'LLVMModuleRef'(),Name :: string(),FunctionTy :: 'LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMAddFunction'({'LLVMModuleRef',M},Name,{'LLVMTypeRef',FunctionTy}) ->
	{'LLVMValueRef','LLVMAddFunction_internal'(M,Name,FunctionTy)}.
'LLVMAddFunction_internal'(_M,_Name,_FunctionTy) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMAppendBasicBlockInContext'(C :: 'LLVMContextRef'(),Fn :: 'LLVMValueRef'(),Name :: string()) -> 'LLVMBasicBlockRef'().
'LLVMAppendBasicBlockInContext'({'LLVMContextRef',C},{'LLVMValueRef',Fn},Name) ->
	{'LLVMBasicBlockRef','LLVMAppendBasicBlockInContext_internal'(C,Fn,Name)}.
'LLVMAppendBasicBlockInContext_internal'(_C,_Fn,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMCreateBuilderInContext'(C :: 'LLVMContextRef'()) -> 'LLVMBuilderRef'().
'LLVMCreateBuilderInContext'({'LLVMContextRef',C}) ->
	{'LLVMBuilderRef','LLVMCreateBuilderInContext_internal'(C)}.
'LLVMCreateBuilderInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildRet'(B :: 'LLVMBuilderRef'(),V :: 'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMBuildRet'({'LLVMBuilderRef',B},{'LLVMValueRef',V}) ->
	{'LLVMValueRef','LLVMBuildRet_internal'(B,V)}.
'LLVMBuildRet_internal'(_B,_V) ->
	nif_not_loaded.

%% --- Stop generating from Core_8h.xml

