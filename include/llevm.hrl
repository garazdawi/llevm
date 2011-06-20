%% -- Start generating from Core_8h.xml on {{2011,6,21},{0,28,3}}--

%% enum LLVMAttribute
-define(LLVMZExtAttribute,{'LLVMAttribute',1}).
-define(LLVMSExtAttribute,{'LLVMAttribute',2}).
-define(LLVMNoReturnAttribute,{'LLVMAttribute',4}).
-define(LLVMInRegAttribute,{'LLVMAttribute',8}).
-define(LLVMStructRetAttribute,{'LLVMAttribute',16}).
-define(LLVMNoUnwindAttribute,{'LLVMAttribute',32}).
-define(LLVMNoAliasAttribute,{'LLVMAttribute',64}).
-define(LLVMByValAttribute,{'LLVMAttribute',128}).
-define(LLVMNestAttribute,{'LLVMAttribute',256}).
-define(LLVMReadNoneAttribute,{'LLVMAttribute',512}).
-define(LLVMReadOnlyAttribute,{'LLVMAttribute',1024}).
-define(LLVMNoInlineAttribute,{'LLVMAttribute',2048}).
-define(LLVMAlwaysInlineAttribute,{'LLVMAttribute',4096}).
-define(LLVMOptimizeForSizeAttribute,{'LLVMAttribute',8192}).
-define(LLVMStackProtectAttribute,{'LLVMAttribute',16384}).
-define(LLVMStackProtectReqAttribute,{'LLVMAttribute',32768}).
-define(LLVMAlignment,{'LLVMAttribute',2031616}).
-define(LLVMNoCaptureAttribute,{'LLVMAttribute',2097152}).
-define(LLVMNoRedZoneAttribute,{'LLVMAttribute',4194304}).
-define(LLVMNoImplicitFloatAttribute,{'LLVMAttribute',8388608}).
-define(LLVMNakedAttribute,{'LLVMAttribute',16777216}).
-define(LLVMInlineHintAttribute,{'LLVMAttribute',33554432}).
-define(LLVMStackAlignment,{'LLVMAttribute',469762048}).

%% enum LLVMOpcode
-define(LLVMRet,{'LLVMOpcode',1}).
-define(LLVMBr,{'LLVMOpcode',2}).
-define(LLVMSwitch,{'LLVMOpcode',3}).
-define(LLVMIndirectBr,{'LLVMOpcode',4}).
-define(LLVMInvoke,{'LLVMOpcode',5}).
-define(LLVMUnwind,{'LLVMOpcode',6}).
-define(LLVMUnreachable,{'LLVMOpcode',7}).
-define(LLVMAdd,{'LLVMOpcode',8}).
-define(LLVMFAdd,{'LLVMOpcode',9}).
-define(LLVMSub,{'LLVMOpcode',10}).
-define(LLVMFSub,{'LLVMOpcode',11}).
-define(LLVMMul,{'LLVMOpcode',12}).
-define(LLVMFMul,{'LLVMOpcode',13}).
-define(LLVMUDiv,{'LLVMOpcode',14}).
-define(LLVMSDiv,{'LLVMOpcode',15}).
-define(LLVMFDiv,{'LLVMOpcode',16}).
-define(LLVMURem,{'LLVMOpcode',17}).
-define(LLVMSRem,{'LLVMOpcode',18}).
-define(LLVMFRem,{'LLVMOpcode',19}).
-define(LLVMShl,{'LLVMOpcode',20}).
-define(LLVMLShr,{'LLVMOpcode',21}).
-define(LLVMAShr,{'LLVMOpcode',22}).
-define(LLVMAnd,{'LLVMOpcode',23}).
-define(LLVMOr,{'LLVMOpcode',24}).
-define(LLVMXor,{'LLVMOpcode',25}).
-define(LLVMAlloca,{'LLVMOpcode',26}).
-define(LLVMLoad,{'LLVMOpcode',27}).
-define(LLVMStore,{'LLVMOpcode',28}).
-define(LLVMGetElementPtr,{'LLVMOpcode',29}).
-define(LLVMTrunc,{'LLVMOpcode',30}).
-define(LLVMZExt,{'LLVMOpcode',31}).
-define(LLVMSExt,{'LLVMOpcode',32}).
-define(LLVMFPToUI,{'LLVMOpcode',33}).
-define(LLVMFPToSI,{'LLVMOpcode',34}).
-define(LLVMUIToFP,{'LLVMOpcode',35}).
-define(LLVMSIToFP,{'LLVMOpcode',36}).
-define(LLVMFPTrunc,{'LLVMOpcode',37}).
-define(LLVMFPExt,{'LLVMOpcode',38}).
-define(LLVMPtrToInt,{'LLVMOpcode',39}).
-define(LLVMIntToPtr,{'LLVMOpcode',40}).
-define(LLVMBitCast,{'LLVMOpcode',41}).
-define(LLVMICmp,{'LLVMOpcode',42}).
-define(LLVMFCmp,{'LLVMOpcode',43}).
-define(LLVMPHI,{'LLVMOpcode',44}).
-define(LLVMCall,{'LLVMOpcode',45}).
-define(LLVMSelect,{'LLVMOpcode',46}).
-define(LLVMVAArg,{'LLVMOpcode',49}).
-define(LLVMExtractElement,{'LLVMOpcode',50}).
-define(LLVMInsertElement,{'LLVMOpcode',51}).
-define(LLVMShuffleVector,{'LLVMOpcode',52}).
-define(LLVMExtractValue,{'LLVMOpcode',53}).
-define(LLVMInsertValue,{'LLVMOpcode',54}).

