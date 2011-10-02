%% @@CONST@@
%% -- Start generating from lto_8h.xml on {{2011,10,2},{18,38,42}}--

%% enum lto_symbol_attributes
-define(LTO_SYMBOL_ALIGNMENT_MASK,{'lto_symbol_attributes',31}).
-define(LTO_SYMBOL_PERMISSIONS_MASK,{'lto_symbol_attributes',224}).
-define(LTO_SYMBOL_PERMISSIONS_CODE,{'lto_symbol_attributes',160}).
-define(LTO_SYMBOL_PERMISSIONS_DATA,{'lto_symbol_attributes',192}).
-define(LTO_SYMBOL_PERMISSIONS_RODATA,{'lto_symbol_attributes',128}).
-define(LTO_SYMBOL_DEFINITION_MASK,{'lto_symbol_attributes',1792}).
-define(LTO_SYMBOL_DEFINITION_REGULAR,{'lto_symbol_attributes',256}).
-define(LTO_SYMBOL_DEFINITION_TENTATIVE,{'lto_symbol_attributes',512}).
-define(LTO_SYMBOL_DEFINITION_WEAK,{'lto_symbol_attributes',768}).
-define(LTO_SYMBOL_DEFINITION_UNDEFINED,{'lto_symbol_attributes',1024}).
-define(LTO_SYMBOL_DEFINITION_WEAKUNDEF,{'lto_symbol_attributes',1280}).
-define(LTO_SYMBOL_SCOPE_MASK,{'lto_symbol_attributes',14336}).
-define(LTO_SYMBOL_SCOPE_INTERNAL,{'lto_symbol_attributes',2048}).
-define(LTO_SYMBOL_SCOPE_HIDDEN,{'lto_symbol_attributes',4096}).
-define(LTO_SYMBOL_SCOPE_PROTECTED,{'lto_symbol_attributes',8192}).
-define(LTO_SYMBOL_SCOPE_DEFAULT,{'lto_symbol_attributes',6144}).
-define(LTO_SYMBOL_SCOPE_DEFAULT_CAN_BE_HIDDEN,{'lto_symbol_attributes',10240}).

%% enum lto_debug_model
-define(LTO_DEBUG_MODEL_NONE,{'lto_debug_model',0}).
-define(LTO_DEBUG_MODEL_DWARF,{'lto_debug_model',1}).

%% enum lto_codegen_model
-define(LTO_CODEGEN_PIC_MODEL_STATIC,{'lto_codegen_model',0}).
-define(LTO_CODEGEN_PIC_MODEL_DYNAMIC,{'lto_codegen_model',1}).
-define(LTO_CODEGEN_PIC_MODEL_DYNAMIC_NO_PIC,{'lto_codegen_model',2}).

%% --- Stop generating from lto_8h.xml

%% -- Start generating from Target_8h.xml on {{2011,10,2},{18,38,41}}--

%% enum LLVMByteOrdering
-define(LLVMBigEndian,{'LLVMByteOrdering',0}).
-define(LLVMLittleEndian,{'LLVMByteOrdering',1}).

%% --- Stop generating from Target_8h.xml

%% -- Start generating from Scalar_8h.xml on {{2011,10,2},{18,38,40}}--

%% --- Stop generating from Scalar_8h.xml

%% -- Start generating from LinkTimeOptimizer_8h.xml on {{2011,10,2},{18,38,38}}--

%% enum llvm_lto_status
-define(LLVM_LTO_UNKNOWN,{'llvm_lto_status',0}).
-define(LLVM_LTO_OPT_SUCCESS,{'llvm_lto_status',1}).
-define(LLVM_LTO_READ_SUCCESS,{'llvm_lto_status',2}).
-define(LLVM_LTO_READ_FAILURE,{'llvm_lto_status',3}).
-define(LLVM_LTO_WRITE_FAILURE,{'llvm_lto_status',4}).
-define(LLVM_LTO_NO_TARGET,{'llvm_lto_status',5}).
-define(LLVM_LTO_NO_WORK,{'llvm_lto_status',6}).
-define(LLVM_LTO_MODULE_MERGE_FAILURE,{'llvm_lto_status',7}).
-define(LLVM_LTO_ASM_FAILURE,{'llvm_lto_status',8}).
-define(LLVM_LTO_NULL_OBJECT,{'llvm_lto_status',9}).

%% --- Stop generating from LinkTimeOptimizer_8h.xml

%% -- Start generating from Initialization_8h.xml on {{2011,10,2},{18,38,37}}--

