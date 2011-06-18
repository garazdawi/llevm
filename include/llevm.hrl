%% -- Start generating from Core_8h.xml on {{2011,6,18},{18,1,28}}--

%% enum LLVMAttribute
-define(LLVMZExtAttribute,{'LLVMZExtAttribute',1}).
-define(LLVMSExtAttribute,{'LLVMSExtAttribute',2}).
-define(LLVMNoReturnAttribute,{'LLVMNoReturnAttribute',4}).
-define(LLVMInRegAttribute,{'LLVMInRegAttribute',8}).
-define(LLVMStructRetAttribute,{'LLVMStructRetAttribute',16}).
-define(LLVMNoUnwindAttribute,{'LLVMNoUnwindAttribute',32}).
-define(LLVMNoAliasAttribute,{'LLVMNoAliasAttribute',64}).
-define(LLVMByValAttribute,{'LLVMByValAttribute',128}).
-define(LLVMNestAttribute,{'LLVMNestAttribute',256}).
-define(LLVMReadNoneAttribute,{'LLVMReadNoneAttribute',512}).
-define(LLVMReadOnlyAttribute,{'LLVMReadOnlyAttribute',1024}).
-define(LLVMNoInlineAttribute,{'LLVMNoInlineAttribute',2048}).
-define(LLVMAlwaysInlineAttribute,{'LLVMAlwaysInlineAttribute',4096}).
-define(LLVMOptimizeForSizeAttribute,{'LLVMOptimizeForSizeAttribute',8192}).
-define(LLVMStackProtectAttribute,{'LLVMStackProtectAttribute',16384}).
-define(LLVMStackProtectReqAttribute,{'LLVMStackProtectReqAttribute',32768}).
-define(LLVMAlignment,{'LLVMAlignment',2031616}).
-define(LLVMNoCaptureAttribute,{'LLVMNoCaptureAttribute',2097152}).
-define(LLVMNoRedZoneAttribute,{'LLVMNoRedZoneAttribute',4194304}).
-define(LLVMNoImplicitFloatAttribute,{'LLVMNoImplicitFloatAttribute',8388608}).
-define(LLVMNakedAttribute,{'LLVMNakedAttribute',16777216}).
-define(LLVMInlineHintAttribute,{'LLVMInlineHintAttribute',33554432}).
-define(LLVMStackAlignment,{'LLVMStackAlignment',469762048}).

%% enum LLVMOpcode
-define(LLVMRet,{'LLVMRet',1}).
-define(LLVMBr,{'LLVMBr',2}).
-define(LLVMSwitch,{'LLVMSwitch',3}).
-define(LLVMIndirectBr,{'LLVMIndirectBr',4}).
-define(LLVMInvoke,{'LLVMInvoke',5}).
-define(LLVMUnwind,{'LLVMUnwind',6}).
-define(LLVMUnreachable,{'LLVMUnreachable',7}).
-define(LLVMAdd,{'LLVMAdd',8}).
-define(LLVMFAdd,{'LLVMFAdd',9}).
-define(LLVMSub,{'LLVMSub',10}).
-define(LLVMFSub,{'LLVMFSub',11}).
-define(LLVMMul,{'LLVMMul',12}).
-define(LLVMFMul,{'LLVMFMul',13}).
-define(LLVMUDiv,{'LLVMUDiv',14}).
-define(LLVMSDiv,{'LLVMSDiv',15}).
-define(LLVMFDiv,{'LLVMFDiv',16}).
-define(LLVMURem,{'LLVMURem',17}).
-define(LLVMSRem,{'LLVMSRem',18}).
-define(LLVMFRem,{'LLVMFRem',19}).
-define(LLVMShl,{'LLVMShl',20}).
-define(LLVMLShr,{'LLVMLShr',21}).
-define(LLVMAShr,{'LLVMAShr',22}).
-define(LLVMAnd,{'LLVMAnd',23}).
-define(LLVMOr,{'LLVMOr',24}).
-define(LLVMXor,{'LLVMXor',25}).
-define(LLVMAlloca,{'LLVMAlloca',26}).
-define(LLVMLoad,{'LLVMLoad',27}).
-define(LLVMStore,{'LLVMStore',28}).
-define(LLVMGetElementPtr,{'LLVMGetElementPtr',29}).
-define(LLVMTrunc,{'LLVMTrunc',30}).
-define(LLVMZExt,{'LLVMZExt',31}).
-define(LLVMSExt,{'LLVMSExt',32}).
-define(LLVMFPToUI,{'LLVMFPToUI',33}).
-define(LLVMFPToSI,{'LLVMFPToSI',34}).
-define(LLVMUIToFP,{'LLVMUIToFP',35}).
-define(LLVMSIToFP,{'LLVMSIToFP',36}).
-define(LLVMFPTrunc,{'LLVMFPTrunc',37}).
-define(LLVMFPExt,{'LLVMFPExt',38}).
-define(LLVMPtrToInt,{'LLVMPtrToInt',39}).
-define(LLVMIntToPtr,{'LLVMIntToPtr',40}).
-define(LLVMBitCast,{'LLVMBitCast',41}).
-define(LLVMICmp,{'LLVMICmp',42}).
-define(LLVMFCmp,{'LLVMFCmp',43}).
-define(LLVMPHI,{'LLVMPHI',44}).
-define(LLVMCall,{'LLVMCall',45}).
-define(LLVMSelect,{'LLVMSelect',46}).
-define(LLVMVAArg,{'LLVMVAArg',49}).
-define(LLVMExtractElement,{'LLVMExtractElement',50}).
-define(LLVMInsertElement,{'LLVMInsertElement',51}).
-define(LLVMShuffleVector,{'LLVMShuffleVector',52}).
-define(LLVMExtractValue,{'LLVMExtractValue',53}).
-define(LLVMInsertValue,{'LLVMInsertValue',54}).