%% enum LLVMTypeKind
-define(LLVMVoidTypeKind,{'LLVMTypeKind',1}).
%% type with no size 
-define(LLVMFloatTypeKind,{'LLVMTypeKind',2}).
%% 32 bit floating point type 
-define(LLVMDoubleTypeKind,{'LLVMTypeKind',3}).
%% 64 bit floating point type 
-define(LLVMX86_FP80TypeKind,{'LLVMTypeKind',4}).
%% 80 bit floating point type (X87) 
-define(LLVMFP128TypeKind,{'LLVMTypeKind',5}).
%% 128 bit floating point type (112-bit mantissa) 
-define(LLVMPPC_FP128TypeKind,{'LLVMTypeKind',6}).
%% 128 bit floating point type (two 64-bits) 
-define(LLVMLabelTypeKind,{'LLVMTypeKind',7}).
%% Labels 
-define(LLVMIntegerTypeKind,{'LLVMTypeKind',8}).
%% Arbitrary bit width integers 
-define(LLVMFunctionTypeKind,{'LLVMTypeKind',9}).
%% Functions 
-define(LLVMStructTypeKind,{'LLVMTypeKind',10}).
%% Structures 
-define(LLVMArrayTypeKind,{'LLVMTypeKind',11}).
%% Arrays 
-define(LLVMPointerTypeKind,{'LLVMTypeKind',12}).
%% Pointers 
-define(LLVMOpaqueTypeKind,{'LLVMTypeKind',13}).
%% Opaque: type with unknown structure 
-define(LLVMVectorTypeKind,{'LLVMTypeKind',14}).
%% SIMD 'packed' format, or other vector type 
-define(LLVMMetadataTypeKind,{'LLVMTypeKind',15}).
%% Metadata 
-define(LLVMX86_MMXTypeKind,{'LLVMTypeKind',16}).
%% X86 MMX 

%% enum LLVMLinkage
-define(LLVMExternalLinkage,{'LLVMLinkage',1}).
%% Externally visible function 
-define(LLVMAvailableExternallyLinkage,{'LLVMLinkage',2}).
-define(LLVMLinkOnceAnyLinkage,{'LLVMLinkage',3}).
%% Keep one copy of function when linking (inline) 
-define(LLVMLinkOnceODRLinkage,{'LLVMLinkage',4}).
%% Same, but only replaced by something equivalent. 
-define(LLVMWeakAnyLinkage,{'LLVMLinkage',5}).
%% Keep one copy of function when linking (weak) 
-define(LLVMWeakODRLinkage,{'LLVMLinkage',6}).
%% Same, but only replaced by something equivalent. 
-define(LLVMAppendingLinkage,{'LLVMLinkage',7}).
%% Special purpose, only applies to global arrays 
-define(LLVMInternalLinkage,{'LLVMLinkage',8}).
%% Rename collisions when linking (static functions) 
-define(LLVMPrivateLinkage,{'LLVMLinkage',9}).
%% Like Internal, but omit from symbol table 
-define(LLVMDLLImportLinkage,{'LLVMLinkage',10}).
%% Function to be imported from DLL 
-define(LLVMDLLExportLinkage,{'LLVMLinkage',11}).
%% Function to be accessible from DLL 
-define(LLVMExternalWeakLinkage,{'LLVMLinkage',12}).
%% ExternalWeak linkage description 
-define(LLVMGhostLinkage,{'LLVMLinkage',13}).
%% Obsolete 
-define(LLVMCommonLinkage,{'LLVMLinkage',14}).
%% Tentative definitions 
-define(LLVMLinkerPrivateLinkage,{'LLVMLinkage',15}).
%% Like Private, but linker removes. 
-define(LLVMLinkerPrivateWeakLinkage,{'LLVMLinkage',16}).
%% Like LinkerPrivate, but is weak. 
-define(LLVMLinkerPrivateWeakDefAutoLinkage,{'LLVMLinkage',17}).
%% Like LinkerPrivateWeak, but possibly hidden. 

