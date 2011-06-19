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
					   llevm:'LLVMDoubleType'() }, 2, false),
    FunRef = llevm:'LLVMAddFunction'(ModRef, "foo", FunTypeRef),
    llevm:'LLVMDumpModule'(ModRef),
    BuildRef = llevm:'LLVMCreateBuilderInContext'(Ctx),
    BB = llevm:'LLVMAppendBasicBlock'(FunRef,"entry"),
    llevm:'LLVMPositionBuilderAtEnd'(BuildRef, BB),
    Value10 = llevm:'LLVMConstReal'(llevm:'LLVMDoubleType'(),
				    1.0),
    ValueArg1 = llevm:'LLVMGetParam'(FunRef, 0),
    ValueArg2 = llevm:'LLVMGetParam'(FunRef, 1),
    
    ValueAdd = llevm:'LLVMBuildFAdd'(BuildRef, Value10, ValueArg1, "addtmp"),
    ValueMul = llevm:'LLVMBuildFMul'(BuildRef, ValueAdd, ValueArg2, "multmp"),
    llevm:'LLVMBuildRet'(BuildRef, ValueMul),
    
    llevm:'LLVMDumpModule'(ModRef).
