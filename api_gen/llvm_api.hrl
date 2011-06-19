-record(typedef, {name, type, is_ptr, docs }).

-record(enum_member, {name, value, docs }).
-record(enum, {name, members = [], docs }).

-record(param, {name, type, erlang_type, erlang_tag, array = false}).
-record(function, {name, return_type, params = [], docs }).

-define(ARRAYS, [{"LLVMFunctionType", "ParamTypes"}]).

-define(LIMIT, when 
      Name == "LLVMModuleCreateWithName"; 
      Name == "LLVMDumpModule";
      Name == "LLVMConstReal"; 
      Name == "LLVMDoubleType";
      Name == "LLVMCreateBuilderInContext"; 
      Name == "LLVMGetGlobalContext";
      Name == "LLVMConstReal";
      Name == "LLVMAppendBasicBlockInContext";
      Name == "LLVMBuildRet";
      Name == "LLVMFunctionType";
%      Name == "LLVMBuildFAdd"; 
%      Name == "LLVMBuildFSub";
%      Name == "LLVMBuildFMul"; 
%      Name == "LLVMBuildFCmp";
%      Name == "LLVMBuildUIToFP"; 
%      Name == "LLVMGetNamedFunction";
%      Name == "LLVMCountParams"; 
%      Name == "LLVMBuildCall";
      Name == "LLVMAddFunction"
%      Name == "LLVMSetLinkage";
%      Name == "LLVMDeleteFunction"; 
%      Name == "LLVMCountBasicBlocks"
      ).
%-define(LIMIT, when length(Params) == 0).
%-define(LIMIT, ).
