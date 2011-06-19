-module(basic_SUITE).

-compile(export_all).

init_per_suite(Config) ->
    Config.

end_per_suite(_Config) ->
    ok.

init_per_testcase(_Tc, Config) ->
    Config.

end_per_testcase(_Tc, _Config) ->
    ok.

all() ->
    [basic].

basic(_Config) ->
    Ctx = llevm:'LLVMGetGlobalContext'(),
    ModRef = llevm:'LLVMModuleCreateWithName'("test"),
    FunTypeRef = llevm:'LLVMFunctionType'(llevm:'LLVMDoubleType'(),
				       {llevm:'LLVMDoubleType'(),
				        llevm:'LLVMDoubleType'()}, 2, false),
    FunRef = llevm:'LLVMAddFunction'(ModRef, "foo", FunTypeRef),
    llevm:'LLVMDumpModule'(ModRef),
    BuildRef = llevm:'LLVMCreateBuilderInContext'(Ctx),
    _BB = llevm:'LLVMAppendBasicBlockInContext'(Ctx,FunRef,"entry"),
    Value = llevm:'LLVMConstReal'(llevm:'LLVMDoubleType'(),
				  1.2),
    llevm:'LLVMBuildRet'(BuildRef, Value),
    
    llevm:'LLVMDumpModule'(ModRef).
	