%% --- Stop generating from Initialization_8h.xml

%% -- Start generating from IPO_8h.xml on {{2011,10,2},{18,38,36}}--

%% --- Stop generating from IPO_8h.xml

%% -- Start generating from ExecutionEngine_8h.xml on {{2011,10,2},{18,38,35}}--

%% --- Stop generating from ExecutionEngine_8h.xml

%% -- Start generating from EnhancedDisassembly_8h.xml on {{2011,10,2},{18,38,34}}--

%% enum @0
-define(kEDAssemblySyntaxX86Intel,{'@0',0}).
%% kEDAssemblySyntaxX86Intel Intel syntax for i386 and x86_64. 
-define(kEDAssemblySyntaxX86ATT,{'@0',1}).
%% kEDAssemblySyntaxX86ATT AT&amp;T syntax for i386 and x86_64. 
-define(kEDAssemblySyntaxARMUAL,{'@0',2}).

%% --- Stop generating from EnhancedDisassembly_8h.xml

%% -- Start generating from Core_8h.xml on {{2011,10,2},{18,38,33}}--

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
-define(LLVMVoidTypeKind,{'LLVMTypeKind',0}).
%% type with no size 
-define(LLVMFloatTypeKind,{'LLVMTypeKind',1}).
%% 32 bit floating point type 
-define(LLVMDoubleTypeKind,{'LLVMTypeKind',2}).
%% 64 bit floating point type 
-define(LLVMX86_FP80TypeKind,{'LLVMTypeKind',3}).
%% 80 bit floating point type (X87) 
-define(LLVMFP128TypeKind,{'LLVMTypeKind',4}).
%% 128 bit floating point type (112-bit mantissa) 
-define(LLVMPPC_FP128TypeKind,{'LLVMTypeKind',5}).
%% 128 bit floating point type (two 64-bits) 
-define(LLVMLabelTypeKind,{'LLVMTypeKind',6}).
%% Labels 
-define(LLVMIntegerTypeKind,{'LLVMTypeKind',7}).
%% Arbitrary bit width integers 
-define(LLVMFunctionTypeKind,{'LLVMTypeKind',8}).
%% Functions 
-define(LLVMStructTypeKind,{'LLVMTypeKind',9}).
%% Structures 
-define(LLVMArrayTypeKind,{'LLVMTypeKind',10}).
%% Arrays 
-define(LLVMPointerTypeKind,{'LLVMTypeKind',11}).
%% Pointers 
-define(LLVMOpaqueTypeKind,{'LLVMTypeKind',12}).
%% Opaque: type with unknown structure 
-define(LLVMVectorTypeKind,{'LLVMTypeKind',13}).
%% SIMD 'packed' format, or other vector type 
-define(LLVMMetadataTypeKind,{'LLVMTypeKind',14}).
%% Metadata 
-define(LLVMX86_MMXTypeKind,{'LLVMTypeKind',15}).
%% X86 MMX 

%% enum LLVMLinkage
-define(LLVMExternalLinkage,{'LLVMLinkage',0}).
%% Externally visible function 
-define(LLVMAvailableExternallyLinkage,{'LLVMLinkage',1}).
-define(LLVMLinkOnceAnyLinkage,{'LLVMLinkage',2}).
%% Keep one copy of function when linking (inline) 
-define(LLVMLinkOnceODRLinkage,{'LLVMLinkage',3}).
%% Same, but only replaced by something equivalent. 
-define(LLVMWeakAnyLinkage,{'LLVMLinkage',4}).
%% Keep one copy of function when linking (weak) 
-define(LLVMWeakODRLinkage,{'LLVMLinkage',5}).
%% Same, but only replaced by something equivalent. 
-define(LLVMAppendingLinkage,{'LLVMLinkage',6}).
%% Special purpose, only applies to global arrays 
-define(LLVMInternalLinkage,{'LLVMLinkage',7}).
%% Rename collisions when linking (static functions) 
-define(LLVMPrivateLinkage,{'LLVMLinkage',8}).
%% Like Internal, but omit from symbol table 
-define(LLVMDLLImportLinkage,{'LLVMLinkage',9}).
%% Function to be imported from DLL 
-define(LLVMDLLExportLinkage,{'LLVMLinkage',10}).
%% Function to be accessible from DLL 
-define(LLVMExternalWeakLinkage,{'LLVMLinkage',11}).
%% ExternalWeak linkage description 
-define(LLVMGhostLinkage,{'LLVMLinkage',12}).
%% Obsolete 
-define(LLVMCommonLinkage,{'LLVMLinkage',13}).
%% Tentative definitions 
-define(LLVMLinkerPrivateLinkage,{'LLVMLinkage',14}).
%% Like Private, but linker removes. 
-define(LLVMLinkerPrivateWeakLinkage,{'LLVMLinkage',15}).
%% Like LinkerPrivate, but is weak. 
-define(LLVMLinkerPrivateWeakDefAutoLinkage,{'LLVMLinkage',16}).
%% Like LinkerPrivateWeak, but possibly hidden. 