%% enum LLVMVisibility
-define(LLVMDefaultVisibility,{'LLVMVisibility',1}).
%% The GV is visible 
-define(LLVMHiddenVisibility,{'LLVMVisibility',2}).
%% The GV is hidden 
-define(LLVMProtectedVisibility,{'LLVMVisibility',3}).
%% The GV is protected 

%% enum LLVMCallConv
-define(LLVMCCallConv,{'LLVMCallConv',0}).
-define(LLVMFastCallConv,{'LLVMCallConv',8}).
-define(LLVMColdCallConv,{'LLVMCallConv',9}).
-define(LLVMX86StdcallCallConv,{'LLVMCallConv',64}).
-define(LLVMX86FastcallCallConv,{'LLVMCallConv',65}).

%% enum LLVMIntPredicate
-define(LLVMIntEQ,{'LLVMIntPredicate',32}).
%% equal 
-define(LLVMIntNE,{'LLVMIntPredicate',1}).
%% not equal 
-define(LLVMIntUGT,{'LLVMIntPredicate',2}).
%% unsigned greater than 
-define(LLVMIntUGE,{'LLVMIntPredicate',3}).
%% unsigned greater or equal 
-define(LLVMIntULT,{'LLVMIntPredicate',4}).
%% unsigned less than 
-define(LLVMIntULE,{'LLVMIntPredicate',5}).
%% unsigned less or equal 
-define(LLVMIntSGT,{'LLVMIntPredicate',6}).
%% signed greater than 
-define(LLVMIntSGE,{'LLVMIntPredicate',7}).
%% signed greater or equal 
-define(LLVMIntSLT,{'LLVMIntPredicate',8}).
%% signed less than 
-define(LLVMIntSLE,{'LLVMIntPredicate',9}).
%% signed less or equal 

%% enum LLVMRealPredicate
-define(LLVMRealPredicateFalse,{'LLVMRealPredicate',1}).
%% Always false (always folded) 
-define(LLVMRealOEQ,{'LLVMRealPredicate',2}).
%% True if ordered and equal 
-define(LLVMRealOGT,{'LLVMRealPredicate',3}).
%% True if ordered and greater than 
-define(LLVMRealOGE,{'LLVMRealPredicate',4}).
%% True if ordered and greater than or equal 
-define(LLVMRealOLT,{'LLVMRealPredicate',5}).
%% True if ordered and less than 
-define(LLVMRealOLE,{'LLVMRealPredicate',6}).
%% True if ordered and less than or equal 
-define(LLVMRealONE,{'LLVMRealPredicate',7}).
%% True if ordered and operands are unequal 
-define(LLVMRealORD,{'LLVMRealPredicate',8}).
%% True if ordered (no nans) 
-define(LLVMRealUNO,{'LLVMRealPredicate',9}).
%% True if unordered: isnan(X) | isnan(Y) 
-define(LLVMRealUEQ,{'LLVMRealPredicate',10}).
%% True if unordered or equal 
-define(LLVMRealUGT,{'LLVMRealPredicate',11}).
%% True if unordered or greater than 
-define(LLVMRealUGE,{'LLVMRealPredicate',12}).
%% True if unordered, greater than, or equal 
-define(LLVMRealULT,{'LLVMRealPredicate',13}).
%% True if unordered or less than 
-define(LLVMRealULE,{'LLVMRealPredicate',14}).
%% True if unordered, less than, or equal 
-define(LLVMRealUNE,{'LLVMRealPredicate',15}).
%% True if unordered or not equal 
-define(LLVMRealPredicateTrue,{'LLVMRealPredicate',16}).
%% Always true (always folded) 

%% --- Stop generating from Core_8h.xml

