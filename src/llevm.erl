-module(llevm).

%% -- Start generating from Core_8h.xml on {{2011,6,18},{18,1,28}}--

-export(['LLVMDisposeMessage'/1]).
-export(['LLVMContextCreate'/0]).
-export(['LLVMGetGlobalContext'/0]).
-export(['LLVMContextDispose'/1]).
-export(['LLVMGetMDKindIDInContext'/3]).
-export(['LLVMGetMDKindID'/2]).
-export(['LLVMModuleCreateWithName'/1]).
-export(['LLVMModuleCreateWithNameInContext'/2]).
-export(['LLVMDisposeModule'/1]).
-export(['LLVMGetDataLayout'/1]).
-export(['LLVMSetDataLayout'/2]).
-export(['LLVMGetTarget'/1]).
-export(['LLVMSetTarget'/2]).
-export(['LLVMAddTypeName'/3]).
-export(['LLVMDeleteTypeName'/2]).
-export(['LLVMGetTypeByName'/2]).
-export(['LLVMGetTypeName'/2]).
-export(['LLVMDumpModule'/1]).
-export(['LLVMSetModuleInlineAsm'/2]).
-export(['LLVMGetModuleContext'/1]).
-export(['LLVMGetTypeKind'/1]).
-export(['LLVMGetTypeContext'/1]).
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
-export(['LLVMGetIntTypeWidth'/1]).
-export(['LLVMFloatTypeInContext'/1]).
-export(['LLVMDoubleTypeInContext'/1]).
-export(['LLVMX86FP80TypeInContext'/1]).
-export(['LLVMFP128TypeInContext'/1]).
-export(['LLVMPPCFP128TypeInContext'/1]).
-export(['LLVMFloatType'/0]).
-export(['LLVMDoubleType'/0]).
-export(['LLVMX86FP80Type'/0]).
-export(['LLVMFP128Type'/0]).
-export(['LLVMPPCFP128Type'/0]).
-export(['LLVMFunctionType'/4]).
-export(['LLVMIsFunctionVarArg'/1]).
-export(['LLVMGetReturnType'/1]).
-export(['LLVMCountParamTypes'/1]).
-export(['LLVMGetParamTypes'/2]).
-export(['LLVMStructTypeInContext'/4]).
-export(['LLVMStructType'/3]).
-export(['LLVMCountStructElementTypes'/1]).
-export(['LLVMGetStructElementTypes'/2]).
-export(['LLVMIsPackedStruct'/1]).
-export(['LLVMArrayType'/2]).
-export(['LLVMPointerType'/2]).
-export(['LLVMVectorType'/2]).
-export(['LLVMGetElementType'/1]).
-export(['LLVMGetArrayLength'/1]).
-export(['LLVMGetPointerAddressSpace'/1]).
-export(['LLVMGetVectorSize'/1]).
-export(['LLVMVoidTypeInContext'/1]).
-export(['LLVMLabelTypeInContext'/1]).
-export(['LLVMOpaqueTypeInContext'/1]).
-export(['LLVMX86MMXTypeInContext'/1]).
-export(['LLVMVoidType'/0]).
-export(['LLVMLabelType'/0]).
-export(['LLVMOpaqueType'/0]).
-export(['LLVMX86MMXType'/0]).
-export(['LLVMCreateTypeHandle'/1]).
-export(['LLVMRefineType'/2]).
-export(['LLVMResolveTypeHandle'/1]).
-export(['LLVMDisposeTypeHandle'/1]).
-export(['LLVMTypeOf'/1]).
-export(['LLVMGetValueName'/1]).
-export(['LLVMSetValueName'/2]).
-export(['LLVMDumpValue'/1]).
-export(['LLVMReplaceAllUsesWith'/2]).
-export(['LLVMHasMetadata'/1]).
-export(['LLVMGetMetadata'/2]).
-export(['LLVMSetMetadata'/3]).
-export(['LLVMIsAArgument'/1]).
-export(['LLVMIsABasicBlock'/1]).
-export(['LLVMIsAInlineAsm'/1]).
-export(['LLVMIsAUser'/1]).
-export(['LLVMIsAConstant'/1]).
-export(['LLVMIsAConstantAggregateZero'/1]).
-export(['LLVMIsAConstantArray'/1]).
-export(['LLVMIsAConstantExpr'/1]).
-export(['LLVMIsAConstantFP'/1]).
-export(['LLVMIsAConstantInt'/1]).
-export(['LLVMIsAConstantPointerNull'/1]).
-export(['LLVMIsAConstantStruct'/1]).
-export(['LLVMIsAConstantVector'/1]).
-export(['LLVMIsAGlobalValue'/1]).
-export(['LLVMIsAFunction'/1]).
-export(['LLVMIsAGlobalAlias'/1]).
-export(['LLVMIsAGlobalVariable'/1]).
-export(['LLVMIsAUndefValue'/1]).
-export(['LLVMIsAInstruction'/1]).
-export(['LLVMIsABinaryOperator'/1]).
-export(['LLVMIsACallInst'/1]).
-export(['LLVMIsAIntrinsicInst'/1]).
-export(['LLVMIsADbgInfoIntrinsic'/1]).
-export(['LLVMIsADbgDeclareInst'/1]).
-export(['LLVMIsAEHSelectorInst'/1]).
-export(['LLVMIsAMemIntrinsic'/1]).
-export(['LLVMIsAMemCpyInst'/1]).
-export(['LLVMIsAMemMoveInst'/1]).
-export(['LLVMIsAMemSetInst'/1]).
-export(['LLVMIsACmpInst'/1]).
-export(['LLVMIsAFCmpInst'/1]).
-export(['LLVMIsAICmpInst'/1]).
-export(['LLVMIsAExtractElementInst'/1]).
-export(['LLVMIsAGetElementPtrInst'/1]).
-export(['LLVMIsAInsertElementInst'/1]).
-export(['LLVMIsAInsertValueInst'/1]).
-export(['LLVMIsAPHINode'/1]).
-export(['LLVMIsASelectInst'/1]).
-export(['LLVMIsAShuffleVectorInst'/1]).
-export(['LLVMIsAStoreInst'/1]).
-export(['LLVMIsATerminatorInst'/1]).
-export(['LLVMIsABranchInst'/1]).
-export(['LLVMIsAInvokeInst'/1]).
-export(['LLVMIsAReturnInst'/1]).
-export(['LLVMIsASwitchInst'/1]).
-export(['LLVMIsAUnreachableInst'/1]).
-export(['LLVMIsAUnwindInst'/1]).
-export(['LLVMIsAUnaryInstruction'/1]).
-export(['LLVMIsAAllocaInst'/1]).
-export(['LLVMIsACastInst'/1]).
-export(['LLVMIsABitCastInst'/1]).
-export(['LLVMIsAFPExtInst'/1]).
-export(['LLVMIsAFPToSIInst'/1]).
-export(['LLVMIsAFPToUIInst'/1]).
-export(['LLVMIsAFPTruncInst'/1]).
-export(['LLVMIsAIntToPtrInst'/1]).
-export(['LLVMIsAPtrToIntInst'/1]).
-export(['LLVMIsASExtInst'/1]).
-export(['LLVMIsASIToFPInst'/1]).
-export(['LLVMIsATruncInst'/1]).
-export(['LLVMIsAUIToFPInst'/1]).
-export(['LLVMIsAZExtInst'/1]).
-export(['LLVMIsAExtractValueInst'/1]).
-export(['LLVMIsALoadInst'/1]).
-export(['LLVMIsAVAArgInst'/1]).
-export(['LLVMGetFirstUse'/1]).
-export(['LLVMGetNextUse'/1]).
-export(['LLVMGetUser'/1]).
-export(['LLVMGetUsedValue'/1]).
-export(['LLVMGetOperand'/2]).
-export(['LLVMSetOperand'/3]).
-export(['LLVMGetNumOperands'/1]).
-export(['LLVMConstNull'/1]).
-export(['LLVMConstAllOnes'/1]).
-export(['LLVMGetUndef'/1]).
-export(['LLVMIsConstant'/1]).
-export(['LLVMIsNull'/1]).
-export(['LLVMIsUndef'/1]).
-export(['LLVMConstPointerNull'/1]).
-export(['LLVMMDStringInContext'/3]).
-export(['LLVMMDString'/2]).
-export(['LLVMMDNodeInContext'/3]).
-export(['LLVMMDNode'/2]).
-export(['LLVMConstInt'/3]).
-export(['LLVMConstIntOfArbitraryPrecision'/3]).
-export(['LLVMConstIntOfString'/3]).
-export(['LLVMConstIntOfStringAndSize'/4]).
-export(['LLVMConstReal'/2]).
-export(['LLVMConstRealOfString'/2]).
-export(['LLVMConstRealOfStringAndSize'/3]).
-export(['LLVMConstIntGetZExtValue'/1]).
-export(['LLVMConstIntGetSExtValue'/1]).
-export(['LLVMConstStringInContext'/4]).
-export(['LLVMConstStructInContext'/4]).
-export(['LLVMConstString'/3]).
-export(['LLVMConstArray'/3]).
-export(['LLVMConstStruct'/3]).
-export(['LLVMConstVector'/2]).
-export(['LLVMGetConstOpcode'/1]).
-export(['LLVMAlignOf'/1]).
-export(['LLVMSizeOf'/1]).
-export(['LLVMConstNeg'/1]).
-export(['LLVMConstNSWNeg'/1]).
-export(['LLVMConstNUWNeg'/1]).
-export(['LLVMConstFNeg'/1]).
-export(['LLVMConstNot'/1]).
-export(['LLVMConstAdd'/2]).
-export(['LLVMConstNSWAdd'/2]).
-export(['LLVMConstNUWAdd'/2]).
-export(['LLVMConstFAdd'/2]).
-export(['LLVMConstSub'/2]).
-export(['LLVMConstNSWSub'/2]).
-export(['LLVMConstNUWSub'/2]).
-export(['LLVMConstFSub'/2]).
-export(['LLVMConstMul'/2]).
-export(['LLVMConstNSWMul'/2]).
-export(['LLVMConstNUWMul'/2]).
-export(['LLVMConstFMul'/2]).
-export(['LLVMConstUDiv'/2]).
-export(['LLVMConstSDiv'/2]).
-export(['LLVMConstExactSDiv'/2]).
-export(['LLVMConstFDiv'/2]).
-export(['LLVMConstURem'/2]).
-export(['LLVMConstSRem'/2]).
-export(['LLVMConstFRem'/2]).
-export(['LLVMConstAnd'/2]).
-export(['LLVMConstOr'/2]).
-export(['LLVMConstXor'/2]).
-export(['LLVMConstICmp'/3]).
-export(['LLVMConstFCmp'/3]).
-export(['LLVMConstShl'/2]).
-export(['LLVMConstLShr'/2]).
-export(['LLVMConstAShr'/2]).
-export(['LLVMConstGEP'/3]).
-export(['LLVMConstInBoundsGEP'/3]).
-export(['LLVMConstTrunc'/2]).
-export(['LLVMConstSExt'/2]).
-export(['LLVMConstZExt'/2]).
-export(['LLVMConstFPTrunc'/2]).
-export(['LLVMConstFPExt'/2]).
-export(['LLVMConstUIToFP'/2]).
-export(['LLVMConstSIToFP'/2]).
-export(['LLVMConstFPToUI'/2]).
-export(['LLVMConstFPToSI'/2]).
-export(['LLVMConstPtrToInt'/2]).
-export(['LLVMConstIntToPtr'/2]).
-export(['LLVMConstBitCast'/2]).
-export(['LLVMConstZExtOrBitCast'/2]).
-export(['LLVMConstSExtOrBitCast'/2]).
-export(['LLVMConstTruncOrBitCast'/2]).
-export(['LLVMConstPointerCast'/2]).
-export(['LLVMConstIntCast'/3]).
-export(['LLVMConstFPCast'/2]).
-export(['LLVMConstSelect'/3]).
-export(['LLVMConstExtractElement'/2]).
-export(['LLVMConstInsertElement'/3]).
-export(['LLVMConstShuffleVector'/3]).
-export(['LLVMConstExtractValue'/3]).
-export(['LLVMConstInsertValue'/4]).
-export(['LLVMConstInlineAsm'/5]).
-export(['LLVMBlockAddress'/2]).
-export(['LLVMGetGlobalParent'/1]).
-export(['LLVMIsDeclaration'/1]).
-export(['LLVMGetLinkage'/1]).
-export(['LLVMSetLinkage'/2]).
-export(['LLVMGetSection'/1]).
-export(['LLVMSetSection'/2]).
-export(['LLVMGetVisibility'/1]).
-export(['LLVMSetVisibility'/2]).
-export(['LLVMGetAlignment'/1]).
-export(['LLVMSetAlignment'/2]).
-export(['LLVMAddGlobal'/3]).
-export(['LLVMAddGlobalInAddressSpace'/4]).
-export(['LLVMGetNamedGlobal'/2]).
-export(['LLVMGetFirstGlobal'/1]).
-export(['LLVMGetLastGlobal'/1]).
-export(['LLVMGetNextGlobal'/1]).
-export(['LLVMGetPreviousGlobal'/1]).
-export(['LLVMDeleteGlobal'/1]).
-export(['LLVMGetInitializer'/1]).
-export(['LLVMSetInitializer'/2]).
-export(['LLVMIsThreadLocal'/1]).
-export(['LLVMSetThreadLocal'/2]).
-export(['LLVMIsGlobalConstant'/1]).
-export(['LLVMSetGlobalConstant'/2]).
-export(['LLVMAddAlias'/4]).
-export(['LLVMAddFunction'/3]).
-export(['LLVMGetNamedFunction'/2]).
-export(['LLVMGetFirstFunction'/1]).
-export(['LLVMGetLastFunction'/1]).
-export(['LLVMGetNextFunction'/1]).
-export(['LLVMGetPreviousFunction'/1]).
-export(['LLVMDeleteFunction'/1]).
-export(['LLVMGetIntrinsicID'/1]).
-export(['LLVMGetFunctionCallConv'/1]).
-export(['LLVMSetFunctionCallConv'/2]).
-export(['LLVMGetGC'/1]).
-export(['LLVMSetGC'/2]).
-export(['LLVMAddFunctionAttr'/2]).
-export(['LLVMGetFunctionAttr'/1]).
-export(['LLVMRemoveFunctionAttr'/2]).
-export(['LLVMCountParams'/1]).
-export(['LLVMGetParams'/2]).
-export(['LLVMGetParam'/2]).
-export(['LLVMGetParamParent'/1]).
-export(['LLVMGetFirstParam'/1]).
-export(['LLVMGetLastParam'/1]).
-export(['LLVMGetNextParam'/1]).
-export(['LLVMGetPreviousParam'/1]).
-export(['LLVMAddAttribute'/2]).
-export(['LLVMRemoveAttribute'/2]).
-export(['LLVMGetAttribute'/1]).
-export(['LLVMSetParamAlignment'/2]).
-export(['LLVMBasicBlockAsValue'/1]).
-export(['LLVMValueIsBasicBlock'/1]).
-export(['LLVMValueAsBasicBlock'/1]).
-export(['LLVMGetBasicBlockParent'/1]).
-export(['LLVMCountBasicBlocks'/1]).
-export(['LLVMGetBasicBlocks'/2]).
-export(['LLVMGetFirstBasicBlock'/1]).
-export(['LLVMGetLastBasicBlock'/1]).
-export(['LLVMGetNextBasicBlock'/1]).
-export(['LLVMGetPreviousBasicBlock'/1]).
-export(['LLVMGetEntryBasicBlock'/1]).
-export(['LLVMAppendBasicBlockInContext'/3]).
-export(['LLVMInsertBasicBlockInContext'/3]).
-export(['LLVMAppendBasicBlock'/2]).
-export(['LLVMInsertBasicBlock'/2]).
-export(['LLVMDeleteBasicBlock'/1]).
-export(['LLVMMoveBasicBlockBefore'/2]).
-export(['LLVMMoveBasicBlockAfter'/2]).
-export(['LLVMGetInstructionParent'/1]).
-export(['LLVMGetFirstInstruction'/1]).
-export(['LLVMGetLastInstruction'/1]).
-export(['LLVMGetNextInstruction'/1]).
-export(['LLVMGetPreviousInstruction'/1]).
-export(['LLVMSetInstructionCallConv'/2]).
-export(['LLVMGetInstructionCallConv'/1]).
-export(['LLVMAddInstrAttribute'/3]).
-export(['LLVMRemoveInstrAttribute'/3]).
-export(['LLVMSetInstrParamAlignment'/3]).
-export(['LLVMIsTailCall'/1]).
-export(['LLVMSetTailCall'/2]).
-export(['LLVMAddIncoming'/4]).
-export(['LLVMCountIncoming'/1]).
-export(['LLVMGetIncomingValue'/2]).
-export(['LLVMGetIncomingBlock'/2]).
-export(['LLVMCreateBuilderInContext'/1]).
-export(['LLVMCreateBuilder'/0]).
-export(['LLVMPositionBuilder'/3]).
-export(['LLVMPositionBuilderBefore'/2]).
-export(['LLVMPositionBuilderAtEnd'/2]).
-export(['LLVMGetInsertBlock'/1]).
-export(['LLVMClearInsertionPosition'/1]).
-export(['LLVMInsertIntoBuilder'/2]).
-export(['LLVMInsertIntoBuilderWithName'/3]).
-export(['LLVMDisposeBuilder'/1]).
-export(['LLVMSetCurrentDebugLocation'/2]).
-export(['LLVMGetCurrentDebugLocation'/1]).
-export(['LLVMSetInstDebugLocation'/2]).
-export(['LLVMBuildRetVoid'/1]).
-export(['LLVMBuildRet'/2]).
-export(['LLVMBuildAggregateRet'/3]).
-export(['LLVMBuildBr'/2]).
-export(['LLVMBuildCondBr'/4]).
-export(['LLVMBuildSwitch'/4]).
-export(['LLVMBuildIndirectBr'/3]).
-export(['LLVMBuildInvoke'/7]).
-export(['LLVMBuildUnwind'/1]).
-export(['LLVMBuildUnreachable'/1]).
-export(['LLVMAddCase'/3]).
-export(['LLVMAddDestination'/2]).
-export(['LLVMBuildAdd'/4]).
-export(['LLVMBuildNSWAdd'/4]).
-export(['LLVMBuildNUWAdd'/4]).
-export(['LLVMBuildFAdd'/4]).
-export(['LLVMBuildSub'/4]).
-export(['LLVMBuildNSWSub'/4]).
-export(['LLVMBuildNUWSub'/4]).
-export(['LLVMBuildFSub'/4]).
-export(['LLVMBuildMul'/4]).
-export(['LLVMBuildNSWMul'/4]).
-export(['LLVMBuildNUWMul'/4]).
-export(['LLVMBuildFMul'/4]).
-export(['LLVMBuildUDiv'/4]).
-export(['LLVMBuildSDiv'/4]).
-export(['LLVMBuildExactSDiv'/4]).
-export(['LLVMBuildFDiv'/4]).
-export(['LLVMBuildURem'/4]).
-export(['LLVMBuildSRem'/4]).
-export(['LLVMBuildFRem'/4]).
-export(['LLVMBuildShl'/4]).
-export(['LLVMBuildLShr'/4]).
-export(['LLVMBuildAShr'/4]).
-export(['LLVMBuildAnd'/4]).
-export(['LLVMBuildOr'/4]).
-export(['LLVMBuildXor'/4]).
-export(['LLVMBuildBinOp'/5]).
-export(['LLVMBuildNeg'/3]).
-export(['LLVMBuildNSWNeg'/3]).
-export(['LLVMBuildNUWNeg'/3]).
-export(['LLVMBuildFNeg'/3]).
-export(['LLVMBuildNot'/3]).
-export(['LLVMBuildMalloc'/3]).
-export(['LLVMBuildArrayMalloc'/4]).
-export(['LLVMBuildAlloca'/3]).
-export(['LLVMBuildArrayAlloca'/4]).
-export(['LLVMBuildFree'/2]).
-export(['LLVMBuildLoad'/3]).
-export(['LLVMBuildStore'/3]).
-export(['LLVMBuildGEP'/5]).
-export(['LLVMBuildInBoundsGEP'/5]).
-export(['LLVMBuildStructGEP'/4]).
-export(['LLVMBuildGlobalString'/3]).
-export(['LLVMBuildGlobalStringPtr'/3]).
-export(['LLVMBuildTrunc'/4]).
-export(['LLVMBuildZExt'/4]).
-export(['LLVMBuildSExt'/4]).
-export(['LLVMBuildFPToUI'/4]).
-export(['LLVMBuildFPToSI'/4]).
-export(['LLVMBuildUIToFP'/4]).
-export(['LLVMBuildSIToFP'/4]).
-export(['LLVMBuildFPTrunc'/4]).
-export(['LLVMBuildFPExt'/4]).
-export(['LLVMBuildPtrToInt'/4]).
-export(['LLVMBuildIntToPtr'/4]).
-export(['LLVMBuildBitCast'/4]).
-export(['LLVMBuildZExtOrBitCast'/4]).
-export(['LLVMBuildSExtOrBitCast'/4]).
-export(['LLVMBuildTruncOrBitCast'/4]).
-export(['LLVMBuildCast'/5]).
-export(['LLVMBuildPointerCast'/4]).
-export(['LLVMBuildIntCast'/4]).
-export(['LLVMBuildFPCast'/4]).
-export(['LLVMBuildICmp'/5]).
-export(['LLVMBuildFCmp'/5]).
-export(['LLVMBuildPhi'/3]).
-export(['LLVMBuildCall'/5]).
-export(['LLVMBuildSelect'/5]).
-export(['LLVMBuildVAArg'/4]).
-export(['LLVMBuildExtractElement'/4]).
-export(['LLVMBuildInsertElement'/5]).
-export(['LLVMBuildShuffleVector'/5]).
-export(['LLVMBuildExtractValue'/4]).
-export(['LLVMBuildInsertValue'/5]).
-export(['LLVMBuildIsNull'/3]).
-export(['LLVMBuildIsNotNull'/3]).
-export(['LLVMBuildPtrDiff'/4]).
-export(['LLVMCreateModuleProviderForExistingModule'/1]).
-export(['LLVMDisposeModuleProvider'/1]).
-export(['LLVMCreateMemoryBufferWithContentsOfFile'/3]).
-export(['LLVMCreateMemoryBufferWithSTDIN'/2]).
-export(['LLVMDisposeMemoryBuffer'/1]).
-export(['LLVMGetGlobalPassRegistry'/0]).
-export(['LLVMCreatePassManager'/0]).
-export(['LLVMCreateFunctionPassManagerForModule'/1]).
-export(['LLVMCreateFunctionPassManager'/1]).
-export(['LLVMRunPassManager'/2]).
-export(['LLVMInitializeFunctionPassManager'/1]).
-export(['LLVMRunFunctionPassManager'/2]).
-export(['LLVMFinalizeFunctionPassManager'/1]).
-export(['LLVMDisposePassManager'/1]).
%% --- Stop generating from Core_8h.xml