%% enum LLVMVisibility
-define(LLVMDefaultVisibility,{'LLVMVisibility',0}).
%% The GV is visible 
-define(LLVMHiddenVisibility,{'LLVMVisibility',1}).
%% The GV is hidden 
-define(LLVMProtectedVisibility,{'LLVMVisibility',2}).
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
-define(LLVMIntNE,{'LLVMIntPredicate',0}).
%% not equal 
-define(LLVMIntUGT,{'LLVMIntPredicate',1}).
%% unsigned greater than 
-define(LLVMIntUGE,{'LLVMIntPredicate',2}).
%% unsigned greater or equal 
-define(LLVMIntULT,{'LLVMIntPredicate',3}).
%% unsigned less than 
-define(LLVMIntULE,{'LLVMIntPredicate',4}).
%% unsigned less or equal 
-define(LLVMIntSGT,{'LLVMIntPredicate',5}).
%% signed greater than 
-define(LLVMIntSGE,{'LLVMIntPredicate',6}).
%% signed greater or equal 
-define(LLVMIntSLT,{'LLVMIntPredicate',7}).
%% signed less than 
-define(LLVMIntSLE,{'LLVMIntPredicate',8}).
%% signed less or equal 

%% enum LLVMRealPredicate
-define(LLVMRealPredicateFalse,{'LLVMRealPredicate',0}).
%% Always false (always folded) 
-define(LLVMRealOEQ,{'LLVMRealPredicate',1}).
%% True if ordered and equal 
-define(LLVMRealOGT,{'LLVMRealPredicate',2}).
%% True if ordered and greater than 
-define(LLVMRealOGE,{'LLVMRealPredicate',3}).
%% True if ordered and greater than or equal 
-define(LLVMRealOLT,{'LLVMRealPredicate',4}).
%% True if ordered and less than 
-define(LLVMRealOLE,{'LLVMRealPredicate',5}).
%% True if ordered and less than or equal 
-define(LLVMRealONE,{'LLVMRealPredicate',6}).
%% True if ordered and operands are unequal 
-define(LLVMRealORD,{'LLVMRealPredicate',7}).
%% True if ordered (no nans) 
-define(LLVMRealUNO,{'LLVMRealPredicate',8}).
%% True if unordered: isnan(X) | isnan(Y) 
-define(LLVMRealUEQ,{'LLVMRealPredicate',9}).
%% True if unordered or equal 
-define(LLVMRealUGT,{'LLVMRealPredicate',10}).
%% True if unordered or greater than 
-define(LLVMRealUGE,{'LLVMRealPredicate',11}).
%% True if unordered, greater than, or equal 
-define(LLVMRealULT,{'LLVMRealPredicate',12}).
%% True if unordered or less than 
-define(LLVMRealULE,{'LLVMRealPredicate',13}).
%% True if unordered, less than, or equal 
-define(LLVMRealUNE,{'LLVMRealPredicate',14}).
%% True if unordered or not equal 
-define(LLVMRealPredicateTrue,{'LLVMRealPredicate',15}).
%% Always true (always folded) 

%% --- Stop generating from Core_8h.xml

%% -- Start generating from BitWriter_8h.xml on {{2011,10,2},{18,38,33}}--

%% --- Stop generating from BitWriter_8h.xml

%% -- Start generating from BitReader_8h.xml on {{2011,10,2},{18,38,33}}--

%% --- Stop generating from BitReader_8h.xml

%% -- Start generating from Analysis_8h.xml on {{2011,10,2},{18,38,33}}--

%% enum LLVMVerifierFailureAction
-define(LLVMAbortProcessAction,{'LLVMVerifierFailureAction',0}).
-define(LLVMPrintMessageAction,{'LLVMVerifierFailureAction',1}).
-define(LLVMReturnStatusAction,{'LLVMVerifierFailureAction',2}).

%% --- Stop generating from Analysis_8h.xml