%% enum LLVMTypeKind
-define(LLVMVoidTypeKind,{'LLVMVoidTypeKind',1}).
%% type with no size 
-define(LLVMFloatTypeKind,{'LLVMFloatTypeKind',2}).
%% 32 bit floating point type 
-define(LLVMDoubleTypeKind,{'LLVMDoubleTypeKind',3}).
%% 64 bit floating point type 
-define(LLVMX86_FP80TypeKind,{'LLVMX86_FP80TypeKind',4}).
%% 80 bit floating point type (X87) 
-define(LLVMFP128TypeKind,{'LLVMFP128TypeKind',5}).
%% 128 bit floating point type (112-bit mantissa) 
-define(LLVMPPC_FP128TypeKind,{'LLVMPPC_FP128TypeKind',6}).
%% 128 bit floating point type (two 64-bits) 
-define(LLVMLabelTypeKind,{'LLVMLabelTypeKind',7}).
%% Labels 
-define(LLVMIntegerTypeKind,{'LLVMIntegerTypeKind',8}).
%% Arbitrary bit width integers 
-define(LLVMFunctionTypeKind,{'LLVMFunctionTypeKind',9}).
%% Functions 
-define(LLVMStructTypeKind,{'LLVMStructTypeKind',10}).
%% Structures 
-define(LLVMArrayTypeKind,{'LLVMArrayTypeKind',11}).
%% Arrays 
-define(LLVMPointerTypeKind,{'LLVMPointerTypeKind',12}).
%% Pointers 
-define(LLVMOpaqueTypeKind,{'LLVMOpaqueTypeKind',13}).
%% Opaque: type with unknown structure 
-define(LLVMVectorTypeKind,{'LLVMVectorTypeKind',14}).
%% SIMD 'packed' format, or other vector type 
-define(LLVMMetadataTypeKind,{'LLVMMetadataTypeKind',15}).
%% Metadata 
-define(LLVMX86_MMXTypeKind,{'LLVMX86_MMXTypeKind',16}).
%% X86 MMX 

%% enum LLVMLinkage
-define(LLVMExternalLinkage,{'LLVMExternalLinkage',1}).
%% Externally visible function 
-define(LLVMAvailableExternallyLinkage,{'LLVMAvailableExternallyLinkage',2}).
-define(LLVMLinkOnceAnyLinkage,{'LLVMLinkOnceAnyLinkage',3}).
%% Keep one copy of function when linking (inline) 
-define(LLVMLinkOnceODRLinkage,{'LLVMLinkOnceODRLinkage',4}).
%% Same, but only replaced by something equivalent. 
-define(LLVMWeakAnyLinkage,{'LLVMWeakAnyLinkage',5}).
%% Keep one copy of function when linking (weak) 
-define(LLVMWeakODRLinkage,{'LLVMWeakODRLinkage',6}).
%% Same, but only replaced by something equivalent. 
-define(LLVMAppendingLinkage,{'LLVMAppendingLinkage',7}).
%% Special purpose, only applies to global arrays 
-define(LLVMInternalLinkage,{'LLVMInternalLinkage',8}).
%% Rename collisions when linking (static functions) 
-define(LLVMPrivateLinkage,{'LLVMPrivateLinkage',9}).
%% Like Internal, but omit from symbol table 
-define(LLVMDLLImportLinkage,{'LLVMDLLImportLinkage',10}).
%% Function to be imported from DLL 
-define(LLVMDLLExportLinkage,{'LLVMDLLExportLinkage',11}).
%% Function to be accessible from DLL 
-define(LLVMExternalWeakLinkage,{'LLVMExternalWeakLinkage',12}).
%% ExternalWeak linkage description 
-define(LLVMGhostLinkage,{'LLVMGhostLinkage',13}).
%% Obsolete 
-define(LLVMCommonLinkage,{'LLVMCommonLinkage',14}).
%% Tentative definitions 
-define(LLVMLinkerPrivateLinkage,{'LLVMLinkerPrivateLinkage',15}).
%% Like Private, but linker removes. 
-define(LLVMLinkerPrivateWeakLinkage,{'LLVMLinkerPrivateWeakLinkage',16}).
%% Like LinkerPrivate, but is weak. 
-define(LLVMLinkerPrivateWeakDefAutoLinkage,{'LLVMLinkerPrivateWeakDefAutoLinkage',17}).
%% Like LinkerPrivateWeak, but possibly hidden. 