-type llvm_ptr(Base) :: {llvm_ptr, Base}.

%% -- Start generating from Core_8h.xml on {{2011,6,18},{18,1,28}}--

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


%% -- Start generating from Core_8h.xml on {{2011,6,18},{18,1,28}}--

%% @doc 
-spec 'LLVMDisposeMessage'(string()) -> atom().
'LLVMDisposeMessage'(Message) ->
	'LLVMDisposeMessage_internal'(Message).
'LLVMDisposeMessage_internal'(_Message) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMContextCreate'() -> 'LLVMContextRef'().
'LLVMContextCreate'() ->
	'LLVMContextCreate_internal'().
'LLVMContextCreate_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetGlobalContext'() -> 'LLVMContextRef'().
'LLVMGetGlobalContext'() ->
	'LLVMGetGlobalContext_internal'().
'LLVMGetGlobalContext_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMContextDispose'('LLVMContextRef'()) -> atom().
'LLVMContextDispose'({'LLVMContextRef',C}) ->
	'LLVMContextDispose_internal'(C).
'LLVMContextDispose_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetMDKindIDInContext'('LLVMContextRef'(),string(),integer()) -> integer().
'LLVMGetMDKindIDInContext'({'LLVMContextRef',C},Name,SLen) ->
	'LLVMGetMDKindIDInContext_internal'(C,Name,SLen).
'LLVMGetMDKindIDInContext_internal'(_C,_Name,_SLen) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetMDKindID'(string(),integer()) -> integer().
'LLVMGetMDKindID'(Name,SLen) ->
	'LLVMGetMDKindID_internal'(Name,SLen).
'LLVMGetMDKindID_internal'(_Name,_SLen) ->
	nif_not_loaded.

%% @doc See llvm::Module::Module. 
-spec 'LLVMModuleCreateWithName'(string()) -> 'LLVMModuleRef'().
'LLVMModuleCreateWithName'(ModuleID) ->
	'LLVMModuleCreateWithName_internal'(ModuleID).
'LLVMModuleCreateWithName_internal'(_ModuleID) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMModuleCreateWithNameInContext'(string(),'LLVMContextRef'()) -> 'LLVMModuleRef'().
'LLVMModuleCreateWithNameInContext'(ModuleID,{'LLVMContextRef',C}) ->
	'LLVMModuleCreateWithNameInContext_internal'(ModuleID,C).
'LLVMModuleCreateWithNameInContext_internal'(_ModuleID,_C) ->
	nif_not_loaded.

%% @doc See llvm::Module::~Module. 
-spec 'LLVMDisposeModule'('LLVMModuleRef'()) -> atom().
'LLVMDisposeModule'({'LLVMModuleRef',M}) ->
	'LLVMDisposeModule_internal'(M).
'LLVMDisposeModule_internal'(_M) ->
	nif_not_loaded.

%% @doc Data layout. See Module::getDataLayout. 
-spec 'LLVMGetDataLayout'('LLVMModuleRef'()) -> string().
'LLVMGetDataLayout'({'LLVMModuleRef',M}) ->
	'LLVMGetDataLayout_internal'(M).
'LLVMGetDataLayout_internal'(_M) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMSetDataLayout'('LLVMModuleRef'(),string()) -> atom().
'LLVMSetDataLayout'({'LLVMModuleRef',M},Triple) ->
	'LLVMSetDataLayout_internal'(M,Triple).
'LLVMSetDataLayout_internal'(_M,_Triple) ->
	nif_not_loaded.

%% @doc Target triple. See Module::getTargetTriple. 
-spec 'LLVMGetTarget'('LLVMModuleRef'()) -> string().
'LLVMGetTarget'({'LLVMModuleRef',M}) ->
	'LLVMGetTarget_internal'(M).
'LLVMGetTarget_internal'(_M) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMSetTarget'('LLVMModuleRef'(),string()) -> atom().
'LLVMSetTarget'({'LLVMModuleRef',M},Triple) ->
	'LLVMSetTarget_internal'(M,Triple).
'LLVMSetTarget_internal'(_M,_Triple) ->
	nif_not_loaded.

%% @doc See Module::addTypeName. 
-spec 'LLVMAddTypeName'('LLVMModuleRef'(),string(),'LLVMTypeRef'()) -> 'LLVMBool'().
'LLVMAddTypeName'({'LLVMModuleRef',M},Name,{'LLVMTypeRef',Ty}) ->
	'LLVMAddTypeName_internal'(M,Name,Ty).
'LLVMAddTypeName_internal'(_M,_Name,_Ty) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMDeleteTypeName'('LLVMModuleRef'(),string()) -> atom().
'LLVMDeleteTypeName'({'LLVMModuleRef',M},Name) ->
	'LLVMDeleteTypeName_internal'(M,Name).
