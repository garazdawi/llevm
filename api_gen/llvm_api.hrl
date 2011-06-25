-record(typedef, {name, type, is_ptr, docs }).

-record(enum_member, {name, value, docs }).
-record(enum, {name, members = [], docs }).

-record(param, {name, type, erlang_type, erlang_tag, array = false}).
-record(function, {name, return_type, params = [], docs }).

-define(ARRAYS, [{"LLVMFunctionType", "ParamTypes"},
		 {"LLVMStructTypeInContext","ElementTypes"},
		 {"LLVMStructType","ElementTypes"},
		 {"LLVMMDNode","Vals"},
		 {"LLVMConstStructInContext","ConstantVals"},
		 {"LLVMConstArray","ConstantVals"},
		 {"LLVMConstStruct","ConstantVals"},
		 {"LLVMConstVector","ScalarConstantVals"},
		 {"LLVMConstGEP","ConstantIndices"},
		 {"LLVMConstInBoundsGEP","ConstantIndices"},
		 {"LLVMAddIncoming","IncomingValues"},
		 {"LLVMAddIncoming","IncomingBlocks"},
		 {"LLVMBuildAggregateRet","RetVals"},
		 {"LLVMBuildInvoke","Args"},
		 {"LLVMBuildGEP","Indices"},
		 {"LLVMBuildInBoundsGEP","Indices"},
		 {"LLVMBuildCall","Args"}
		]).

-define(IS_ENUM(Value),
	Value == "LLVMAttribute";
	Value == "LLVMOpCode";
	Value == "LLVMTypeKind";
	Value == "LLVMLinkage";
	Value == "LLVMVisibility";
	Value == "LLVMCallConv";
	Value == "LLVMIntPredicate";
	Value == "LLVMRealPredicate").
	
	    

-define(LIMIT, when 
      Name == "LLVMModuleCreateWithName"; 
      Name == "LLVMDumpModule";
      Name == "LLVMDumpValue";
      Name == "LLVMConstReal"; 
      Name == "LLVMCreateBuilderInContext"; 
      Name == "LLVMGetGlobalContext";
      Name == "LLVMConstReal";
      Name == "LLVMAppendBasicBlock";
      Name == "LLVMPositionBuilderAtEnd";
      Name == "LLVMBuildRet";
      Name == "LLVMFunctionType";
      Name == "LLVMBuildFAdd";
      Name == "LLVMBuildFMul";
      Name == "LLVMBuildFSub";
      Name == "LLVMGetParam";
      Name == "LLVMBuildFCmp";
      Name == "LLVMGetNamedFunction";
      Name == "LLVMSetLinkage";
      Name == "LLVMGetLinkage";
      Name == "LLVMBuildCall";
      Name == "LLVMBuildUIToFP";
      Name == "LLVMConstNull";
      Name == "LLVMGetBasicBlockParent"; 
      Name == "LLVMGetInsertBlock"; 
      Name == "LLVMBuildCondBr"; 
      Name == "LLVMBuildBr"; 
      Name == "LLVMBuildPhi"; 
      Name == "LLVMAddIncoming"; 
      Name == "LLVMAddFunction";
%% Types
      Name == "LLVMInt1Type";
      Name == "LLVMInt8Type";
      Name == "LLVMInt16Type";
      Name == "LLVMInt32Type";
      Name == "LLVMInt64Type";
      Name == "LLVMIntType";
      Name == "LLVMInt1TypeInContext";
      Name == "LLVMInt8TypeInContext";
      Name == "LLVMInt16TypeInContext";
      Name == "LLVMInt32TypeInContext";
      Name == "LLVMInt64TypeInContext";
      Name == "LLVMIntTypeInContext";
      Name == "LLVMFloatType";
      Name == "LLVMDoubleType";
      Name == "LLVMX86FP80TypeType";
      Name == "LLVMFP128Type";
      Name == "LLVMPPCFP128Type";
      Name == "LLVMFloatTypeInContext";
      Name == "LLVMDoubleTypeInContext";
      Name == "LLVMX86FP80TypeTypeInContext";
      Name == "LLVMFP128TypeInContext";
      Name == "LLVMPPCFP128TypeInContext";
      Name == "LLVMCreateFunctionPassManagerForModule";
      Name == "LLVMInitializeFunctionPassManager";
      Name == "LLVMFinalizeFunctionPassManager";
      Name == "LLVMRunFunctionPassManager";
      Name == "LLVMRunPassManager";
%% Transforms
      Name == "LLVMAddGVNPass";
      Name == "LLVMAddInstructionCombiningPass";
      Name == "LLVMAddReassociatePass";
      Name == "LLVMAddCFGSimplificationPass";
%      Name == "LLVMGetNamedFunction";
%      Name == "LLVMCountParams"; 
%      Name == "LLVMBuildCall";
%      Name == "LLVMSetLinkage";
%      Name == "LLVMDeleteFunction"; 
%      Name == "LLVMCountBasicBlocks"
      false
      ).
%-define(LIMIT, when length(Params) == 0).
%-define(LIMIT, ).