%% enum LLVMVisibility
-define(LLVMDefaultVisibility,{'LLVMDefaultVisibility',1}).
%% The GV is visible 
-define(LLVMHiddenVisibility,{'LLVMHiddenVisibility',2}).
%% The GV is hidden 
-define(LLVMProtectedVisibility,{'LLVMProtectedVisibility',3}).
%% The GV is protected 

%% enum LLVMCallConv
-define(LLVMCCallConv,{'LLVMCCallConv',0}).
-define(LLVMFastCallConv,{'LLVMFastCallConv',8}).
-define(LLVMColdCallConv,{'LLVMColdCallConv',9}).
-define(LLVMX86StdcallCallConv,{'LLVMX86StdcallCallConv',64}).
-define(LLVMX86FastcallCallConv,{'LLVMX86FastcallCallConv',65}).

%% enum LLVMIntPredicate
-define(LLVMIntEQ,{'LLVMIntEQ',32}).
%% equal 
-define(LLVMIntNE,{'LLVMIntNE',1}).
%% not equal 
-define(LLVMIntUGT,{'LLVMIntUGT',2}).
%% unsigned greater than 
-define(LLVMIntUGE,{'LLVMIntUGE',3}).
%% unsigned greater or equal 
-define(LLVMIntULT,{'LLVMIntULT',4}).
%% unsigned less than 
-define(LLVMIntULE,{'LLVMIntULE',5}).
%% unsigned less or equal 
-define(LLVMIntSGT,{'LLVMIntSGT',6}).
%% signed greater than 
-define(LLVMIntSGE,{'LLVMIntSGE',7}).
%% signed greater or equal 
-define(LLVMIntSLT,{'LLVMIntSLT',8}).
%% signed less than 
-define(LLVMIntSLE,{'LLVMIntSLE',9}).
%% signed less or equal 

%% enum LLVMRealPredicate
-define(LLVMRealPredicateFalse,{'LLVMRealPredicateFalse',1}).
%% Always false (always folded) 
-define(LLVMRealOEQ,{'LLVMRealOEQ',2}).
%% True if ordered and equal 
-define(LLVMRealOGT,{'LLVMRealOGT',3}).
%% True if ordered and greater than 
-define(LLVMRealOGE,{'LLVMRealOGE',4}).
%% True if ordered and greater than or equal 
-define(LLVMRealOLT,{'LLVMRealOLT',5}).
%% True if ordered and less than 
-define(LLVMRealOLE,{'LLVMRealOLE',6}).
%% True if ordered and less than or equal 
-define(LLVMRealONE,{'LLVMRealONE',7}).
%% True if ordered and operands are unequal 
-define(LLVMRealORD,{'LLVMRealORD',8}).
%% True if ordered (no nans) 
-define(LLVMRealUNO,{'LLVMRealUNO',9}).
%% True if unordered: isnan(X) | isnan(Y) 
-define(LLVMRealUEQ,{'LLVMRealUEQ',10}).
%% True if unordered or equal 
-define(LLVMRealUGT,{'LLVMRealUGT',11}).
%% True if unordered or greater than 
-define(LLVMRealUGE,{'LLVMRealUGE',12}).
%% True if unordered, greater than, or equal 
-define(LLVMRealULT,{'LLVMRealULT',13}).
%% True if unordered or less than 
-define(LLVMRealULE,{'LLVMRealULE',14}).
%% True if unordered, less than, or equal 
-define(LLVMRealUNE,{'LLVMRealUNE',15}).
%% True if unordered or not equal 
-define(LLVMRealPredicateTrue,{'LLVMRealPredicateTrue',16}).
%% Always true (always folded) 

%% --- Stop generating from Core_8h.xml