'LLVMDeleteTypeName_internal'(_M,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetTypeByName'('LLVMModuleRef'(),string()) -> 'LLVMTypeRef'().
'LLVMGetTypeByName'({'LLVMModuleRef',M},Name) ->
	'LLVMGetTypeByName_internal'(M,Name).
'LLVMGetTypeByName_internal'(_M,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetTypeName'('LLVMModuleRef'(),'LLVMTypeRef'()) -> string().
'LLVMGetTypeName'({'LLVMModuleRef',M},{'LLVMTypeRef',Ty}) ->
	'LLVMGetTypeName_internal'(M,Ty).
'LLVMGetTypeName_internal'(_M,_Ty) ->
	nif_not_loaded.

%% @doc See Module::dump. 
-spec 'LLVMDumpModule'('LLVMModuleRef'()) -> atom().
'LLVMDumpModule'({'LLVMModuleRef',M}) ->
	'LLVMDumpModule_internal'(M).
'LLVMDumpModule_internal'(_M) ->
	nif_not_loaded.

%% @doc See Module::setModuleInlineAsm. 
-spec 'LLVMSetModuleInlineAsm'('LLVMModuleRef'(),string()) -> atom().
'LLVMSetModuleInlineAsm'({'LLVMModuleRef',M},Asm) ->
	'LLVMSetModuleInlineAsm_internal'(M,Asm).
'LLVMSetModuleInlineAsm_internal'(_M,_Asm) ->
	nif_not_loaded.

%% @doc See Module::getContext. 
-spec 'LLVMGetModuleContext'('LLVMModuleRef'()) -> 'LLVMContextRef'().
'LLVMGetModuleContext'({'LLVMModuleRef',M}) ->
	'LLVMGetModuleContext_internal'(M).
'LLVMGetModuleContext_internal'(_M) ->
	nif_not_loaded.

%% @doc See llvm::LLVMTypeKind::getTypeID. 
-spec 'LLVMGetTypeKind'('LLVMTypeRef'()) -> 'LLVMTypeKind'().
'LLVMGetTypeKind'({'LLVMTypeRef',Ty}) ->
	'LLVMGetTypeKind_internal'(Ty).
'LLVMGetTypeKind_internal'(_Ty) ->
	nif_not_loaded.

%% @doc See llvm::LLVMType::getContext. 
-spec 'LLVMGetTypeContext'('LLVMTypeRef'()) -> 'LLVMContextRef'().
'LLVMGetTypeContext'({'LLVMTypeRef',Ty}) ->
	'LLVMGetTypeContext_internal'(Ty).
'LLVMGetTypeContext_internal'(_Ty) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMInt1TypeInContext'('LLVMContextRef'()) -> 'LLVMTypeRef'().
'LLVMInt1TypeInContext'({'LLVMContextRef',C}) ->
	'LLVMInt1TypeInContext_internal'(C).
'LLVMInt1TypeInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMInt8TypeInContext'('LLVMContextRef'()) -> 'LLVMTypeRef'().
'LLVMInt8TypeInContext'({'LLVMContextRef',C}) ->
	'LLVMInt8TypeInContext_internal'(C).
'LLVMInt8TypeInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMInt16TypeInContext'('LLVMContextRef'()) -> 'LLVMTypeRef'().
'LLVMInt16TypeInContext'({'LLVMContextRef',C}) ->
	'LLVMInt16TypeInContext_internal'(C).
'LLVMInt16TypeInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMInt32TypeInContext'('LLVMContextRef'()) -> 'LLVMTypeRef'().
'LLVMInt32TypeInContext'({'LLVMContextRef',C}) ->
	'LLVMInt32TypeInContext_internal'(C).
'LLVMInt32TypeInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMInt64TypeInContext'('LLVMContextRef'()) -> 'LLVMTypeRef'().
'LLVMInt64TypeInContext'({'LLVMContextRef',C}) ->
	'LLVMInt64TypeInContext_internal'(C).
'LLVMInt64TypeInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIntTypeInContext'('LLVMContextRef'(),integer()) -> 'LLVMTypeRef'().
'LLVMIntTypeInContext'({'LLVMContextRef',C},NumBits) ->
	'LLVMIntTypeInContext_internal'(C,NumBits).
'LLVMIntTypeInContext_internal'(_C,_NumBits) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMInt1Type'() -> 'LLVMTypeRef'().
'LLVMInt1Type'() ->
	'LLVMInt1Type_internal'().
'LLVMInt1Type_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMInt8Type'() -> 'LLVMTypeRef'().
'LLVMInt8Type'() ->
	'LLVMInt8Type_internal'().
'LLVMInt8Type_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMInt16Type'() -> 'LLVMTypeRef'().
'LLVMInt16Type'() ->
	'LLVMInt16Type_internal'().
'LLVMInt16Type_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMInt32Type'() -> 'LLVMTypeRef'().
'LLVMInt32Type'() ->
	'LLVMInt32Type_internal'().
'LLVMInt32Type_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMInt64Type'() -> 'LLVMTypeRef'().
'LLVMInt64Type'() ->
	'LLVMInt64Type_internal'().
'LLVMInt64Type_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIntType'(integer()) -> 'LLVMTypeRef'().
'LLVMIntType'(NumBits) ->
	'LLVMIntType_internal'(NumBits).
'LLVMIntType_internal'(_NumBits) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetIntTypeWidth'('LLVMTypeRef'()) -> integer().
'LLVMGetIntTypeWidth'({'LLVMTypeRef',IntegerTy}) ->
	'LLVMGetIntTypeWidth_internal'(IntegerTy).
'LLVMGetIntTypeWidth_internal'(_IntegerTy) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMFloatTypeInContext'('LLVMContextRef'()) -> 'LLVMTypeRef'().
'LLVMFloatTypeInContext'({'LLVMContextRef',C}) ->
	'LLVMFloatTypeInContext_internal'(C).
'LLVMFloatTypeInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMDoubleTypeInContext'('LLVMContextRef'()) -> 'LLVMTypeRef'().
'LLVMDoubleTypeInContext'({'LLVMContextRef',C}) ->
	'LLVMDoubleTypeInContext_internal'(C).
'LLVMDoubleTypeInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMX86FP80TypeInContext'('LLVMContextRef'()) -> 'LLVMTypeRef'().
'LLVMX86FP80TypeInContext'({'LLVMContextRef',C}) ->
	'LLVMX86FP80TypeInContext_internal'(C).
'LLVMX86FP80TypeInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMFP128TypeInContext'('LLVMContextRef'()) -> 'LLVMTypeRef'().
'LLVMFP128TypeInContext'({'LLVMContextRef',C}) ->
	'LLVMFP128TypeInContext_internal'(C).
'LLVMFP128TypeInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMPPCFP128TypeInContext'('LLVMContextRef'()) -> 'LLVMTypeRef'().
'LLVMPPCFP128TypeInContext'({'LLVMContextRef',C}) ->
	'LLVMPPCFP128TypeInContext_internal'(C).
'LLVMPPCFP128TypeInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMFloatType'() -> 'LLVMTypeRef'().
'LLVMFloatType'() ->
	'LLVMFloatType_internal'().
'LLVMFloatType_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMDoubleType'() -> 'LLVMTypeRef'().
'LLVMDoubleType'() ->
	'LLVMDoubleType_internal'().
'LLVMDoubleType_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMX86FP80Type'() -> 'LLVMTypeRef'().
'LLVMX86FP80Type'() ->
	'LLVMX86FP80Type_internal'().
'LLVMX86FP80Type_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMFP128Type'() -> 'LLVMTypeRef'().
'LLVMFP128Type'() ->
	'LLVMFP128Type_internal'().
'LLVMFP128Type_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMPPCFP128Type'() -> 'LLVMTypeRef'().
'LLVMPPCFP128Type'() ->
	'LLVMPPCFP128Type_internal'().
'LLVMPPCFP128Type_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMFunctionType'('LLVMTypeRef'(),llvm_ptr('LLVMTypeRef'()),integer(),'LLVMBool'()) -> 'LLVMTypeRef'().
'LLVMFunctionType'({'LLVMTypeRef',ReturnType},{ptr,{'LLVMTypeRef',ParamTypes}},ParamCount,{'LLVMBool',IsVarArg}) ->
	'LLVMFunctionType_internal'(ReturnType,ParamTypes,ParamCount,IsVarArg).
'LLVMFunctionType_internal'(_ReturnType,_ParamTypes,_ParamCount,_IsVarArg) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsFunctionVarArg'('LLVMTypeRef'()) -> 'LLVMBool'().
'LLVMIsFunctionVarArg'({'LLVMTypeRef',FunctionTy}) ->
	'LLVMIsFunctionVarArg_internal'(FunctionTy).
'LLVMIsFunctionVarArg_internal'(_FunctionTy) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetReturnType'('LLVMTypeRef'()) -> 'LLVMTypeRef'().
'LLVMGetReturnType'({'LLVMTypeRef',FunctionTy}) ->
	'LLVMGetReturnType_internal'(FunctionTy).
'LLVMGetReturnType_internal'(_FunctionTy) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMCountParamTypes'('LLVMTypeRef'()) -> integer().
'LLVMCountParamTypes'({'LLVMTypeRef',FunctionTy}) ->
	'LLVMCountParamTypes_internal'(FunctionTy).
'LLVMCountParamTypes_internal'(_FunctionTy) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetParamTypes'('LLVMTypeRef'(),llvm_ptr('LLVMTypeRef'())) -> atom().
'LLVMGetParamTypes'({'LLVMTypeRef',FunctionTy},{ptr,{'LLVMTypeRef',Dest}}) ->
	'LLVMGetParamTypes_internal'(FunctionTy,Dest).
'LLVMGetParamTypes_internal'(_FunctionTy,_Dest) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMStructTypeInContext'('LLVMContextRef'(),llvm_ptr('LLVMTypeRef'()),integer(),'LLVMBool'()) -> 'LLVMTypeRef'().
'LLVMStructTypeInContext'({'LLVMContextRef',C},{ptr,{'LLVMTypeRef',ElementTypes}},ElementCount,{'LLVMBool',Packed}) ->
	'LLVMStructTypeInContext_internal'(C,ElementTypes,ElementCount,Packed).
'LLVMStructTypeInContext_internal'(_C,_ElementTypes,_ElementCount,_Packed) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMStructType'(llvm_ptr('LLVMTypeRef'()),integer(),'LLVMBool'()) -> 'LLVMTypeRef'().
'LLVMStructType'({ptr,{'LLVMTypeRef',ElementTypes}},ElementCount,{'LLVMBool',Packed}) ->
	'LLVMStructType_internal'(ElementTypes,ElementCount,Packed).
'LLVMStructType_internal'(_ElementTypes,_ElementCount,_Packed) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMCountStructElementTypes'('LLVMTypeRef'()) -> integer().
'LLVMCountStructElementTypes'({'LLVMTypeRef',StructTy}) ->
	'LLVMCountStructElementTypes_internal'(StructTy).
'LLVMCountStructElementTypes_internal'(_StructTy) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetStructElementTypes'('LLVMTypeRef'(),llvm_ptr('LLVMTypeRef'())) -> atom().
'LLVMGetStructElementTypes'({'LLVMTypeRef',StructTy},{ptr,{'LLVMTypeRef',Dest}}) ->
	'LLVMGetStructElementTypes_internal'(StructTy,Dest).
'LLVMGetStructElementTypes_internal'(_StructTy,_Dest) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsPackedStruct'('LLVMTypeRef'()) -> 'LLVMBool'().
'LLVMIsPackedStruct'({'LLVMTypeRef',StructTy}) ->
	'LLVMIsPackedStruct_internal'(StructTy).
'LLVMIsPackedStruct_internal'(_StructTy) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMArrayType'('LLVMTypeRef'(),integer()) -> 'LLVMTypeRef'().
'LLVMArrayType'({'LLVMTypeRef',ElementType},ElementCount) ->
	'LLVMArrayType_internal'(ElementType,ElementCount).
'LLVMArrayType_internal'(_ElementType,_ElementCount) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMPointerType'('LLVMTypeRef'(),integer()) -> 'LLVMTypeRef'().
'LLVMPointerType'({'LLVMTypeRef',ElementType},AddressSpace) ->
	'LLVMPointerType_internal'(ElementType,AddressSpace).
'LLVMPointerType_internal'(_ElementType,_AddressSpace) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMVectorType'('LLVMTypeRef'(),integer()) -> 'LLVMTypeRef'().
'LLVMVectorType'({'LLVMTypeRef',ElementType},ElementCount) ->
	'LLVMVectorType_internal'(ElementType,ElementCount).
'LLVMVectorType_internal'(_ElementType,_ElementCount) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetElementType'('LLVMTypeRef'()) -> 'LLVMTypeRef'().
'LLVMGetElementType'({'LLVMTypeRef',Ty}) ->
	'LLVMGetElementType_internal'(Ty).
'LLVMGetElementType_internal'(_Ty) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetArrayLength'('LLVMTypeRef'()) -> integer().
'LLVMGetArrayLength'({'LLVMTypeRef',ArrayTy}) ->
	'LLVMGetArrayLength_internal'(ArrayTy).
'LLVMGetArrayLength_internal'(_ArrayTy) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetPointerAddressSpace'('LLVMTypeRef'()) -> integer().
'LLVMGetPointerAddressSpace'({'LLVMTypeRef',PointerTy}) ->
	'LLVMGetPointerAddressSpace_internal'(PointerTy).
'LLVMGetPointerAddressSpace_internal'(_PointerTy) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetVectorSize'('LLVMTypeRef'()) -> integer().
'LLVMGetVectorSize'({'LLVMTypeRef',VectorTy}) ->
	'LLVMGetVectorSize_internal'(VectorTy).
'LLVMGetVectorSize_internal'(_VectorTy) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMVoidTypeInContext'('LLVMContextRef'()) -> 'LLVMTypeRef'().
'LLVMVoidTypeInContext'({'LLVMContextRef',C}) ->
	'LLVMVoidTypeInContext_internal'(C).
'LLVMVoidTypeInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMLabelTypeInContext'('LLVMContextRef'()) -> 'LLVMTypeRef'().
'LLVMLabelTypeInContext'({'LLVMContextRef',C}) ->
	'LLVMLabelTypeInContext_internal'(C).
'LLVMLabelTypeInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMOpaqueTypeInContext'('LLVMContextRef'()) -> 'LLVMTypeRef'().
'LLVMOpaqueTypeInContext'({'LLVMContextRef',C}) ->
	'LLVMOpaqueTypeInContext_internal'(C).
'LLVMOpaqueTypeInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMX86MMXTypeInContext'('LLVMContextRef'()) -> 'LLVMTypeRef'().
'LLVMX86MMXTypeInContext'({'LLVMContextRef',C}) ->
	'LLVMX86MMXTypeInContext_internal'(C).
'LLVMX86MMXTypeInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMVoidType'() -> 'LLVMTypeRef'().
'LLVMVoidType'() ->
	'LLVMVoidType_internal'().
'LLVMVoidType_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMLabelType'() -> 'LLVMTypeRef'().
'LLVMLabelType'() ->
	'LLVMLabelType_internal'().
'LLVMLabelType_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMOpaqueType'() -> 'LLVMTypeRef'().
'LLVMOpaqueType'() ->
	'LLVMOpaqueType_internal'().
'LLVMOpaqueType_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMX86MMXType'() -> 'LLVMTypeRef'().
'LLVMX86MMXType'() ->
	'LLVMX86MMXType_internal'().
'LLVMX86MMXType_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMCreateTypeHandle'('LLVMTypeRef'()) -> 'LLVMTypeHandleRef'().
'LLVMCreateTypeHandle'({'LLVMTypeRef',PotentiallyAbstractTy}) ->
	'LLVMCreateTypeHandle_internal'(PotentiallyAbstractTy).
'LLVMCreateTypeHandle_internal'(_PotentiallyAbstractTy) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMRefineType'('LLVMTypeRef'(),'LLVMTypeRef'()) -> atom().
'LLVMRefineType'({'LLVMTypeRef',AbstractTy},{'LLVMTypeRef',ConcreteTy}) ->
	'LLVMRefineType_internal'(AbstractTy,ConcreteTy).
'LLVMRefineType_internal'(_AbstractTy,_ConcreteTy) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMResolveTypeHandle'('LLVMTypeHandleRef'()) -> 'LLVMTypeRef'().
'LLVMResolveTypeHandle'({'LLVMTypeHandleRef',TypeHandle}) ->
	'LLVMResolveTypeHandle_internal'(TypeHandle).
'LLVMResolveTypeHandle_internal'(_TypeHandle) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMDisposeTypeHandle'('LLVMTypeHandleRef'()) -> atom().
'LLVMDisposeTypeHandle'({'LLVMTypeHandleRef',TypeHandle}) ->
	'LLVMDisposeTypeHandle_internal'(TypeHandle).
'LLVMDisposeTypeHandle_internal'(_TypeHandle) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMTypeOf'('LLVMValueRef'()) -> 'LLVMTypeRef'().
'LLVMTypeOf'({'LLVMValueRef',Val}) ->
	'LLVMTypeOf_internal'(Val).
'LLVMTypeOf_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetValueName'('LLVMValueRef'()) -> string().
'LLVMGetValueName'({'LLVMValueRef',Val}) ->
	'LLVMGetValueName_internal'(Val).
'LLVMGetValueName_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMSetValueName'('LLVMValueRef'(),string()) -> atom().
'LLVMSetValueName'({'LLVMValueRef',Val},Name) ->
	'LLVMSetValueName_internal'(Val,Name).
'LLVMSetValueName_internal'(_Val,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMDumpValue'('LLVMValueRef'()) -> atom().
'LLVMDumpValue'({'LLVMValueRef',Val}) ->
	'LLVMDumpValue_internal'(Val).
'LLVMDumpValue_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMReplaceAllUsesWith'('LLVMValueRef'(),'LLVMValueRef'()) -> atom().
'LLVMReplaceAllUsesWith'({'LLVMValueRef',OldVal},{'LLVMValueRef',NewVal}) ->
	'LLVMReplaceAllUsesWith_internal'(OldVal,NewVal).
'LLVMReplaceAllUsesWith_internal'(_OldVal,_NewVal) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMHasMetadata'('LLVMValueRef'()) -> integer().
'LLVMHasMetadata'({'LLVMValueRef',Val}) ->
	'LLVMHasMetadata_internal'(Val).
'LLVMHasMetadata_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetMetadata'('LLVMValueRef'(),integer()) -> 'LLVMValueRef'().
'LLVMGetMetadata'({'LLVMValueRef',Val},KindID) ->
	'LLVMGetMetadata_internal'(Val,KindID).
'LLVMGetMetadata_internal'(_Val,_KindID) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMSetMetadata'('LLVMValueRef'(),integer(),'LLVMValueRef'()) -> atom().
'LLVMSetMetadata'({'LLVMValueRef',Val},KindID,{'LLVMValueRef',Node}) ->
	'LLVMSetMetadata_internal'(Val,KindID,Node).
'LLVMSetMetadata_internal'(_Val,_KindID,_Node) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAArgument'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAArgument'({'LLVMValueRef',Val}) ->
	'LLVMIsAArgument_internal'(Val).
'LLVMIsAArgument_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsABasicBlock'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsABasicBlock'({'LLVMValueRef',Val}) ->
	'LLVMIsABasicBlock_internal'(Val).
'LLVMIsABasicBlock_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAInlineAsm'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAInlineAsm'({'LLVMValueRef',Val}) ->
	'LLVMIsAInlineAsm_internal'(Val).
'LLVMIsAInlineAsm_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAUser'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAUser'({'LLVMValueRef',Val}) ->
	'LLVMIsAUser_internal'(Val).
'LLVMIsAUser_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAConstant'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAConstant'({'LLVMValueRef',Val}) ->
	'LLVMIsAConstant_internal'(Val).
'LLVMIsAConstant_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAConstantAggregateZero'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAConstantAggregateZero'({'LLVMValueRef',Val}) ->
	'LLVMIsAConstantAggregateZero_internal'(Val).
'LLVMIsAConstantAggregateZero_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAConstantArray'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAConstantArray'({'LLVMValueRef',Val}) ->
	'LLVMIsAConstantArray_internal'(Val).
'LLVMIsAConstantArray_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAConstantExpr'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAConstantExpr'({'LLVMValueRef',Val}) ->
	'LLVMIsAConstantExpr_internal'(Val).
'LLVMIsAConstantExpr_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAConstantFP'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAConstantFP'({'LLVMValueRef',Val}) ->
	'LLVMIsAConstantFP_internal'(Val).
'LLVMIsAConstantFP_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAConstantInt'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAConstantInt'({'LLVMValueRef',Val}) ->
	'LLVMIsAConstantInt_internal'(Val).
'LLVMIsAConstantInt_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAConstantPointerNull'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAConstantPointerNull'({'LLVMValueRef',Val}) ->
	'LLVMIsAConstantPointerNull_internal'(Val).
'LLVMIsAConstantPointerNull_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAConstantStruct'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAConstantStruct'({'LLVMValueRef',Val}) ->
	'LLVMIsAConstantStruct_internal'(Val).
'LLVMIsAConstantStruct_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAConstantVector'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAConstantVector'({'LLVMValueRef',Val}) ->
	'LLVMIsAConstantVector_internal'(Val).
'LLVMIsAConstantVector_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAGlobalValue'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAGlobalValue'({'LLVMValueRef',Val}) ->
	'LLVMIsAGlobalValue_internal'(Val).
'LLVMIsAGlobalValue_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAFunction'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAFunction'({'LLVMValueRef',Val}) ->
	'LLVMIsAFunction_internal'(Val).
'LLVMIsAFunction_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAGlobalAlias'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAGlobalAlias'({'LLVMValueRef',Val}) ->
	'LLVMIsAGlobalAlias_internal'(Val).
'LLVMIsAGlobalAlias_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAGlobalVariable'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAGlobalVariable'({'LLVMValueRef',Val}) ->
	'LLVMIsAGlobalVariable_internal'(Val).
'LLVMIsAGlobalVariable_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAUndefValue'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAUndefValue'({'LLVMValueRef',Val}) ->
	'LLVMIsAUndefValue_internal'(Val).
'LLVMIsAUndefValue_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAInstruction'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAInstruction'({'LLVMValueRef',Val}) ->
	'LLVMIsAInstruction_internal'(Val).
'LLVMIsAInstruction_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsABinaryOperator'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsABinaryOperator'({'LLVMValueRef',Val}) ->
	'LLVMIsABinaryOperator_internal'(Val).
'LLVMIsABinaryOperator_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsACallInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsACallInst'({'LLVMValueRef',Val}) ->
	'LLVMIsACallInst_internal'(Val).
'LLVMIsACallInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAIntrinsicInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAIntrinsicInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAIntrinsicInst_internal'(Val).
'LLVMIsAIntrinsicInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsADbgInfoIntrinsic'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsADbgInfoIntrinsic'({'LLVMValueRef',Val}) ->
	'LLVMIsADbgInfoIntrinsic_internal'(Val).
'LLVMIsADbgInfoIntrinsic_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsADbgDeclareInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsADbgDeclareInst'({'LLVMValueRef',Val}) ->
	'LLVMIsADbgDeclareInst_internal'(Val).
'LLVMIsADbgDeclareInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAEHSelectorInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAEHSelectorInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAEHSelectorInst_internal'(Val).
'LLVMIsAEHSelectorInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAMemIntrinsic'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAMemIntrinsic'({'LLVMValueRef',Val}) ->
	'LLVMIsAMemIntrinsic_internal'(Val).
'LLVMIsAMemIntrinsic_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAMemCpyInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAMemCpyInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAMemCpyInst_internal'(Val).
'LLVMIsAMemCpyInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAMemMoveInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAMemMoveInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAMemMoveInst_internal'(Val).
'LLVMIsAMemMoveInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAMemSetInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAMemSetInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAMemSetInst_internal'(Val).
'LLVMIsAMemSetInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsACmpInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsACmpInst'({'LLVMValueRef',Val}) ->
	'LLVMIsACmpInst_internal'(Val).
'LLVMIsACmpInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAFCmpInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAFCmpInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAFCmpInst_internal'(Val).
'LLVMIsAFCmpInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAICmpInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAICmpInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAICmpInst_internal'(Val).
'LLVMIsAICmpInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAExtractElementInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAExtractElementInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAExtractElementInst_internal'(Val).
'LLVMIsAExtractElementInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAGetElementPtrInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAGetElementPtrInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAGetElementPtrInst_internal'(Val).
'LLVMIsAGetElementPtrInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAInsertElementInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAInsertElementInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAInsertElementInst_internal'(Val).
'LLVMIsAInsertElementInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAInsertValueInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAInsertValueInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAInsertValueInst_internal'(Val).
'LLVMIsAInsertValueInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAPHINode'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAPHINode'({'LLVMValueRef',Val}) ->
	'LLVMIsAPHINode_internal'(Val).
'LLVMIsAPHINode_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsASelectInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsASelectInst'({'LLVMValueRef',Val}) ->
	'LLVMIsASelectInst_internal'(Val).
'LLVMIsASelectInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAShuffleVectorInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAShuffleVectorInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAShuffleVectorInst_internal'(Val).
'LLVMIsAShuffleVectorInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAStoreInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAStoreInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAStoreInst_internal'(Val).
'LLVMIsAStoreInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsATerminatorInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsATerminatorInst'({'LLVMValueRef',Val}) ->
	'LLVMIsATerminatorInst_internal'(Val).
'LLVMIsATerminatorInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsABranchInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsABranchInst'({'LLVMValueRef',Val}) ->
	'LLVMIsABranchInst_internal'(Val).
'LLVMIsABranchInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAInvokeInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAInvokeInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAInvokeInst_internal'(Val).
'LLVMIsAInvokeInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAReturnInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAReturnInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAReturnInst_internal'(Val).
'LLVMIsAReturnInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsASwitchInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsASwitchInst'({'LLVMValueRef',Val}) ->
	'LLVMIsASwitchInst_internal'(Val).
'LLVMIsASwitchInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAUnreachableInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAUnreachableInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAUnreachableInst_internal'(Val).
'LLVMIsAUnreachableInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAUnwindInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAUnwindInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAUnwindInst_internal'(Val).
'LLVMIsAUnwindInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAUnaryInstruction'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAUnaryInstruction'({'LLVMValueRef',Val}) ->
	'LLVMIsAUnaryInstruction_internal'(Val).
'LLVMIsAUnaryInstruction_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAAllocaInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAAllocaInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAAllocaInst_internal'(Val).
'LLVMIsAAllocaInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsACastInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsACastInst'({'LLVMValueRef',Val}) ->
	'LLVMIsACastInst_internal'(Val).
'LLVMIsACastInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsABitCastInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsABitCastInst'({'LLVMValueRef',Val}) ->
	'LLVMIsABitCastInst_internal'(Val).
'LLVMIsABitCastInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAFPExtInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAFPExtInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAFPExtInst_internal'(Val).
'LLVMIsAFPExtInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAFPToSIInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAFPToSIInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAFPToSIInst_internal'(Val).
'LLVMIsAFPToSIInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAFPToUIInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAFPToUIInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAFPToUIInst_internal'(Val).
'LLVMIsAFPToUIInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAFPTruncInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAFPTruncInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAFPTruncInst_internal'(Val).
'LLVMIsAFPTruncInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAIntToPtrInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAIntToPtrInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAIntToPtrInst_internal'(Val).
'LLVMIsAIntToPtrInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAPtrToIntInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAPtrToIntInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAPtrToIntInst_internal'(Val).
'LLVMIsAPtrToIntInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsASExtInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsASExtInst'({'LLVMValueRef',Val}) ->
	'LLVMIsASExtInst_internal'(Val).
'LLVMIsASExtInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsASIToFPInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsASIToFPInst'({'LLVMValueRef',Val}) ->
	'LLVMIsASIToFPInst_internal'(Val).
'LLVMIsASIToFPInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsATruncInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsATruncInst'({'LLVMValueRef',Val}) ->
	'LLVMIsATruncInst_internal'(Val).
'LLVMIsATruncInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAUIToFPInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAUIToFPInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAUIToFPInst_internal'(Val).
'LLVMIsAUIToFPInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAZExtInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAZExtInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAZExtInst_internal'(Val).
'LLVMIsAZExtInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAExtractValueInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAExtractValueInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAExtractValueInst_internal'(Val).
'LLVMIsAExtractValueInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsALoadInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsALoadInst'({'LLVMValueRef',Val}) ->
	'LLVMIsALoadInst_internal'(Val).
'LLVMIsALoadInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsAVAArgInst'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMIsAVAArgInst'({'LLVMValueRef',Val}) ->
	'LLVMIsAVAArgInst_internal'(Val).
'LLVMIsAVAArgInst_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetFirstUse'('LLVMValueRef'()) -> 'LLVMUseRef'().
'LLVMGetFirstUse'({'LLVMValueRef',Val}) ->
	'LLVMGetFirstUse_internal'(Val).
'LLVMGetFirstUse_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetNextUse'('LLVMUseRef'()) -> 'LLVMUseRef'().
'LLVMGetNextUse'({'LLVMUseRef',U}) ->
	'LLVMGetNextUse_internal'(U).
'LLVMGetNextUse_internal'(_U) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetUser'('LLVMUseRef'()) -> 'LLVMValueRef'().
'LLVMGetUser'({'LLVMUseRef',U}) ->
	'LLVMGetUser_internal'(U).
'LLVMGetUser_internal'(_U) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetUsedValue'('LLVMUseRef'()) -> 'LLVMValueRef'().
'LLVMGetUsedValue'({'LLVMUseRef',U}) ->
	'LLVMGetUsedValue_internal'(U).
'LLVMGetUsedValue_internal'(_U) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetOperand'('LLVMValueRef'(),integer()) -> 'LLVMValueRef'().
'LLVMGetOperand'({'LLVMValueRef',Val},Index) ->
	'LLVMGetOperand_internal'(Val,Index).
'LLVMGetOperand_internal'(_Val,_Index) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMSetOperand'('LLVMValueRef'(),integer(),'LLVMValueRef'()) -> atom().
'LLVMSetOperand'({'LLVMValueRef',User},Index,{'LLVMValueRef',Val}) ->
	'LLVMSetOperand_internal'(User,Index,Val).
'LLVMSetOperand_internal'(_User,_Index,_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetNumOperands'('LLVMValueRef'()) -> integer().
'LLVMGetNumOperands'({'LLVMValueRef',Val}) ->
	'LLVMGetNumOperands_internal'(Val).
'LLVMGetNumOperands_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstNull'('LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMConstNull'({'LLVMTypeRef',Ty}) ->
	'LLVMConstNull_internal'(Ty).
'LLVMConstNull_internal'(_Ty) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstAllOnes'('LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMConstAllOnes'({'LLVMTypeRef',Ty}) ->
	'LLVMConstAllOnes_internal'(Ty).
'LLVMConstAllOnes_internal'(_Ty) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetUndef'('LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMGetUndef'({'LLVMTypeRef',Ty}) ->
	'LLVMGetUndef_internal'(Ty).
'LLVMGetUndef_internal'(_Ty) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsConstant'('LLVMValueRef'()) -> 'LLVMBool'().
'LLVMIsConstant'({'LLVMValueRef',Val}) ->
	'LLVMIsConstant_internal'(Val).
'LLVMIsConstant_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsNull'('LLVMValueRef'()) -> 'LLVMBool'().
'LLVMIsNull'({'LLVMValueRef',Val}) ->
	'LLVMIsNull_internal'(Val).
'LLVMIsNull_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsUndef'('LLVMValueRef'()) -> 'LLVMBool'().
'LLVMIsUndef'({'LLVMValueRef',Val}) ->
	'LLVMIsUndef_internal'(Val).
'LLVMIsUndef_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstPointerNull'('LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMConstPointerNull'({'LLVMTypeRef',Ty}) ->
	'LLVMConstPointerNull_internal'(Ty).
'LLVMConstPointerNull_internal'(_Ty) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMMDStringInContext'('LLVMContextRef'(),string(),integer()) -> 'LLVMValueRef'().
'LLVMMDStringInContext'({'LLVMContextRef',C},Str,SLen) ->
	'LLVMMDStringInContext_internal'(C,Str,SLen).
'LLVMMDStringInContext_internal'(_C,_Str,_SLen) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMMDString'(string(),integer()) -> 'LLVMValueRef'().
'LLVMMDString'(Str,SLen) ->
	'LLVMMDString_internal'(Str,SLen).
'LLVMMDString_internal'(_Str,_SLen) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMMDNodeInContext'('LLVMContextRef'(),llvm_ptr('LLVMValueRef'()),integer()) -> 'LLVMValueRef'().
'LLVMMDNodeInContext'({'LLVMContextRef',C},{ptr,{'LLVMValueRef',Vals}},Count) ->
	'LLVMMDNodeInContext_internal'(C,Vals,Count).
'LLVMMDNodeInContext_internal'(_C,_Vals,_Count) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMMDNode'(llvm_ptr('LLVMValueRef'()),integer()) -> 'LLVMValueRef'().
'LLVMMDNode'({ptr,{'LLVMValueRef',Vals}},Count) ->
	'LLVMMDNode_internal'(Vals,Count).
'LLVMMDNode_internal'(_Vals,_Count) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstInt'('LLVMTypeRef'(),integer(),'LLVMBool'()) -> 'LLVMValueRef'().
'LLVMConstInt'({'LLVMTypeRef',IntTy},N,{'LLVMBool',SignExtend}) ->
	'LLVMConstInt_internal'(IntTy,N,SignExtend).
'LLVMConstInt_internal'(_IntTy,_N,_SignExtend) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstIntOfArbitraryPrecision'('LLVMTypeRef'(),integer(),integer()) -> 'LLVMValueRef'().
'LLVMConstIntOfArbitraryPrecision'({'LLVMTypeRef',IntTy},NumWords,Words) ->
	'LLVMConstIntOfArbitraryPrecision_internal'(IntTy,NumWords,Words).
'LLVMConstIntOfArbitraryPrecision_internal'(_IntTy,_NumWords,_Words) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstIntOfString'('LLVMTypeRef'(),string(),integer()) -> 'LLVMValueRef'().
'LLVMConstIntOfString'({'LLVMTypeRef',IntTy},Text,Radix) ->
	'LLVMConstIntOfString_internal'(IntTy,Text,Radix).
'LLVMConstIntOfString_internal'(_IntTy,_Text,_Radix) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstIntOfStringAndSize'('LLVMTypeRef'(),string(),integer(),integer()) -> 'LLVMValueRef'().
'LLVMConstIntOfStringAndSize'({'LLVMTypeRef',IntTy},Text,SLen,Radix) ->
	'LLVMConstIntOfStringAndSize_internal'(IntTy,Text,SLen,Radix).
'LLVMConstIntOfStringAndSize_internal'(_IntTy,_Text,_SLen,_Radix) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstReal'('LLVMTypeRef'(),float()) -> 'LLVMValueRef'().
'LLVMConstReal'({'LLVMTypeRef',RealTy},N) ->
	'LLVMConstReal_internal'(RealTy,N).
'LLVMConstReal_internal'(_RealTy,_N) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstRealOfString'('LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMConstRealOfString'({'LLVMTypeRef',RealTy},Text) ->
	'LLVMConstRealOfString_internal'(RealTy,Text).
'LLVMConstRealOfString_internal'(_RealTy,_Text) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstRealOfStringAndSize'('LLVMTypeRef'(),string(),integer()) -> 'LLVMValueRef'().
'LLVMConstRealOfStringAndSize'({'LLVMTypeRef',RealTy},Text,SLen) ->
	'LLVMConstRealOfStringAndSize_internal'(RealTy,Text,SLen).
'LLVMConstRealOfStringAndSize_internal'(_RealTy,_Text,_SLen) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstIntGetZExtValue'('LLVMValueRef'()) -> integer().
'LLVMConstIntGetZExtValue'({'LLVMValueRef',ConstantVal}) ->
	'LLVMConstIntGetZExtValue_internal'(ConstantVal).
'LLVMConstIntGetZExtValue_internal'(_ConstantVal) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstIntGetSExtValue'('LLVMValueRef'()) -> integer().
'LLVMConstIntGetSExtValue'({'LLVMValueRef',ConstantVal}) ->
	'LLVMConstIntGetSExtValue_internal'(ConstantVal).
'LLVMConstIntGetSExtValue_internal'(_ConstantVal) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstStringInContext'('LLVMContextRef'(),string(),integer(),'LLVMBool'()) -> 'LLVMValueRef'().
'LLVMConstStringInContext'({'LLVMContextRef',C},Str,Length,{'LLVMBool',DontNullTerminate}) ->
	'LLVMConstStringInContext_internal'(C,Str,Length,DontNullTerminate).
'LLVMConstStringInContext_internal'(_C,_Str,_Length,_DontNullTerminate) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstStructInContext'('LLVMContextRef'(),llvm_ptr('LLVMValueRef'()),integer(),'LLVMBool'()) -> 'LLVMValueRef'().
'LLVMConstStructInContext'({'LLVMContextRef',C},{ptr,{'LLVMValueRef',ConstantVals}},Count,{'LLVMBool',Packed}) ->
	'LLVMConstStructInContext_internal'(C,ConstantVals,Count,Packed).
'LLVMConstStructInContext_internal'(_C,_ConstantVals,_Count,_Packed) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstString'(string(),integer(),'LLVMBool'()) -> 'LLVMValueRef'().
'LLVMConstString'(Str,Length,{'LLVMBool',DontNullTerminate}) ->
	'LLVMConstString_internal'(Str,Length,DontNullTerminate).
'LLVMConstString_internal'(_Str,_Length,_DontNullTerminate) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstArray'('LLVMTypeRef'(),llvm_ptr('LLVMValueRef'()),integer()) -> 'LLVMValueRef'().
'LLVMConstArray'({'LLVMTypeRef',ElementTy},{ptr,{'LLVMValueRef',ConstantVals}},Length) ->
	'LLVMConstArray_internal'(ElementTy,ConstantVals,Length).
'LLVMConstArray_internal'(_ElementTy,_ConstantVals,_Length) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstStruct'(llvm_ptr('LLVMValueRef'()),integer(),'LLVMBool'()) -> 'LLVMValueRef'().
'LLVMConstStruct'({ptr,{'LLVMValueRef',ConstantVals}},Count,{'LLVMBool',Packed}) ->
	'LLVMConstStruct_internal'(ConstantVals,Count,Packed).
'LLVMConstStruct_internal'(_ConstantVals,_Count,_Packed) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstVector'(llvm_ptr('LLVMValueRef'()),integer()) -> 'LLVMValueRef'().
'LLVMConstVector'({ptr,{'LLVMValueRef',ScalarConstantVals}},Size) ->
	'LLVMConstVector_internal'(ScalarConstantVals,Size).
'LLVMConstVector_internal'(_ScalarConstantVals,_Size) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetConstOpcode'('LLVMValueRef'()) -> 'LLVMOpcode'().
'LLVMGetConstOpcode'({'LLVMValueRef',ConstantVal}) ->
	'LLVMGetConstOpcode_internal'(ConstantVal).
'LLVMGetConstOpcode_internal'(_ConstantVal) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMAlignOf'('LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMAlignOf'({'LLVMTypeRef',Ty}) ->
	'LLVMAlignOf_internal'(Ty).
'LLVMAlignOf_internal'(_Ty) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMSizeOf'('LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMSizeOf'({'LLVMTypeRef',Ty}) ->
	'LLVMSizeOf_internal'(Ty).
'LLVMSizeOf_internal'(_Ty) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstNeg'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstNeg'({'LLVMValueRef',ConstantVal}) ->
	'LLVMConstNeg_internal'(ConstantVal).
'LLVMConstNeg_internal'(_ConstantVal) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstNSWNeg'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstNSWNeg'({'LLVMValueRef',ConstantVal}) ->
	'LLVMConstNSWNeg_internal'(ConstantVal).
'LLVMConstNSWNeg_internal'(_ConstantVal) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstNUWNeg'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstNUWNeg'({'LLVMValueRef',ConstantVal}) ->
	'LLVMConstNUWNeg_internal'(ConstantVal).
'LLVMConstNUWNeg_internal'(_ConstantVal) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstFNeg'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstFNeg'({'LLVMValueRef',ConstantVal}) ->
	'LLVMConstFNeg_internal'(ConstantVal).
'LLVMConstFNeg_internal'(_ConstantVal) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstNot'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstNot'({'LLVMValueRef',ConstantVal}) ->
	'LLVMConstNot_internal'(ConstantVal).
'LLVMConstNot_internal'(_ConstantVal) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstAdd'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstAdd'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstAdd_internal'(LHSConstant,RHSConstant).
'LLVMConstAdd_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstNSWAdd'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstNSWAdd'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstNSWAdd_internal'(LHSConstant,RHSConstant).
'LLVMConstNSWAdd_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstNUWAdd'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstNUWAdd'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstNUWAdd_internal'(LHSConstant,RHSConstant).
'LLVMConstNUWAdd_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstFAdd'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstFAdd'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstFAdd_internal'(LHSConstant,RHSConstant).
'LLVMConstFAdd_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstSub'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstSub'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstSub_internal'(LHSConstant,RHSConstant).
'LLVMConstSub_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstNSWSub'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstNSWSub'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstNSWSub_internal'(LHSConstant,RHSConstant).
'LLVMConstNSWSub_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstNUWSub'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstNUWSub'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstNUWSub_internal'(LHSConstant,RHSConstant).
'LLVMConstNUWSub_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstFSub'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstFSub'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstFSub_internal'(LHSConstant,RHSConstant).
'LLVMConstFSub_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstMul'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstMul'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstMul_internal'(LHSConstant,RHSConstant).
'LLVMConstMul_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstNSWMul'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstNSWMul'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstNSWMul_internal'(LHSConstant,RHSConstant).
'LLVMConstNSWMul_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstNUWMul'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstNUWMul'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstNUWMul_internal'(LHSConstant,RHSConstant).
'LLVMConstNUWMul_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstFMul'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstFMul'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstFMul_internal'(LHSConstant,RHSConstant).
'LLVMConstFMul_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstUDiv'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstUDiv'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstUDiv_internal'(LHSConstant,RHSConstant).
'LLVMConstUDiv_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstSDiv'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstSDiv'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstSDiv_internal'(LHSConstant,RHSConstant).
'LLVMConstSDiv_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstExactSDiv'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstExactSDiv'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstExactSDiv_internal'(LHSConstant,RHSConstant).
'LLVMConstExactSDiv_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstFDiv'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstFDiv'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstFDiv_internal'(LHSConstant,RHSConstant).
'LLVMConstFDiv_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstURem'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstURem'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstURem_internal'(LHSConstant,RHSConstant).
'LLVMConstURem_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstSRem'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstSRem'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstSRem_internal'(LHSConstant,RHSConstant).
'LLVMConstSRem_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstFRem'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstFRem'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstFRem_internal'(LHSConstant,RHSConstant).
'LLVMConstFRem_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstAnd'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstAnd'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstAnd_internal'(LHSConstant,RHSConstant).
'LLVMConstAnd_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstOr'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstOr'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstOr_internal'(LHSConstant,RHSConstant).
'LLVMConstOr_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstXor'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstXor'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstXor_internal'(LHSConstant,RHSConstant).
'LLVMConstXor_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstICmp'('LLVMIntPredicate'(),'LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstICmp'({'LLVMIntPredicate',Predicate},{'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstICmp_internal'(Predicate,LHSConstant,RHSConstant).
'LLVMConstICmp_internal'(_Predicate,_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstFCmp'('LLVMRealPredicate'(),'LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstFCmp'({'LLVMRealPredicate',Predicate},{'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstFCmp_internal'(Predicate,LHSConstant,RHSConstant).
'LLVMConstFCmp_internal'(_Predicate,_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstShl'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstShl'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstShl_internal'(LHSConstant,RHSConstant).
'LLVMConstShl_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstLShr'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstLShr'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstLShr_internal'(LHSConstant,RHSConstant).
'LLVMConstLShr_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstAShr'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstAShr'({'LLVMValueRef',LHSConstant},{'LLVMValueRef',RHSConstant}) ->
	'LLVMConstAShr_internal'(LHSConstant,RHSConstant).
'LLVMConstAShr_internal'(_LHSConstant,_RHSConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstGEP'('LLVMValueRef'(),llvm_ptr('LLVMValueRef'()),integer()) -> 'LLVMValueRef'().
'LLVMConstGEP'({'LLVMValueRef',ConstantVal},{ptr,{'LLVMValueRef',ConstantIndices}},NumIndices) ->
	'LLVMConstGEP_internal'(ConstantVal,ConstantIndices,NumIndices).
'LLVMConstGEP_internal'(_ConstantVal,_ConstantIndices,_NumIndices) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstInBoundsGEP'('LLVMValueRef'(),llvm_ptr('LLVMValueRef'()),integer()) -> 'LLVMValueRef'().
'LLVMConstInBoundsGEP'({'LLVMValueRef',ConstantVal},{ptr,{'LLVMValueRef',ConstantIndices}},NumIndices) ->
	'LLVMConstInBoundsGEP_internal'(ConstantVal,ConstantIndices,NumIndices).
'LLVMConstInBoundsGEP_internal'(_ConstantVal,_ConstantIndices,_NumIndices) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstTrunc'('LLVMValueRef'(),'LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMConstTrunc'({'LLVMValueRef',ConstantVal},{'LLVMTypeRef',ToType}) ->
	'LLVMConstTrunc_internal'(ConstantVal,ToType).
'LLVMConstTrunc_internal'(_ConstantVal,_ToType) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstSExt'('LLVMValueRef'(),'LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMConstSExt'({'LLVMValueRef',ConstantVal},{'LLVMTypeRef',ToType}) ->
	'LLVMConstSExt_internal'(ConstantVal,ToType).
'LLVMConstSExt_internal'(_ConstantVal,_ToType) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstZExt'('LLVMValueRef'(),'LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMConstZExt'({'LLVMValueRef',ConstantVal},{'LLVMTypeRef',ToType}) ->
	'LLVMConstZExt_internal'(ConstantVal,ToType).
'LLVMConstZExt_internal'(_ConstantVal,_ToType) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstFPTrunc'('LLVMValueRef'(),'LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMConstFPTrunc'({'LLVMValueRef',ConstantVal},{'LLVMTypeRef',ToType}) ->
	'LLVMConstFPTrunc_internal'(ConstantVal,ToType).
'LLVMConstFPTrunc_internal'(_ConstantVal,_ToType) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstFPExt'('LLVMValueRef'(),'LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMConstFPExt'({'LLVMValueRef',ConstantVal},{'LLVMTypeRef',ToType}) ->
	'LLVMConstFPExt_internal'(ConstantVal,ToType).
'LLVMConstFPExt_internal'(_ConstantVal,_ToType) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstUIToFP'('LLVMValueRef'(),'LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMConstUIToFP'({'LLVMValueRef',ConstantVal},{'LLVMTypeRef',ToType}) ->
	'LLVMConstUIToFP_internal'(ConstantVal,ToType).
'LLVMConstUIToFP_internal'(_ConstantVal,_ToType) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstSIToFP'('LLVMValueRef'(),'LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMConstSIToFP'({'LLVMValueRef',ConstantVal},{'LLVMTypeRef',ToType}) ->
	'LLVMConstSIToFP_internal'(ConstantVal,ToType).
'LLVMConstSIToFP_internal'(_ConstantVal,_ToType) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstFPToUI'('LLVMValueRef'(),'LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMConstFPToUI'({'LLVMValueRef',ConstantVal},{'LLVMTypeRef',ToType}) ->
	'LLVMConstFPToUI_internal'(ConstantVal,ToType).
'LLVMConstFPToUI_internal'(_ConstantVal,_ToType) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstFPToSI'('LLVMValueRef'(),'LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMConstFPToSI'({'LLVMValueRef',ConstantVal},{'LLVMTypeRef',ToType}) ->
	'LLVMConstFPToSI_internal'(ConstantVal,ToType).
'LLVMConstFPToSI_internal'(_ConstantVal,_ToType) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstPtrToInt'('LLVMValueRef'(),'LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMConstPtrToInt'({'LLVMValueRef',ConstantVal},{'LLVMTypeRef',ToType}) ->
	'LLVMConstPtrToInt_internal'(ConstantVal,ToType).
'LLVMConstPtrToInt_internal'(_ConstantVal,_ToType) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstIntToPtr'('LLVMValueRef'(),'LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMConstIntToPtr'({'LLVMValueRef',ConstantVal},{'LLVMTypeRef',ToType}) ->
	'LLVMConstIntToPtr_internal'(ConstantVal,ToType).
'LLVMConstIntToPtr_internal'(_ConstantVal,_ToType) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstBitCast'('LLVMValueRef'(),'LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMConstBitCast'({'LLVMValueRef',ConstantVal},{'LLVMTypeRef',ToType}) ->
	'LLVMConstBitCast_internal'(ConstantVal,ToType).
'LLVMConstBitCast_internal'(_ConstantVal,_ToType) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstZExtOrBitCast'('LLVMValueRef'(),'LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMConstZExtOrBitCast'({'LLVMValueRef',ConstantVal},{'LLVMTypeRef',ToType}) ->
	'LLVMConstZExtOrBitCast_internal'(ConstantVal,ToType).
'LLVMConstZExtOrBitCast_internal'(_ConstantVal,_ToType) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstSExtOrBitCast'('LLVMValueRef'(),'LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMConstSExtOrBitCast'({'LLVMValueRef',ConstantVal},{'LLVMTypeRef',ToType}) ->
	'LLVMConstSExtOrBitCast_internal'(ConstantVal,ToType).
'LLVMConstSExtOrBitCast_internal'(_ConstantVal,_ToType) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstTruncOrBitCast'('LLVMValueRef'(),'LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMConstTruncOrBitCast'({'LLVMValueRef',ConstantVal},{'LLVMTypeRef',ToType}) ->
	'LLVMConstTruncOrBitCast_internal'(ConstantVal,ToType).
'LLVMConstTruncOrBitCast_internal'(_ConstantVal,_ToType) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstPointerCast'('LLVMValueRef'(),'LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMConstPointerCast'({'LLVMValueRef',ConstantVal},{'LLVMTypeRef',ToType}) ->
	'LLVMConstPointerCast_internal'(ConstantVal,ToType).
'LLVMConstPointerCast_internal'(_ConstantVal,_ToType) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstIntCast'('LLVMValueRef'(),'LLVMTypeRef'(),'LLVMBool'()) -> 'LLVMValueRef'().
'LLVMConstIntCast'({'LLVMValueRef',ConstantVal},{'LLVMTypeRef',ToType},{'LLVMBool',isSigned}) ->
	'LLVMConstIntCast_internal'(ConstantVal,ToType,isSigned).
'LLVMConstIntCast_internal'(_ConstantVal,_ToType,_isSigned) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstFPCast'('LLVMValueRef'(),'LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMConstFPCast'({'LLVMValueRef',ConstantVal},{'LLVMTypeRef',ToType}) ->
	'LLVMConstFPCast_internal'(ConstantVal,ToType).
'LLVMConstFPCast_internal'(_ConstantVal,_ToType) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstSelect'('LLVMValueRef'(),'LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstSelect'({'LLVMValueRef',ConstantCondition},{'LLVMValueRef',ConstantIfTrue},{'LLVMValueRef',ConstantIfFalse}) ->
	'LLVMConstSelect_internal'(ConstantCondition,ConstantIfTrue,ConstantIfFalse).
'LLVMConstSelect_internal'(_ConstantCondition,_ConstantIfTrue,_ConstantIfFalse) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstExtractElement'('LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstExtractElement'({'LLVMValueRef',VectorConstant},{'LLVMValueRef',IndexConstant}) ->
	'LLVMConstExtractElement_internal'(VectorConstant,IndexConstant).
'LLVMConstExtractElement_internal'(_VectorConstant,_IndexConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstInsertElement'('LLVMValueRef'(),'LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstInsertElement'({'LLVMValueRef',VectorConstant},{'LLVMValueRef',ElementValueConstant},{'LLVMValueRef',IndexConstant}) ->
	'LLVMConstInsertElement_internal'(VectorConstant,ElementValueConstant,IndexConstant).
'LLVMConstInsertElement_internal'(_VectorConstant,_ElementValueConstant,_IndexConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstShuffleVector'('LLVMValueRef'(),'LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMConstShuffleVector'({'LLVMValueRef',VectorAConstant},{'LLVMValueRef',VectorBConstant},{'LLVMValueRef',MaskConstant}) ->
	'LLVMConstShuffleVector_internal'(VectorAConstant,VectorBConstant,MaskConstant).
'LLVMConstShuffleVector_internal'(_VectorAConstant,_VectorBConstant,_MaskConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstExtractValue'('LLVMValueRef'(),llvm_ptr(integer()),integer()) -> 'LLVMValueRef'().
'LLVMConstExtractValue'({'LLVMValueRef',AggConstant},{ptr,{'unsigned',IdxList}},NumIdx) ->
	'LLVMConstExtractValue_internal'(AggConstant,IdxList,NumIdx).
'LLVMConstExtractValue_internal'(_AggConstant,_IdxList,_NumIdx) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstInsertValue'('LLVMValueRef'(),'LLVMValueRef'(),llvm_ptr(integer()),integer()) -> 'LLVMValueRef'().
'LLVMConstInsertValue'({'LLVMValueRef',AggConstant},{'LLVMValueRef',ElementValueConstant},{ptr,{'unsigned',IdxList}},NumIdx) ->
	'LLVMConstInsertValue_internal'(AggConstant,ElementValueConstant,IdxList,NumIdx).
'LLVMConstInsertValue_internal'(_AggConstant,_ElementValueConstant,_IdxList,_NumIdx) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMConstInlineAsm'('LLVMTypeRef'(),string(),string(),'LLVMBool'(),'LLVMBool'()) -> 'LLVMValueRef'().
'LLVMConstInlineAsm'({'LLVMTypeRef',Ty},AsmString,Constraints,{'LLVMBool',HasSideEffects},{'LLVMBool',IsAlignStack}) ->
	'LLVMConstInlineAsm_internal'(Ty,AsmString,Constraints,HasSideEffects,IsAlignStack).
'LLVMConstInlineAsm_internal'(_Ty,_AsmString,_Constraints,_HasSideEffects,_IsAlignStack) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBlockAddress'('LLVMValueRef'(),'LLVMBasicBlockRef'()) -> 'LLVMValueRef'().
'LLVMBlockAddress'({'LLVMValueRef',F},{'LLVMBasicBlockRef',BB}) ->
	'LLVMBlockAddress_internal'(F,BB).
'LLVMBlockAddress_internal'(_F,_BB) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetGlobalParent'('LLVMValueRef'()) -> 'LLVMModuleRef'().
'LLVMGetGlobalParent'({'LLVMValueRef',Global}) ->
	'LLVMGetGlobalParent_internal'(Global).
'LLVMGetGlobalParent_internal'(_Global) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsDeclaration'('LLVMValueRef'()) -> 'LLVMBool'().
'LLVMIsDeclaration'({'LLVMValueRef',Global}) ->
	'LLVMIsDeclaration_internal'(Global).
'LLVMIsDeclaration_internal'(_Global) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetLinkage'('LLVMValueRef'()) -> 'LLVMLinkage'().
'LLVMGetLinkage'({'LLVMValueRef',Global}) ->
	'LLVMGetLinkage_internal'(Global).
'LLVMGetLinkage_internal'(_Global) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMSetLinkage'('LLVMValueRef'(),'LLVMLinkage'()) -> atom().
'LLVMSetLinkage'({'LLVMValueRef',Global},{'LLVMLinkage',Linkage}) ->
	'LLVMSetLinkage_internal'(Global,Linkage).
'LLVMSetLinkage_internal'(_Global,_Linkage) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetSection'('LLVMValueRef'()) -> string().
'LLVMGetSection'({'LLVMValueRef',Global}) ->
	'LLVMGetSection_internal'(Global).
'LLVMGetSection_internal'(_Global) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMSetSection'('LLVMValueRef'(),string()) -> atom().
'LLVMSetSection'({'LLVMValueRef',Global},Section) ->
	'LLVMSetSection_internal'(Global,Section).
'LLVMSetSection_internal'(_Global,_Section) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetVisibility'('LLVMValueRef'()) -> 'LLVMVisibility'().
'LLVMGetVisibility'({'LLVMValueRef',Global}) ->
	'LLVMGetVisibility_internal'(Global).
'LLVMGetVisibility_internal'(_Global) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMSetVisibility'('LLVMValueRef'(),'LLVMVisibility'()) -> atom().
'LLVMSetVisibility'({'LLVMValueRef',Global},{'LLVMVisibility',Viz}) ->
	'LLVMSetVisibility_internal'(Global,Viz).
'LLVMSetVisibility_internal'(_Global,_Viz) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetAlignment'('LLVMValueRef'()) -> integer().
'LLVMGetAlignment'({'LLVMValueRef',Global}) ->
	'LLVMGetAlignment_internal'(Global).
'LLVMGetAlignment_internal'(_Global) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMSetAlignment'('LLVMValueRef'(),integer()) -> atom().
'LLVMSetAlignment'({'LLVMValueRef',Global},Bytes) ->
	'LLVMSetAlignment_internal'(Global,Bytes).
'LLVMSetAlignment_internal'(_Global,_Bytes) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMAddGlobal'('LLVMModuleRef'(),'LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMAddGlobal'({'LLVMModuleRef',M},{'LLVMTypeRef',Ty},Name) ->
	'LLVMAddGlobal_internal'(M,Ty,Name).
'LLVMAddGlobal_internal'(_M,_Ty,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMAddGlobalInAddressSpace'('LLVMModuleRef'(),'LLVMTypeRef'(),string(),integer()) -> 'LLVMValueRef'().
'LLVMAddGlobalInAddressSpace'({'LLVMModuleRef',M},{'LLVMTypeRef',Ty},Name,AddressSpace) ->
	'LLVMAddGlobalInAddressSpace_internal'(M,Ty,Name,AddressSpace).
'LLVMAddGlobalInAddressSpace_internal'(_M,_Ty,_Name,_AddressSpace) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetNamedGlobal'('LLVMModuleRef'(),string()) -> 'LLVMValueRef'().
'LLVMGetNamedGlobal'({'LLVMModuleRef',M},Name) ->
	'LLVMGetNamedGlobal_internal'(M,Name).
'LLVMGetNamedGlobal_internal'(_M,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetFirstGlobal'('LLVMModuleRef'()) -> 'LLVMValueRef'().
'LLVMGetFirstGlobal'({'LLVMModuleRef',M}) ->
	'LLVMGetFirstGlobal_internal'(M).
'LLVMGetFirstGlobal_internal'(_M) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetLastGlobal'('LLVMModuleRef'()) -> 'LLVMValueRef'().
'LLVMGetLastGlobal'({'LLVMModuleRef',M}) ->
	'LLVMGetLastGlobal_internal'(M).
'LLVMGetLastGlobal_internal'(_M) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetNextGlobal'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMGetNextGlobal'({'LLVMValueRef',GlobalVar}) ->
	'LLVMGetNextGlobal_internal'(GlobalVar).
'LLVMGetNextGlobal_internal'(_GlobalVar) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetPreviousGlobal'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMGetPreviousGlobal'({'LLVMValueRef',GlobalVar}) ->
	'LLVMGetPreviousGlobal_internal'(GlobalVar).
'LLVMGetPreviousGlobal_internal'(_GlobalVar) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMDeleteGlobal'('LLVMValueRef'()) -> atom().
'LLVMDeleteGlobal'({'LLVMValueRef',GlobalVar}) ->
	'LLVMDeleteGlobal_internal'(GlobalVar).
'LLVMDeleteGlobal_internal'(_GlobalVar) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetInitializer'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMGetInitializer'({'LLVMValueRef',GlobalVar}) ->
	'LLVMGetInitializer_internal'(GlobalVar).
'LLVMGetInitializer_internal'(_GlobalVar) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMSetInitializer'('LLVMValueRef'(),'LLVMValueRef'()) -> atom().
'LLVMSetInitializer'({'LLVMValueRef',GlobalVar},{'LLVMValueRef',ConstantVal}) ->
	'LLVMSetInitializer_internal'(GlobalVar,ConstantVal).
'LLVMSetInitializer_internal'(_GlobalVar,_ConstantVal) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsThreadLocal'('LLVMValueRef'()) -> 'LLVMBool'().
'LLVMIsThreadLocal'({'LLVMValueRef',GlobalVar}) ->
	'LLVMIsThreadLocal_internal'(GlobalVar).
'LLVMIsThreadLocal_internal'(_GlobalVar) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMSetThreadLocal'('LLVMValueRef'(),'LLVMBool'()) -> atom().
'LLVMSetThreadLocal'({'LLVMValueRef',GlobalVar},{'LLVMBool',IsThreadLocal}) ->
	'LLVMSetThreadLocal_internal'(GlobalVar,IsThreadLocal).
'LLVMSetThreadLocal_internal'(_GlobalVar,_IsThreadLocal) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsGlobalConstant'('LLVMValueRef'()) -> 'LLVMBool'().
'LLVMIsGlobalConstant'({'LLVMValueRef',GlobalVar}) ->
	'LLVMIsGlobalConstant_internal'(GlobalVar).
'LLVMIsGlobalConstant_internal'(_GlobalVar) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMSetGlobalConstant'('LLVMValueRef'(),'LLVMBool'()) -> atom().
'LLVMSetGlobalConstant'({'LLVMValueRef',GlobalVar},{'LLVMBool',IsConstant}) ->
	'LLVMSetGlobalConstant_internal'(GlobalVar,IsConstant).
'LLVMSetGlobalConstant_internal'(_GlobalVar,_IsConstant) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMAddAlias'('LLVMModuleRef'(),'LLVMTypeRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMAddAlias'({'LLVMModuleRef',M},{'LLVMTypeRef',Ty},{'LLVMValueRef',Aliasee},Name) ->
	'LLVMAddAlias_internal'(M,Ty,Aliasee,Name).
'LLVMAddAlias_internal'(_M,_Ty,_Aliasee,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMAddFunction'('LLVMModuleRef'(),string(),'LLVMTypeRef'()) -> 'LLVMValueRef'().
'LLVMAddFunction'({'LLVMModuleRef',M},Name,{'LLVMTypeRef',FunctionTy}) ->
	'LLVMAddFunction_internal'(M,Name,FunctionTy).
'LLVMAddFunction_internal'(_M,_Name,_FunctionTy) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetNamedFunction'('LLVMModuleRef'(),string()) -> 'LLVMValueRef'().
'LLVMGetNamedFunction'({'LLVMModuleRef',M},Name) ->
	'LLVMGetNamedFunction_internal'(M,Name).
'LLVMGetNamedFunction_internal'(_M,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetFirstFunction'('LLVMModuleRef'()) -> 'LLVMValueRef'().
'LLVMGetFirstFunction'({'LLVMModuleRef',M}) ->
	'LLVMGetFirstFunction_internal'(M).
'LLVMGetFirstFunction_internal'(_M) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetLastFunction'('LLVMModuleRef'()) -> 'LLVMValueRef'().
'LLVMGetLastFunction'({'LLVMModuleRef',M}) ->
	'LLVMGetLastFunction_internal'(M).
'LLVMGetLastFunction_internal'(_M) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetNextFunction'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMGetNextFunction'({'LLVMValueRef',Fn}) ->
	'LLVMGetNextFunction_internal'(Fn).
'LLVMGetNextFunction_internal'(_Fn) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetPreviousFunction'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMGetPreviousFunction'({'LLVMValueRef',Fn}) ->
	'LLVMGetPreviousFunction_internal'(Fn).
'LLVMGetPreviousFunction_internal'(_Fn) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMDeleteFunction'('LLVMValueRef'()) -> atom().
'LLVMDeleteFunction'({'LLVMValueRef',Fn}) ->
	'LLVMDeleteFunction_internal'(Fn).
'LLVMDeleteFunction_internal'(_Fn) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetIntrinsicID'('LLVMValueRef'()) -> integer().
'LLVMGetIntrinsicID'({'LLVMValueRef',Fn}) ->
	'LLVMGetIntrinsicID_internal'(Fn).
'LLVMGetIntrinsicID_internal'(_Fn) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetFunctionCallConv'('LLVMValueRef'()) -> integer().
'LLVMGetFunctionCallConv'({'LLVMValueRef',Fn}) ->
	'LLVMGetFunctionCallConv_internal'(Fn).
'LLVMGetFunctionCallConv_internal'(_Fn) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMSetFunctionCallConv'('LLVMValueRef'(),integer()) -> atom().
'LLVMSetFunctionCallConv'({'LLVMValueRef',Fn},CC) ->
	'LLVMSetFunctionCallConv_internal'(Fn,CC).
'LLVMSetFunctionCallConv_internal'(_Fn,_CC) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetGC'('LLVMValueRef'()) -> string().
'LLVMGetGC'({'LLVMValueRef',Fn}) ->
	'LLVMGetGC_internal'(Fn).
'LLVMGetGC_internal'(_Fn) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMSetGC'('LLVMValueRef'(),string()) -> atom().
'LLVMSetGC'({'LLVMValueRef',Fn},Name) ->
	'LLVMSetGC_internal'(Fn,Name).
'LLVMSetGC_internal'(_Fn,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMAddFunctionAttr'('LLVMValueRef'(),'LLVMAttribute'()) -> atom().
'LLVMAddFunctionAttr'({'LLVMValueRef',Fn},{'LLVMAttribute',PA}) ->
	'LLVMAddFunctionAttr_internal'(Fn,PA).
'LLVMAddFunctionAttr_internal'(_Fn,_PA) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetFunctionAttr'('LLVMValueRef'()) -> 'LLVMAttribute'().
'LLVMGetFunctionAttr'({'LLVMValueRef',Fn}) ->
	'LLVMGetFunctionAttr_internal'(Fn).
'LLVMGetFunctionAttr_internal'(_Fn) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMRemoveFunctionAttr'('LLVMValueRef'(),'LLVMAttribute'()) -> atom().
'LLVMRemoveFunctionAttr'({'LLVMValueRef',Fn},{'LLVMAttribute',PA}) ->
	'LLVMRemoveFunctionAttr_internal'(Fn,PA).
'LLVMRemoveFunctionAttr_internal'(_Fn,_PA) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMCountParams'('LLVMValueRef'()) -> integer().
'LLVMCountParams'({'LLVMValueRef',Fn}) ->
	'LLVMCountParams_internal'(Fn).
'LLVMCountParams_internal'(_Fn) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetParams'('LLVMValueRef'(),llvm_ptr('LLVMValueRef'())) -> atom().
'LLVMGetParams'({'LLVMValueRef',Fn},{ptr,{'LLVMValueRef',Params}}) ->
	'LLVMGetParams_internal'(Fn,Params).
'LLVMGetParams_internal'(_Fn,_Params) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetParam'('LLVMValueRef'(),integer()) -> 'LLVMValueRef'().
'LLVMGetParam'({'LLVMValueRef',Fn},Index) ->
	'LLVMGetParam_internal'(Fn,Index).
'LLVMGetParam_internal'(_Fn,_Index) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetParamParent'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMGetParamParent'({'LLVMValueRef',Inst}) ->
	'LLVMGetParamParent_internal'(Inst).
'LLVMGetParamParent_internal'(_Inst) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetFirstParam'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMGetFirstParam'({'LLVMValueRef',Fn}) ->
	'LLVMGetFirstParam_internal'(Fn).
'LLVMGetFirstParam_internal'(_Fn) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetLastParam'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMGetLastParam'({'LLVMValueRef',Fn}) ->
	'LLVMGetLastParam_internal'(Fn).
'LLVMGetLastParam_internal'(_Fn) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetNextParam'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMGetNextParam'({'LLVMValueRef',Arg}) ->
	'LLVMGetNextParam_internal'(Arg).
'LLVMGetNextParam_internal'(_Arg) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetPreviousParam'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMGetPreviousParam'({'LLVMValueRef',Arg}) ->
	'LLVMGetPreviousParam_internal'(Arg).
'LLVMGetPreviousParam_internal'(_Arg) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMAddAttribute'('LLVMValueRef'(),'LLVMAttribute'()) -> atom().
'LLVMAddAttribute'({'LLVMValueRef',Arg},{'LLVMAttribute',PA}) ->
	'LLVMAddAttribute_internal'(Arg,PA).
'LLVMAddAttribute_internal'(_Arg,_PA) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMRemoveAttribute'('LLVMValueRef'(),'LLVMAttribute'()) -> atom().
'LLVMRemoveAttribute'({'LLVMValueRef',Arg},{'LLVMAttribute',PA}) ->
	'LLVMRemoveAttribute_internal'(Arg,PA).
'LLVMRemoveAttribute_internal'(_Arg,_PA) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetAttribute'('LLVMValueRef'()) -> 'LLVMAttribute'().
'LLVMGetAttribute'({'LLVMValueRef',Arg}) ->
	'LLVMGetAttribute_internal'(Arg).
'LLVMGetAttribute_internal'(_Arg) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMSetParamAlignment'('LLVMValueRef'(),integer()) -> atom().
'LLVMSetParamAlignment'({'LLVMValueRef',Arg},align) ->
	'LLVMSetParamAlignment_internal'(Arg,align).
'LLVMSetParamAlignment_internal'(_Arg,_align) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBasicBlockAsValue'('LLVMBasicBlockRef'()) -> 'LLVMValueRef'().
'LLVMBasicBlockAsValue'({'LLVMBasicBlockRef',BB}) ->
	'LLVMBasicBlockAsValue_internal'(BB).
'LLVMBasicBlockAsValue_internal'(_BB) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMValueIsBasicBlock'('LLVMValueRef'()) -> 'LLVMBool'().
'LLVMValueIsBasicBlock'({'LLVMValueRef',Val}) ->
	'LLVMValueIsBasicBlock_internal'(Val).
'LLVMValueIsBasicBlock_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMValueAsBasicBlock'('LLVMValueRef'()) -> 'LLVMBasicBlockRef'().
'LLVMValueAsBasicBlock'({'LLVMValueRef',Val}) ->
	'LLVMValueAsBasicBlock_internal'(Val).
'LLVMValueAsBasicBlock_internal'(_Val) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetBasicBlockParent'('LLVMBasicBlockRef'()) -> 'LLVMValueRef'().
'LLVMGetBasicBlockParent'({'LLVMBasicBlockRef',BB}) ->
	'LLVMGetBasicBlockParent_internal'(BB).
'LLVMGetBasicBlockParent_internal'(_BB) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMCountBasicBlocks'('LLVMValueRef'()) -> integer().
'LLVMCountBasicBlocks'({'LLVMValueRef',Fn}) ->
	'LLVMCountBasicBlocks_internal'(Fn).
'LLVMCountBasicBlocks_internal'(_Fn) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetBasicBlocks'('LLVMValueRef'(),llvm_ptr('LLVMBasicBlockRef'())) -> atom().
'LLVMGetBasicBlocks'({'LLVMValueRef',Fn},{ptr,{'LLVMBasicBlockRef',BasicBlocks}}) ->
	'LLVMGetBasicBlocks_internal'(Fn,BasicBlocks).
'LLVMGetBasicBlocks_internal'(_Fn,_BasicBlocks) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetFirstBasicBlock'('LLVMValueRef'()) -> 'LLVMBasicBlockRef'().
'LLVMGetFirstBasicBlock'({'LLVMValueRef',Fn}) ->
	'LLVMGetFirstBasicBlock_internal'(Fn).
'LLVMGetFirstBasicBlock_internal'(_Fn) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetLastBasicBlock'('LLVMValueRef'()) -> 'LLVMBasicBlockRef'().
'LLVMGetLastBasicBlock'({'LLVMValueRef',Fn}) ->
	'LLVMGetLastBasicBlock_internal'(Fn).
'LLVMGetLastBasicBlock_internal'(_Fn) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetNextBasicBlock'('LLVMBasicBlockRef'()) -> 'LLVMBasicBlockRef'().
'LLVMGetNextBasicBlock'({'LLVMBasicBlockRef',BB}) ->
	'LLVMGetNextBasicBlock_internal'(BB).
'LLVMGetNextBasicBlock_internal'(_BB) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetPreviousBasicBlock'('LLVMBasicBlockRef'()) -> 'LLVMBasicBlockRef'().
'LLVMGetPreviousBasicBlock'({'LLVMBasicBlockRef',BB}) ->
	'LLVMGetPreviousBasicBlock_internal'(BB).
'LLVMGetPreviousBasicBlock_internal'(_BB) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetEntryBasicBlock'('LLVMValueRef'()) -> 'LLVMBasicBlockRef'().
'LLVMGetEntryBasicBlock'({'LLVMValueRef',Fn}) ->
	'LLVMGetEntryBasicBlock_internal'(Fn).
'LLVMGetEntryBasicBlock_internal'(_Fn) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMAppendBasicBlockInContext'('LLVMContextRef'(),'LLVMValueRef'(),string()) -> 'LLVMBasicBlockRef'().
'LLVMAppendBasicBlockInContext'({'LLVMContextRef',C},{'LLVMValueRef',Fn},Name) ->
	'LLVMAppendBasicBlockInContext_internal'(C,Fn,Name).
'LLVMAppendBasicBlockInContext_internal'(_C,_Fn,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMInsertBasicBlockInContext'('LLVMContextRef'(),'LLVMBasicBlockRef'(),string()) -> 'LLVMBasicBlockRef'().
'LLVMInsertBasicBlockInContext'({'LLVMContextRef',C},{'LLVMBasicBlockRef',BB},Name) ->
	'LLVMInsertBasicBlockInContext_internal'(C,BB,Name).
'LLVMInsertBasicBlockInContext_internal'(_C,_BB,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMAppendBasicBlock'('LLVMValueRef'(),string()) -> 'LLVMBasicBlockRef'().
'LLVMAppendBasicBlock'({'LLVMValueRef',Fn},Name) ->
	'LLVMAppendBasicBlock_internal'(Fn,Name).
'LLVMAppendBasicBlock_internal'(_Fn,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMInsertBasicBlock'('LLVMBasicBlockRef'(),string()) -> 'LLVMBasicBlockRef'().
'LLVMInsertBasicBlock'({'LLVMBasicBlockRef',InsertBeforeBB},Name) ->
	'LLVMInsertBasicBlock_internal'(InsertBeforeBB,Name).
'LLVMInsertBasicBlock_internal'(_InsertBeforeBB,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMDeleteBasicBlock'('LLVMBasicBlockRef'()) -> atom().
'LLVMDeleteBasicBlock'({'LLVMBasicBlockRef',BB}) ->
	'LLVMDeleteBasicBlock_internal'(BB).
'LLVMDeleteBasicBlock_internal'(_BB) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMMoveBasicBlockBefore'('LLVMBasicBlockRef'(),'LLVMBasicBlockRef'()) -> atom().
'LLVMMoveBasicBlockBefore'({'LLVMBasicBlockRef',BB},{'LLVMBasicBlockRef',MovePos}) ->
	'LLVMMoveBasicBlockBefore_internal'(BB,MovePos).
'LLVMMoveBasicBlockBefore_internal'(_BB,_MovePos) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMMoveBasicBlockAfter'('LLVMBasicBlockRef'(),'LLVMBasicBlockRef'()) -> atom().
'LLVMMoveBasicBlockAfter'({'LLVMBasicBlockRef',BB},{'LLVMBasicBlockRef',MovePos}) ->
	'LLVMMoveBasicBlockAfter_internal'(BB,MovePos).
'LLVMMoveBasicBlockAfter_internal'(_BB,_MovePos) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetInstructionParent'('LLVMValueRef'()) -> 'LLVMBasicBlockRef'().
'LLVMGetInstructionParent'({'LLVMValueRef',Inst}) ->
	'LLVMGetInstructionParent_internal'(Inst).
'LLVMGetInstructionParent_internal'(_Inst) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetFirstInstruction'('LLVMBasicBlockRef'()) -> 'LLVMValueRef'().
'LLVMGetFirstInstruction'({'LLVMBasicBlockRef',BB}) ->
	'LLVMGetFirstInstruction_internal'(BB).
'LLVMGetFirstInstruction_internal'(_BB) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetLastInstruction'('LLVMBasicBlockRef'()) -> 'LLVMValueRef'().
'LLVMGetLastInstruction'({'LLVMBasicBlockRef',BB}) ->
	'LLVMGetLastInstruction_internal'(BB).
'LLVMGetLastInstruction_internal'(_BB) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetNextInstruction'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMGetNextInstruction'({'LLVMValueRef',Inst}) ->
	'LLVMGetNextInstruction_internal'(Inst).
'LLVMGetNextInstruction_internal'(_Inst) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetPreviousInstruction'('LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMGetPreviousInstruction'({'LLVMValueRef',Inst}) ->
	'LLVMGetPreviousInstruction_internal'(Inst).
'LLVMGetPreviousInstruction_internal'(_Inst) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMSetInstructionCallConv'('LLVMValueRef'(),integer()) -> atom().
'LLVMSetInstructionCallConv'({'LLVMValueRef',Instr},CC) ->
	'LLVMSetInstructionCallConv_internal'(Instr,CC).
'LLVMSetInstructionCallConv_internal'(_Instr,_CC) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetInstructionCallConv'('LLVMValueRef'()) -> integer().
'LLVMGetInstructionCallConv'({'LLVMValueRef',Instr}) ->
	'LLVMGetInstructionCallConv_internal'(Instr).
'LLVMGetInstructionCallConv_internal'(_Instr) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMAddInstrAttribute'('LLVMValueRef'(),integer(),'LLVMAttribute'()) -> atom().
'LLVMAddInstrAttribute'({'LLVMValueRef',Instr},index,{'LLVMAttribute',PA}) ->
	'LLVMAddInstrAttribute_internal'(Instr,index,PA).
'LLVMAddInstrAttribute_internal'(_Instr,_index,_PA) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMRemoveInstrAttribute'('LLVMValueRef'(),integer(),'LLVMAttribute'()) -> atom().
'LLVMRemoveInstrAttribute'({'LLVMValueRef',Instr},index,{'LLVMAttribute',PA}) ->
	'LLVMRemoveInstrAttribute_internal'(Instr,index,PA).
'LLVMRemoveInstrAttribute_internal'(_Instr,_index,_PA) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMSetInstrParamAlignment'('LLVMValueRef'(),integer(),integer()) -> atom().
'LLVMSetInstrParamAlignment'({'LLVMValueRef',Instr},index,align) ->
	'LLVMSetInstrParamAlignment_internal'(Instr,index,align).
'LLVMSetInstrParamAlignment_internal'(_Instr,_index,_align) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMIsTailCall'('LLVMValueRef'()) -> 'LLVMBool'().
'LLVMIsTailCall'({'LLVMValueRef',CallInst}) ->
	'LLVMIsTailCall_internal'(CallInst).
'LLVMIsTailCall_internal'(_CallInst) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMSetTailCall'('LLVMValueRef'(),'LLVMBool'()) -> atom().
'LLVMSetTailCall'({'LLVMValueRef',CallInst},{'LLVMBool',IsTailCall}) ->
	'LLVMSetTailCall_internal'(CallInst,IsTailCall).
'LLVMSetTailCall_internal'(_CallInst,_IsTailCall) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMAddIncoming'('LLVMValueRef'(),llvm_ptr('LLVMValueRef'()),llvm_ptr('LLVMBasicBlockRef'()),integer()) -> atom().
'LLVMAddIncoming'({'LLVMValueRef',PhiNode},{ptr,{'LLVMValueRef',IncomingValues}},{ptr,{'LLVMBasicBlockRef',IncomingBlocks}},Count) ->
	'LLVMAddIncoming_internal'(PhiNode,IncomingValues,IncomingBlocks,Count).
'LLVMAddIncoming_internal'(_PhiNode,_IncomingValues,_IncomingBlocks,_Count) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMCountIncoming'('LLVMValueRef'()) -> integer().
'LLVMCountIncoming'({'LLVMValueRef',PhiNode}) ->
	'LLVMCountIncoming_internal'(PhiNode).
'LLVMCountIncoming_internal'(_PhiNode) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetIncomingValue'('LLVMValueRef'(),integer()) -> 'LLVMValueRef'().
'LLVMGetIncomingValue'({'LLVMValueRef',PhiNode},Index) ->
	'LLVMGetIncomingValue_internal'(PhiNode,Index).
'LLVMGetIncomingValue_internal'(_PhiNode,_Index) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetIncomingBlock'('LLVMValueRef'(),integer()) -> 'LLVMBasicBlockRef'().
'LLVMGetIncomingBlock'({'LLVMValueRef',PhiNode},Index) ->
	'LLVMGetIncomingBlock_internal'(PhiNode,Index).
'LLVMGetIncomingBlock_internal'(_PhiNode,_Index) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMCreateBuilderInContext'('LLVMContextRef'()) -> 'LLVMBuilderRef'().
'LLVMCreateBuilderInContext'({'LLVMContextRef',C}) ->
	'LLVMCreateBuilderInContext_internal'(C).
'LLVMCreateBuilderInContext_internal'(_C) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMCreateBuilder'() -> 'LLVMBuilderRef'().
'LLVMCreateBuilder'() ->
	'LLVMCreateBuilder_internal'().
'LLVMCreateBuilder_internal'() ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMPositionBuilder'('LLVMBuilderRef'(),'LLVMBasicBlockRef'(),'LLVMValueRef'()) -> atom().
'LLVMPositionBuilder'({'LLVMBuilderRef',Builder},{'LLVMBasicBlockRef',Block},{'LLVMValueRef',Instr}) ->
	'LLVMPositionBuilder_internal'(Builder,Block,Instr).
'LLVMPositionBuilder_internal'(_Builder,_Block,_Instr) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMPositionBuilderBefore'('LLVMBuilderRef'(),'LLVMValueRef'()) -> atom().
'LLVMPositionBuilderBefore'({'LLVMBuilderRef',Builder},{'LLVMValueRef',Instr}) ->
	'LLVMPositionBuilderBefore_internal'(Builder,Instr).
'LLVMPositionBuilderBefore_internal'(_Builder,_Instr) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMPositionBuilderAtEnd'('LLVMBuilderRef'(),'LLVMBasicBlockRef'()) -> atom().
'LLVMPositionBuilderAtEnd'({'LLVMBuilderRef',Builder},{'LLVMBasicBlockRef',Block}) ->
	'LLVMPositionBuilderAtEnd_internal'(Builder,Block).
'LLVMPositionBuilderAtEnd_internal'(_Builder,_Block) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetInsertBlock'('LLVMBuilderRef'()) -> 'LLVMBasicBlockRef'().
'LLVMGetInsertBlock'({'LLVMBuilderRef',Builder}) ->
	'LLVMGetInsertBlock_internal'(Builder).
'LLVMGetInsertBlock_internal'(_Builder) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMClearInsertionPosition'('LLVMBuilderRef'()) -> atom().
'LLVMClearInsertionPosition'({'LLVMBuilderRef',Builder}) ->
	'LLVMClearInsertionPosition_internal'(Builder).
'LLVMClearInsertionPosition_internal'(_Builder) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMInsertIntoBuilder'('LLVMBuilderRef'(),'LLVMValueRef'()) -> atom().
'LLVMInsertIntoBuilder'({'LLVMBuilderRef',Builder},{'LLVMValueRef',Instr}) ->
	'LLVMInsertIntoBuilder_internal'(Builder,Instr).
'LLVMInsertIntoBuilder_internal'(_Builder,_Instr) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMInsertIntoBuilderWithName'('LLVMBuilderRef'(),'LLVMValueRef'(),string()) -> atom().
'LLVMInsertIntoBuilderWithName'({'LLVMBuilderRef',Builder},{'LLVMValueRef',Instr},Name) ->
	'LLVMInsertIntoBuilderWithName_internal'(Builder,Instr,Name).
'LLVMInsertIntoBuilderWithName_internal'(_Builder,_Instr,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMDisposeBuilder'('LLVMBuilderRef'()) -> atom().
'LLVMDisposeBuilder'({'LLVMBuilderRef',Builder}) ->
	'LLVMDisposeBuilder_internal'(Builder).
'LLVMDisposeBuilder_internal'(_Builder) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMSetCurrentDebugLocation'('LLVMBuilderRef'(),'LLVMValueRef'()) -> atom().
'LLVMSetCurrentDebugLocation'({'LLVMBuilderRef',Builder},{'LLVMValueRef',L}) ->
	'LLVMSetCurrentDebugLocation_internal'(Builder,L).
'LLVMSetCurrentDebugLocation_internal'(_Builder,_L) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMGetCurrentDebugLocation'('LLVMBuilderRef'()) -> 'LLVMValueRef'().
'LLVMGetCurrentDebugLocation'({'LLVMBuilderRef',Builder}) ->
	'LLVMGetCurrentDebugLocation_internal'(Builder).
'LLVMGetCurrentDebugLocation_internal'(_Builder) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMSetInstDebugLocation'('LLVMBuilderRef'(),'LLVMValueRef'()) -> atom().
'LLVMSetInstDebugLocation'({'LLVMBuilderRef',Builder},{'LLVMValueRef',Inst}) ->
	'LLVMSetInstDebugLocation_internal'(Builder,Inst).
'LLVMSetInstDebugLocation_internal'(_Builder,_Inst) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildRetVoid'('LLVMBuilderRef'()) -> 'LLVMValueRef'().
'LLVMBuildRetVoid'({'LLVMBuilderRef',B}) ->
	'LLVMBuildRetVoid_internal'(B).
'LLVMBuildRetVoid_internal'(_B) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildRet'('LLVMBuilderRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMBuildRet'({'LLVMBuilderRef',B},{'LLVMValueRef',V}) ->
	'LLVMBuildRet_internal'(B,V).
'LLVMBuildRet_internal'(_B,_V) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildAggregateRet'('LLVMBuilderRef'(),llvm_ptr('LLVMValueRef'()),integer()) -> 'LLVMValueRef'().
'LLVMBuildAggregateRet'({'LLVMBuilderRef',B},{ptr,{'LLVMValueRef',RetVals}},N) ->
	'LLVMBuildAggregateRet_internal'(B,RetVals,N).
'LLVMBuildAggregateRet_internal'(_B,_RetVals,_N) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildBr'('LLVMBuilderRef'(),'LLVMBasicBlockRef'()) -> 'LLVMValueRef'().
'LLVMBuildBr'({'LLVMBuilderRef',B},{'LLVMBasicBlockRef',Dest}) ->
	'LLVMBuildBr_internal'(B,Dest).
'LLVMBuildBr_internal'(_B,_Dest) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildCondBr'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMBasicBlockRef'(),'LLVMBasicBlockRef'()) -> 'LLVMValueRef'().
'LLVMBuildCondBr'({'LLVMBuilderRef',B},{'LLVMValueRef',If},{'LLVMBasicBlockRef',Then},{'LLVMBasicBlockRef',Else}) ->
	'LLVMBuildCondBr_internal'(B,If,Then,Else).
'LLVMBuildCondBr_internal'(_B,_If,_Then,_Else) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildSwitch'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMBasicBlockRef'(),integer()) -> 'LLVMValueRef'().
'LLVMBuildSwitch'({'LLVMBuilderRef',B},{'LLVMValueRef',V},{'LLVMBasicBlockRef',Else},NumCases) ->
	'LLVMBuildSwitch_internal'(B,V,Else,NumCases).
'LLVMBuildSwitch_internal'(_B,_V,_Else,_NumCases) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildIndirectBr'('LLVMBuilderRef'(),'LLVMValueRef'(),integer()) -> 'LLVMValueRef'().
'LLVMBuildIndirectBr'({'LLVMBuilderRef',B},{'LLVMValueRef',Addr},NumDests) ->
	'LLVMBuildIndirectBr_internal'(B,Addr,NumDests).
'LLVMBuildIndirectBr_internal'(_B,_Addr,_NumDests) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildInvoke'('LLVMBuilderRef'(),'LLVMValueRef'(),llvm_ptr('LLVMValueRef'()),integer(),'LLVMBasicBlockRef'(),'LLVMBasicBlockRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildInvoke'({'LLVMBuilderRef',B},{'LLVMValueRef',Fn},{ptr,{'LLVMValueRef',Args}},NumArgs,{'LLVMBasicBlockRef',Then},{'LLVMBasicBlockRef',Catch},Name) ->
	'LLVMBuildInvoke_internal'(B,Fn,Args,NumArgs,Then,Catch,Name).
'LLVMBuildInvoke_internal'(_B,_Fn,_Args,_NumArgs,_Then,_Catch,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildUnwind'('LLVMBuilderRef'()) -> 'LLVMValueRef'().
'LLVMBuildUnwind'({'LLVMBuilderRef',B}) ->
	'LLVMBuildUnwind_internal'(B).
'LLVMBuildUnwind_internal'(_B) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildUnreachable'('LLVMBuilderRef'()) -> 'LLVMValueRef'().
'LLVMBuildUnreachable'({'LLVMBuilderRef',B}) ->
	'LLVMBuildUnreachable_internal'(B).
'LLVMBuildUnreachable_internal'(_B) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMAddCase'('LLVMValueRef'(),'LLVMValueRef'(),'LLVMBasicBlockRef'()) -> atom().
'LLVMAddCase'({'LLVMValueRef',Switch},{'LLVMValueRef',OnVal},{'LLVMBasicBlockRef',Dest}) ->
	'LLVMAddCase_internal'(Switch,OnVal,Dest).
'LLVMAddCase_internal'(_Switch,_OnVal,_Dest) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMAddDestination'('LLVMValueRef'(),'LLVMBasicBlockRef'()) -> atom().
'LLVMAddDestination'({'LLVMValueRef',IndirectBr},{'LLVMBasicBlockRef',Dest}) ->
	'LLVMAddDestination_internal'(IndirectBr,Dest).
'LLVMAddDestination_internal'(_IndirectBr,_Dest) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildAdd'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildAdd'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildAdd_internal'(B,LHS,RHS,Name).
'LLVMBuildAdd_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildNSWAdd'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildNSWAdd'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildNSWAdd_internal'(B,LHS,RHS,Name).
'LLVMBuildNSWAdd_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildNUWAdd'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildNUWAdd'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildNUWAdd_internal'(B,LHS,RHS,Name).
'LLVMBuildNUWAdd_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildFAdd'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildFAdd'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildFAdd_internal'(B,LHS,RHS,Name).
'LLVMBuildFAdd_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildSub'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildSub'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildSub_internal'(B,LHS,RHS,Name).
'LLVMBuildSub_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildNSWSub'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildNSWSub'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildNSWSub_internal'(B,LHS,RHS,Name).
'LLVMBuildNSWSub_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildNUWSub'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildNUWSub'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildNUWSub_internal'(B,LHS,RHS,Name).
'LLVMBuildNUWSub_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildFSub'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildFSub'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildFSub_internal'(B,LHS,RHS,Name).
'LLVMBuildFSub_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildMul'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildMul'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildMul_internal'(B,LHS,RHS,Name).
'LLVMBuildMul_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildNSWMul'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildNSWMul'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildNSWMul_internal'(B,LHS,RHS,Name).
'LLVMBuildNSWMul_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildNUWMul'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildNUWMul'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildNUWMul_internal'(B,LHS,RHS,Name).
'LLVMBuildNUWMul_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildFMul'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildFMul'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildFMul_internal'(B,LHS,RHS,Name).
'LLVMBuildFMul_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildUDiv'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildUDiv'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildUDiv_internal'(B,LHS,RHS,Name).
'LLVMBuildUDiv_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildSDiv'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildSDiv'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildSDiv_internal'(B,LHS,RHS,Name).
'LLVMBuildSDiv_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildExactSDiv'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildExactSDiv'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildExactSDiv_internal'(B,LHS,RHS,Name).
'LLVMBuildExactSDiv_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildFDiv'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildFDiv'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildFDiv_internal'(B,LHS,RHS,Name).
'LLVMBuildFDiv_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildURem'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildURem'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildURem_internal'(B,LHS,RHS,Name).
'LLVMBuildURem_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildSRem'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildSRem'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildSRem_internal'(B,LHS,RHS,Name).
'LLVMBuildSRem_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildFRem'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildFRem'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildFRem_internal'(B,LHS,RHS,Name).
'LLVMBuildFRem_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildShl'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildShl'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildShl_internal'(B,LHS,RHS,Name).
'LLVMBuildShl_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildLShr'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildLShr'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildLShr_internal'(B,LHS,RHS,Name).
'LLVMBuildLShr_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildAShr'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildAShr'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildAShr_internal'(B,LHS,RHS,Name).
'LLVMBuildAShr_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildAnd'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildAnd'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildAnd_internal'(B,LHS,RHS,Name).
'LLVMBuildAnd_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildOr'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildOr'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildOr_internal'(B,LHS,RHS,Name).
'LLVMBuildOr_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildXor'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildXor'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildXor_internal'(B,LHS,RHS,Name).
'LLVMBuildXor_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildBinOp'('LLVMBuilderRef'(),'LLVMOpcode'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildBinOp'({'LLVMBuilderRef',B},{'LLVMOpcode',Op},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildBinOp_internal'(B,Op,LHS,RHS,Name).
'LLVMBuildBinOp_internal'(_B,_Op,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildNeg'('LLVMBuilderRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildNeg'({'LLVMBuilderRef',B},{'LLVMValueRef',V},Name) ->
	'LLVMBuildNeg_internal'(B,V,Name).
'LLVMBuildNeg_internal'(_B,_V,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildNSWNeg'('LLVMBuilderRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildNSWNeg'({'LLVMBuilderRef',B},{'LLVMValueRef',V},Name) ->
	'LLVMBuildNSWNeg_internal'(B,V,Name).
'LLVMBuildNSWNeg_internal'(_B,_V,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildNUWNeg'('LLVMBuilderRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildNUWNeg'({'LLVMBuilderRef',B},{'LLVMValueRef',V},Name) ->
	'LLVMBuildNUWNeg_internal'(B,V,Name).
'LLVMBuildNUWNeg_internal'(_B,_V,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildFNeg'('LLVMBuilderRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildFNeg'({'LLVMBuilderRef',B},{'LLVMValueRef',V},Name) ->
	'LLVMBuildFNeg_internal'(B,V,Name).
'LLVMBuildFNeg_internal'(_B,_V,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildNot'('LLVMBuilderRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildNot'({'LLVMBuilderRef',B},{'LLVMValueRef',V},Name) ->
	'LLVMBuildNot_internal'(B,V,Name).
'LLVMBuildNot_internal'(_B,_V,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildMalloc'('LLVMBuilderRef'(),'LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildMalloc'({'LLVMBuilderRef',B},{'LLVMTypeRef',Ty},Name) ->
	'LLVMBuildMalloc_internal'(B,Ty,Name).
'LLVMBuildMalloc_internal'(_B,_Ty,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildArrayMalloc'('LLVMBuilderRef'(),'LLVMTypeRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildArrayMalloc'({'LLVMBuilderRef',B},{'LLVMTypeRef',Ty},{'LLVMValueRef',Val},Name) ->
	'LLVMBuildArrayMalloc_internal'(B,Ty,Val,Name).
'LLVMBuildArrayMalloc_internal'(_B,_Ty,_Val,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildAlloca'('LLVMBuilderRef'(),'LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildAlloca'({'LLVMBuilderRef',B},{'LLVMTypeRef',Ty},Name) ->
	'LLVMBuildAlloca_internal'(B,Ty,Name).
'LLVMBuildAlloca_internal'(_B,_Ty,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildArrayAlloca'('LLVMBuilderRef'(),'LLVMTypeRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildArrayAlloca'({'LLVMBuilderRef',B},{'LLVMTypeRef',Ty},{'LLVMValueRef',Val},Name) ->
	'LLVMBuildArrayAlloca_internal'(B,Ty,Val,Name).
'LLVMBuildArrayAlloca_internal'(_B,_Ty,_Val,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildFree'('LLVMBuilderRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMBuildFree'({'LLVMBuilderRef',B},{'LLVMValueRef',PointerVal}) ->
	'LLVMBuildFree_internal'(B,PointerVal).
'LLVMBuildFree_internal'(_B,_PointerVal) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildLoad'('LLVMBuilderRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildLoad'({'LLVMBuilderRef',B},{'LLVMValueRef',PointerVal},Name) ->
	'LLVMBuildLoad_internal'(B,PointerVal,Name).
'LLVMBuildLoad_internal'(_B,_PointerVal,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildStore'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'()) -> 'LLVMValueRef'().
'LLVMBuildStore'({'LLVMBuilderRef',B},{'LLVMValueRef',Val},{'LLVMValueRef',Ptr}) ->
	'LLVMBuildStore_internal'(B,Val,Ptr).
'LLVMBuildStore_internal'(_B,_Val,_Ptr) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildGEP'('LLVMBuilderRef'(),'LLVMValueRef'(),llvm_ptr('LLVMValueRef'()),integer(),string()) -> 'LLVMValueRef'().
'LLVMBuildGEP'({'LLVMBuilderRef',B},{'LLVMValueRef',Pointer},{ptr,{'LLVMValueRef',Indices}},NumIndices,Name) ->
	'LLVMBuildGEP_internal'(B,Pointer,Indices,NumIndices,Name).
'LLVMBuildGEP_internal'(_B,_Pointer,_Indices,_NumIndices,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildInBoundsGEP'('LLVMBuilderRef'(),'LLVMValueRef'(),llvm_ptr('LLVMValueRef'()),integer(),string()) -> 'LLVMValueRef'().
'LLVMBuildInBoundsGEP'({'LLVMBuilderRef',B},{'LLVMValueRef',Pointer},{ptr,{'LLVMValueRef',Indices}},NumIndices,Name) ->
	'LLVMBuildInBoundsGEP_internal'(B,Pointer,Indices,NumIndices,Name).
'LLVMBuildInBoundsGEP_internal'(_B,_Pointer,_Indices,_NumIndices,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildStructGEP'('LLVMBuilderRef'(),'LLVMValueRef'(),integer(),string()) -> 'LLVMValueRef'().
'LLVMBuildStructGEP'({'LLVMBuilderRef',B},{'LLVMValueRef',Pointer},Idx,Name) ->
	'LLVMBuildStructGEP_internal'(B,Pointer,Idx,Name).
'LLVMBuildStructGEP_internal'(_B,_Pointer,_Idx,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildGlobalString'('LLVMBuilderRef'(),string(),string()) -> 'LLVMValueRef'().
'LLVMBuildGlobalString'({'LLVMBuilderRef',B},Str,Name) ->
	'LLVMBuildGlobalString_internal'(B,Str,Name).
'LLVMBuildGlobalString_internal'(_B,_Str,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildGlobalStringPtr'('LLVMBuilderRef'(),string(),string()) -> 'LLVMValueRef'().
'LLVMBuildGlobalStringPtr'({'LLVMBuilderRef',B},Str,Name) ->
	'LLVMBuildGlobalStringPtr_internal'(B,Str,Name).
'LLVMBuildGlobalStringPtr_internal'(_B,_Str,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildTrunc'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildTrunc'({'LLVMBuilderRef',B},{'LLVMValueRef',Val},{'LLVMTypeRef',DestTy},Name) ->
	'LLVMBuildTrunc_internal'(B,Val,DestTy,Name).
'LLVMBuildTrunc_internal'(_B,_Val,_DestTy,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildZExt'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildZExt'({'LLVMBuilderRef',B},{'LLVMValueRef',Val},{'LLVMTypeRef',DestTy},Name) ->
	'LLVMBuildZExt_internal'(B,Val,DestTy,Name).
'LLVMBuildZExt_internal'(_B,_Val,_DestTy,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildSExt'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildSExt'({'LLVMBuilderRef',B},{'LLVMValueRef',Val},{'LLVMTypeRef',DestTy},Name) ->
	'LLVMBuildSExt_internal'(B,Val,DestTy,Name).
'LLVMBuildSExt_internal'(_B,_Val,_DestTy,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildFPToUI'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildFPToUI'({'LLVMBuilderRef',B},{'LLVMValueRef',Val},{'LLVMTypeRef',DestTy},Name) ->
	'LLVMBuildFPToUI_internal'(B,Val,DestTy,Name).
'LLVMBuildFPToUI_internal'(_B,_Val,_DestTy,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildFPToSI'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildFPToSI'({'LLVMBuilderRef',B},{'LLVMValueRef',Val},{'LLVMTypeRef',DestTy},Name) ->
	'LLVMBuildFPToSI_internal'(B,Val,DestTy,Name).
'LLVMBuildFPToSI_internal'(_B,_Val,_DestTy,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildUIToFP'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildUIToFP'({'LLVMBuilderRef',B},{'LLVMValueRef',Val},{'LLVMTypeRef',DestTy},Name) ->
	'LLVMBuildUIToFP_internal'(B,Val,DestTy,Name).
'LLVMBuildUIToFP_internal'(_B,_Val,_DestTy,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildSIToFP'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildSIToFP'({'LLVMBuilderRef',B},{'LLVMValueRef',Val},{'LLVMTypeRef',DestTy},Name) ->
	'LLVMBuildSIToFP_internal'(B,Val,DestTy,Name).
'LLVMBuildSIToFP_internal'(_B,_Val,_DestTy,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildFPTrunc'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildFPTrunc'({'LLVMBuilderRef',B},{'LLVMValueRef',Val},{'LLVMTypeRef',DestTy},Name) ->
	'LLVMBuildFPTrunc_internal'(B,Val,DestTy,Name).
'LLVMBuildFPTrunc_internal'(_B,_Val,_DestTy,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildFPExt'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildFPExt'({'LLVMBuilderRef',B},{'LLVMValueRef',Val},{'LLVMTypeRef',DestTy},Name) ->
	'LLVMBuildFPExt_internal'(B,Val,DestTy,Name).
'LLVMBuildFPExt_internal'(_B,_Val,_DestTy,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildPtrToInt'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildPtrToInt'({'LLVMBuilderRef',B},{'LLVMValueRef',Val},{'LLVMTypeRef',DestTy},Name) ->
	'LLVMBuildPtrToInt_internal'(B,Val,DestTy,Name).
'LLVMBuildPtrToInt_internal'(_B,_Val,_DestTy,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildIntToPtr'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildIntToPtr'({'LLVMBuilderRef',B},{'LLVMValueRef',Val},{'LLVMTypeRef',DestTy},Name) ->
	'LLVMBuildIntToPtr_internal'(B,Val,DestTy,Name).
'LLVMBuildIntToPtr_internal'(_B,_Val,_DestTy,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildBitCast'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildBitCast'({'LLVMBuilderRef',B},{'LLVMValueRef',Val},{'LLVMTypeRef',DestTy},Name) ->
	'LLVMBuildBitCast_internal'(B,Val,DestTy,Name).
'LLVMBuildBitCast_internal'(_B,_Val,_DestTy,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildZExtOrBitCast'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildZExtOrBitCast'({'LLVMBuilderRef',B},{'LLVMValueRef',Val},{'LLVMTypeRef',DestTy},Name) ->
	'LLVMBuildZExtOrBitCast_internal'(B,Val,DestTy,Name).
'LLVMBuildZExtOrBitCast_internal'(_B,_Val,_DestTy,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildSExtOrBitCast'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildSExtOrBitCast'({'LLVMBuilderRef',B},{'LLVMValueRef',Val},{'LLVMTypeRef',DestTy},Name) ->
	'LLVMBuildSExtOrBitCast_internal'(B,Val,DestTy,Name).
'LLVMBuildSExtOrBitCast_internal'(_B,_Val,_DestTy,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildTruncOrBitCast'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildTruncOrBitCast'({'LLVMBuilderRef',B},{'LLVMValueRef',Val},{'LLVMTypeRef',DestTy},Name) ->
	'LLVMBuildTruncOrBitCast_internal'(B,Val,DestTy,Name).
'LLVMBuildTruncOrBitCast_internal'(_B,_Val,_DestTy,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildCast'('LLVMBuilderRef'(),'LLVMOpcode'(),'LLVMValueRef'(),'LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildCast'({'LLVMBuilderRef',B},{'LLVMOpcode',Op},{'LLVMValueRef',Val},{'LLVMTypeRef',DestTy},Name) ->
	'LLVMBuildCast_internal'(B,Op,Val,DestTy,Name).
'LLVMBuildCast_internal'(_B,_Op,_Val,_DestTy,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildPointerCast'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildPointerCast'({'LLVMBuilderRef',B},{'LLVMValueRef',Val},{'LLVMTypeRef',DestTy},Name) ->
	'LLVMBuildPointerCast_internal'(B,Val,DestTy,Name).
'LLVMBuildPointerCast_internal'(_B,_Val,_DestTy,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildIntCast'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildIntCast'({'LLVMBuilderRef',B},{'LLVMValueRef',Val},{'LLVMTypeRef',DestTy},Name) ->
	'LLVMBuildIntCast_internal'(B,Val,DestTy,Name).
'LLVMBuildIntCast_internal'(_B,_Val,_DestTy,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildFPCast'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildFPCast'({'LLVMBuilderRef',B},{'LLVMValueRef',Val},{'LLVMTypeRef',DestTy},Name) ->
	'LLVMBuildFPCast_internal'(B,Val,DestTy,Name).
'LLVMBuildFPCast_internal'(_B,_Val,_DestTy,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildICmp'('LLVMBuilderRef'(),'LLVMIntPredicate'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildICmp'({'LLVMBuilderRef',B},{'LLVMIntPredicate',Op},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildICmp_internal'(B,Op,LHS,RHS,Name).
'LLVMBuildICmp_internal'(_B,_Op,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildFCmp'('LLVMBuilderRef'(),'LLVMRealPredicate'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildFCmp'({'LLVMBuilderRef',B},{'LLVMRealPredicate',Op},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildFCmp_internal'(B,Op,LHS,RHS,Name).
'LLVMBuildFCmp_internal'(_B,_Op,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildPhi'('LLVMBuilderRef'(),'LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildPhi'({'LLVMBuilderRef',B},{'LLVMTypeRef',Ty},Name) ->
	'LLVMBuildPhi_internal'(B,Ty,Name).
'LLVMBuildPhi_internal'(_B,_Ty,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildCall'('LLVMBuilderRef'(),'LLVMValueRef'(),llvm_ptr('LLVMValueRef'()),integer(),string()) -> 'LLVMValueRef'().
'LLVMBuildCall'({'LLVMBuilderRef',B},{'LLVMValueRef',Fn},{ptr,{'LLVMValueRef',Args}},NumArgs,Name) ->
	'LLVMBuildCall_internal'(B,Fn,Args,NumArgs,Name).
'LLVMBuildCall_internal'(_B,_Fn,_Args,_NumArgs,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildSelect'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildSelect'({'LLVMBuilderRef',B},{'LLVMValueRef',If},{'LLVMValueRef',Then},{'LLVMValueRef',Else},Name) ->
	'LLVMBuildSelect_internal'(B,If,Then,Else,Name).
'LLVMBuildSelect_internal'(_B,_If,_Then,_Else,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildVAArg'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMTypeRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildVAArg'({'LLVMBuilderRef',B},{'LLVMValueRef',List},{'LLVMTypeRef',Ty},Name) ->
	'LLVMBuildVAArg_internal'(B,List,Ty,Name).
'LLVMBuildVAArg_internal'(_B,_List,_Ty,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildExtractElement'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildExtractElement'({'LLVMBuilderRef',B},{'LLVMValueRef',VecVal},{'LLVMValueRef',Index},Name) ->
	'LLVMBuildExtractElement_internal'(B,VecVal,Index,Name).
'LLVMBuildExtractElement_internal'(_B,_VecVal,_Index,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildInsertElement'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildInsertElement'({'LLVMBuilderRef',B},{'LLVMValueRef',VecVal},{'LLVMValueRef',EltVal},{'LLVMValueRef',Index},Name) ->
	'LLVMBuildInsertElement_internal'(B,VecVal,EltVal,Index,Name).
'LLVMBuildInsertElement_internal'(_B,_VecVal,_EltVal,_Index,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildShuffleVector'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildShuffleVector'({'LLVMBuilderRef',B},{'LLVMValueRef',V1},{'LLVMValueRef',V2},{'LLVMValueRef',Mask},Name) ->
	'LLVMBuildShuffleVector_internal'(B,V1,V2,Mask,Name).
'LLVMBuildShuffleVector_internal'(_B,_V1,_V2,_Mask,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildExtractValue'('LLVMBuilderRef'(),'LLVMValueRef'(),integer(),string()) -> 'LLVMValueRef'().
'LLVMBuildExtractValue'({'LLVMBuilderRef',B},{'LLVMValueRef',AggVal},Index,Name) ->
	'LLVMBuildExtractValue_internal'(B,AggVal,Index,Name).
'LLVMBuildExtractValue_internal'(_B,_AggVal,_Index,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildInsertValue'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),integer(),string()) -> 'LLVMValueRef'().
'LLVMBuildInsertValue'({'LLVMBuilderRef',B},{'LLVMValueRef',AggVal},{'LLVMValueRef',EltVal},Index,Name) ->
	'LLVMBuildInsertValue_internal'(B,AggVal,EltVal,Index,Name).
'LLVMBuildInsertValue_internal'(_B,_AggVal,_EltVal,_Index,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildIsNull'('LLVMBuilderRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildIsNull'({'LLVMBuilderRef',B},{'LLVMValueRef',Val},Name) ->
	'LLVMBuildIsNull_internal'(B,Val,Name).
'LLVMBuildIsNull_internal'(_B,_Val,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildIsNotNull'('LLVMBuilderRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildIsNotNull'({'LLVMBuilderRef',B},{'LLVMValueRef',Val},Name) ->
	'LLVMBuildIsNotNull_internal'(B,Val,Name).
'LLVMBuildIsNotNull_internal'(_B,_Val,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMBuildPtrDiff'('LLVMBuilderRef'(),'LLVMValueRef'(),'LLVMValueRef'(),string()) -> 'LLVMValueRef'().
'LLVMBuildPtrDiff'({'LLVMBuilderRef',B},{'LLVMValueRef',LHS},{'LLVMValueRef',RHS},Name) ->
	'LLVMBuildPtrDiff_internal'(B,LHS,RHS,Name).
'LLVMBuildPtrDiff_internal'(_B,_LHS,_RHS,_Name) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMCreateModuleProviderForExistingModule'('LLVMModuleRef'()) -> 'LLVMModuleProviderRef'().
'LLVMCreateModuleProviderForExistingModule'({'LLVMModuleRef',M}) ->
	'LLVMCreateModuleProviderForExistingModule_internal'(M).
'LLVMCreateModuleProviderForExistingModule_internal'(_M) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMDisposeModuleProvider'('LLVMModuleProviderRef'()) -> atom().
'LLVMDisposeModuleProvider'({'LLVMModuleProviderRef',M}) ->
	'LLVMDisposeModuleProvider_internal'(M).
'LLVMDisposeModuleProvider_internal'(_M) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMCreateMemoryBufferWithContentsOfFile'(string(),llvm_ptr('LLVMMemoryBufferRef'()),'char **'()) -> 'LLVMBool'().
'LLVMCreateMemoryBufferWithContentsOfFile'(Path,{ptr,{'LLVMMemoryBufferRef',OutMemBuf}},{'char **',OutMessage}) ->
	'LLVMCreateMemoryBufferWithContentsOfFile_internal'(Path,OutMemBuf,OutMessage).
'LLVMCreateMemoryBufferWithContentsOfFile_internal'(_Path,_OutMemBuf,_OutMessage) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMCreateMemoryBufferWithSTDIN'(llvm_ptr('LLVMMemoryBufferRef'()),'char **'()) -> 'LLVMBool'().
'LLVMCreateMemoryBufferWithSTDIN'({ptr,{'LLVMMemoryBufferRef',OutMemBuf}},{'char **',OutMessage}) ->
	'LLVMCreateMemoryBufferWithSTDIN_internal'(OutMemBuf,OutMessage).
'LLVMCreateMemoryBufferWithSTDIN_internal'(_OutMemBuf,_OutMessage) ->
	nif_not_loaded.

%% @doc 
-spec 'LLVMDisposeMemoryBuffer'('LLVMMemoryBufferRef'()) -> atom().
'LLVMDisposeMemoryBuffer'({'LLVMMemoryBufferRef',MemBuf}) ->
	'LLVMDisposeMemoryBuffer_internal'(MemBuf).
'LLVMDisposeMemoryBuffer_internal'(_MemBuf) ->
	nif_not_loaded.

%% @doc Return the global pass registry, for use with initialization functions. See llvm::PassRegistry::getPassRegistry. 
-spec 'LLVMGetGlobalPassRegistry'() -> 'LLVMPassRegistryRef'().
'LLVMGetGlobalPassRegistry'() ->
	'LLVMGetGlobalPassRegistry_internal'().
'LLVMGetGlobalPassRegistry_internal'() ->
	nif_not_loaded.

%% @doc Constructs a new whole-module pass pipeline. This type of pipeline is suitable for link-time optimization and whole-module transformations. See llvm::PassManager::PassManager. 
-spec 'LLVMCreatePassManager'() -> 'LLVMPassManagerRef'().
'LLVMCreatePassManager'() ->
	'LLVMCreatePassManager_internal'().
'LLVMCreatePassManager_internal'() ->
	nif_not_loaded.

%% @doc Constructs a new function-by-function pass pipeline over the module provider. It does not take ownership of the module provider. This type of pipeline is suitable for code generation and JIT compilation tasks. See llvm::FunctionPassManager::FunctionPassManager. 
-spec 'LLVMCreateFunctionPassManagerForModule'('LLVMModuleRef'()) -> 'LLVMPassManagerRef'().
'LLVMCreateFunctionPassManagerForModule'({'LLVMModuleRef',M}) ->
	'LLVMCreateFunctionPassManagerForModule_internal'(M).
'LLVMCreateFunctionPassManagerForModule_internal'(_M) ->
	nif_not_loaded.

%% @doc Deprecated: Use LLVMCreateFunctionPassManagerForModule instead. 
-spec 'LLVMCreateFunctionPassManager'('LLVMModuleProviderRef'()) -> 'LLVMPassManagerRef'().
'LLVMCreateFunctionPassManager'({'LLVMModuleProviderRef',MP}) ->
	'LLVMCreateFunctionPassManager_internal'(MP).
'LLVMCreateFunctionPassManager_internal'(_MP) ->
	nif_not_loaded.

%% @doc Initializes, executes on the provided module, and finalizes all of the passes scheduled in the pass manager. Returns 1 if any of the passes modified the module, 0 otherwise. See llvm::PassManager::run(Module&). 
-spec 'LLVMRunPassManager'('LLVMPassManagerRef'(),'LLVMModuleRef'()) -> 'LLVMBool'().
'LLVMRunPassManager'({'LLVMPassManagerRef',PM},{'LLVMModuleRef',M}) ->
	'LLVMRunPassManager_internal'(PM,M).
'LLVMRunPassManager_internal'(_PM,_M) ->
	nif_not_loaded.

%% @doc Initializes all of the function passes scheduled in the function pass manager. Returns 1 if any of the passes modified the module, 0 otherwise. See llvm::FunctionPassManager::doInitialization. 
-spec 'LLVMInitializeFunctionPassManager'('LLVMPassManagerRef'()) -> 'LLVMBool'().
'LLVMInitializeFunctionPassManager'({'LLVMPassManagerRef',FPM}) ->
	'LLVMInitializeFunctionPassManager_internal'(FPM).
'LLVMInitializeFunctionPassManager_internal'(_FPM) ->
	nif_not_loaded.

%% @doc Executes all of the function passes scheduled in the function pass manager on the provided function. Returns 1 if any of the passes modified the function, false otherwise. See llvm::FunctionPassManager::run(Function&). 
-spec 'LLVMRunFunctionPassManager'('LLVMPassManagerRef'(),'LLVMValueRef'()) -> 'LLVMBool'().
'LLVMRunFunctionPassManager'({'LLVMPassManagerRef',FPM},{'LLVMValueRef',F}) ->
	'LLVMRunFunctionPassManager_internal'(FPM,F).
'LLVMRunFunctionPassManager_internal'(_FPM,_F) ->
	nif_not_loaded.

%% @doc Finalizes all of the function passes scheduled in in the function pass manager. Returns 1 if any of the passes modified the module, 0 otherwise. See llvm::FunctionPassManager::doFinalization. 
-spec 'LLVMFinalizeFunctionPassManager'('LLVMPassManagerRef'()) -> 'LLVMBool'().
'LLVMFinalizeFunctionPassManager'({'LLVMPassManagerRef',FPM}) ->
	'LLVMFinalizeFunctionPassManager_internal'(FPM).
'LLVMFinalizeFunctionPassManager_internal'(_FPM) ->
	nif_not_loaded.

%% @doc Frees the memory of a pass pipeline. For function pipelines, does not free the module provider. See llvm::PassManagerBase::~PassManagerBase. 
-spec 'LLVMDisposePassManager'('LLVMPassManagerRef'()) -> atom().
'LLVMDisposePassManager'({'LLVMPassManagerRef',PM}) ->
	'LLVMDisposePassManager_internal'(PM).
'LLVMDisposePassManager_internal'(_PM) ->
	nif_not_loaded.

%% --- Stop generating from Core_8h.xml

