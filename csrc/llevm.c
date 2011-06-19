#include <stdio.h>
#include <stdlib.h>

#include "llvm-c/Core.h"

#include "erl_nif.h"

typedef enum {
  // -- Start generating from Core_8h.xml on {{2011,6,19},{22,45,4}}--

RTLLVMAttribute,
RTLLVMOpcode,
RTLLVMTypeKind,
RTLLVMLinkage,
RTLLVMVisibility,
RTLLVMCallConv,
RTLLVMIntPredicate,
RTLLVMRealPredicate,
RTLLVMBool,
RTLLVMContextRef,
RTLLVMModuleRef,
RTLLVMTypeRef,
RTLLVMTypeHandleRef,
RTLLVMValueRef,
RTLLVMBasicBlockRef,
RTLLVMBuilderRef,
RTLLVMModuleProviderRef,
RTLLVMMemoryBufferRef,
RTLLVMPassManagerRef,
RTLLVMPassRegistryRef,
RTLLVMUseRef,
// --- Stop generating from Core_8h.xml

} llvm_type_t;

typedef struct llvm_ptr {
  llvm_type_t type;
  void *value;
} llvm_ptr_t;

// -- Start generating from Core_8h.xml on {{2011,6,19},{22,45,4}}--

// --- Stop generating from Core_8h.xml

static ErlNifResourceType* module;

static int load_nif(ErlNifEnv* env, void** priv_data, ERL_NIF_TERM load_info) {
  module = enif_open_resource_type(env, "llvm_nif", "module", NULL,
				   ERL_NIF_RT_CREATE, NULL);
  return 0;
}

static int llvm_ptr_deref(ErlNifEnv* env, ERL_NIF_TERM term, void** objp) {
  llvm_ptr_t *ptr;
  enif_get_resource(env, term, module, (void **) &ptr);
  //  printf("fetching %ld\n",(long)ptr->value);
  *objp = ptr->value;
  return 0;
}

static ERL_NIF_TERM llvm_ptr_create(ErlNifEnv* env, llvm_type_t type,
				    void *data) {
  ERL_NIF_TERM term;
  llvm_ptr_t *ptr = (llvm_ptr_t*) enif_alloc_resource(module,
						      sizeof(llvm_ptr_t));

  //  printf("storing %ld\n",(long)data);
  /* initialize struct ... */
  ptr->type = type;
  ptr->value = data;

  term = enif_make_resource(env, ptr);

  enif_release_resource(ptr);
  return term;
}


// -- Start generating from Core_8h.xml on {{2011,6,19},{22,45,4}}--

static ERL_NIF_TERM LLVMGetGlobalContext_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMGetGlobalContext\r\n");
  if (argc != 0)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMContextRef retVal = LLVMGetGlobalContext();

  return llvm_ptr_create(env, RTLLVMContextRef, retVal);
}

static ERL_NIF_TERM LLVMModuleCreateWithName_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMModuleCreateWithName\r\n");
  if (argc != 1)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  const char *ModuleID = (char *) malloc(sizeof(char) * 255);
  enif_get_string(env, argv[0], (char*)ModuleID, 255, ERL_NIF_LATIN1);

  LLVMModuleRef retVal = LLVMModuleCreateWithName(ModuleID);

  return llvm_ptr_create(env, RTLLVMModuleRef, retVal);
}

static ERL_NIF_TERM LLVMDumpModule_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMDumpModule\r\n");
  if (argc != 1)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMModuleRef M;
  llvm_ptr_deref(env, argv[0], (void **) &M);

LLVMDumpModule(M);

  return enif_make_atom(env,"ok");
}

static ERL_NIF_TERM LLVMDoubleType_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMDoubleType\r\n");
  if (argc != 0)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMTypeRef retVal = LLVMDoubleType();

  return llvm_ptr_create(env, RTLLVMTypeRef, retVal);
}

static ERL_NIF_TERM LLVMFunctionType_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMFunctionType\r\n");
  if (argc != 4)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMTypeRef ReturnType;
  llvm_ptr_deref(env, argv[0], (void **) &ReturnType);

  int ParamTypessize = 0;
  ERL_NIF_TERM *ParamTypesarray;
  enif_get_tuple(env, argv[1], &ParamTypessize, (const ERL_NIF_TERM **)&ParamTypesarray);
  LLVMTypeRef * ParamTypes;
  if (ParamTypessize == 0)
    ParamTypes = NULL;
  else {
    ParamTypes = (LLVMTypeRef *)malloc(sizeof(LLVMTypeRef *)*ParamTypessize);
    int i,local_size=0;
    ERL_NIF_TERM *local_array;
    for(i = 0;i < ParamTypessize; i++) {
      enif_get_tuple(env,*(ParamTypesarray+i), &local_size, (const ERL_NIF_TERM **)&local_array);
      llvm_ptr_deref(env,*(local_array+1),(void **)ParamTypes+i);
    }
  }

  unsigned ParamCount;
  enif_get_uint(env, argv[2], (unsigned*)&ParamCount);

  char *IsVarArg_tmp = (char *) malloc(sizeof(char) * 255);
  enif_get_atom(env, argv[3], (char*)IsVarArg_tmp, 255, ERL_NIF_LATIN1);
  LLVMBool IsVarArg = (strcmp(IsVarArg_tmp,"true") == 0);

  LLVMTypeRef retVal = LLVMFunctionType(ReturnType,ParamTypes,ParamCount,IsVarArg);

  return llvm_ptr_create(env, RTLLVMTypeRef, retVal);
}

static ERL_NIF_TERM LLVMDumpValue_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMDumpValue\r\n");
  if (argc != 1)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMValueRef Val;
  llvm_ptr_deref(env, argv[0], (void **) &Val);

LLVMDumpValue(Val);

  return enif_make_atom(env,"ok");
}

static ERL_NIF_TERM LLVMConstReal_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMConstReal\r\n");
  if (argc != 2)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMTypeRef RealTy;
  llvm_ptr_deref(env, argv[0], (void **) &RealTy);

  double N;
  enif_get_double(env, argv[1], (double*)&N);

  LLVMValueRef retVal = LLVMConstReal(RealTy,N);

  return llvm_ptr_create(env, RTLLVMValueRef, retVal);
}

static ERL_NIF_TERM LLVMGetLinkage_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMGetLinkage\r\n");
  if (argc != 1)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMValueRef Global;
  llvm_ptr_deref(env, argv[0], (void **) &Global);

  LLVMLinkage retVal = LLVMGetLinkage(Global);

  return enif_make_int(env, (int)RTLLVMLinkage);
}

static ERL_NIF_TERM LLVMSetLinkage_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMSetLinkage\r\n");
  if (argc != 2)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMValueRef Global;
  llvm_ptr_deref(env, argv[0], (void **) &Global);

  LLVMLinkage Linkage;
  enif_get_uint(env, argv[1], (LLVMLinkage*)&Linkage);

LLVMSetLinkage(Global,Linkage);

  return enif_make_atom(env,"ok");
}

static ERL_NIF_TERM LLVMAddFunction_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMAddFunction\r\n");
  if (argc != 3)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMModuleRef M;
  llvm_ptr_deref(env, argv[0], (void **) &M);

  const char *Name = (char *) malloc(sizeof(char) * 255);
  enif_get_string(env, argv[1], (char*)Name, 255, ERL_NIF_LATIN1);

  LLVMTypeRef FunctionTy;
  llvm_ptr_deref(env, argv[2], (void **) &FunctionTy);

  LLVMValueRef retVal = LLVMAddFunction(M,Name,FunctionTy);

  return llvm_ptr_create(env, RTLLVMValueRef, retVal);
}

static ERL_NIF_TERM LLVMGetNamedFunction_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMGetNamedFunction\r\n");
  if (argc != 2)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMModuleRef M;
  llvm_ptr_deref(env, argv[0], (void **) &M);

  const char *Name = (char *) malloc(sizeof(char) * 255);
  enif_get_string(env, argv[1], (char*)Name, 255, ERL_NIF_LATIN1);

  LLVMValueRef retVal = LLVMGetNamedFunction(M,Name);

  return llvm_ptr_create(env, RTLLVMValueRef, retVal);
}

static ERL_NIF_TERM LLVMGetParam_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMGetParam\r\n");
  if (argc != 2)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMValueRef Fn;
  llvm_ptr_deref(env, argv[0], (void **) &Fn);

  unsigned Index;
  enif_get_uint(env, argv[1], (unsigned*)&Index);

  LLVMValueRef retVal = LLVMGetParam(Fn,Index);

  return llvm_ptr_create(env, RTLLVMValueRef, retVal);
}

static ERL_NIF_TERM LLVMGetBasicBlockParent_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMGetBasicBlockParent\r\n");
  if (argc != 1)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMBasicBlockRef BB;
  llvm_ptr_deref(env, argv[0], (void **) &BB);

  LLVMValueRef retVal = LLVMGetBasicBlockParent(BB);

  return llvm_ptr_create(env, RTLLVMValueRef, retVal);
}

static ERL_NIF_TERM LLVMAppendBasicBlock_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMAppendBasicBlock\r\n");
  if (argc != 2)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMValueRef Fn;
  llvm_ptr_deref(env, argv[0], (void **) &Fn);

  const char *Name = (char *) malloc(sizeof(char) * 255);
  enif_get_string(env, argv[1], (char*)Name, 255, ERL_NIF_LATIN1);

  LLVMBasicBlockRef retVal = LLVMAppendBasicBlock(Fn,Name);

  return llvm_ptr_create(env, RTLLVMBasicBlockRef, retVal);
}

static ERL_NIF_TERM LLVMAddIncoming_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMAddIncoming\r\n");
  if (argc != 4)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMValueRef PhiNode;
  llvm_ptr_deref(env, argv[0], (void **) &PhiNode);

  int IncomingValuessize = 0;
  ERL_NIF_TERM *IncomingValuesarray;
  enif_get_tuple(env, argv[1], &IncomingValuessize, (const ERL_NIF_TERM **)&IncomingValuesarray);
  LLVMValueRef * IncomingValues;
  if (IncomingValuessize == 0)
    IncomingValues = NULL;
  else {
    IncomingValues = (LLVMValueRef *)malloc(sizeof(LLVMValueRef *)*IncomingValuessize);
    int i,local_size=0;
    ERL_NIF_TERM *local_array;
    for(i = 0;i < IncomingValuessize; i++) {
      enif_get_tuple(env,*(IncomingValuesarray+i), &local_size, (const ERL_NIF_TERM **)&local_array);
      llvm_ptr_deref(env,*(local_array+1),(void **)IncomingValues+i);
    }
  }

  int IncomingBlockssize = 0;
  ERL_NIF_TERM *IncomingBlocksarray;
  enif_get_tuple(env, argv[2], &IncomingBlockssize, (const ERL_NIF_TERM **)&IncomingBlocksarray);
  LLVMBasicBlockRef * IncomingBlocks;
  if (IncomingBlockssize == 0)
    IncomingBlocks = NULL;
  else {
    IncomingBlocks = (LLVMBasicBlockRef *)malloc(sizeof(LLVMBasicBlockRef *)*IncomingBlockssize);
    int i,local_size=0;
    ERL_NIF_TERM *local_array;
    for(i = 0;i < IncomingBlockssize; i++) {
      enif_get_tuple(env,*(IncomingBlocksarray+i), &local_size, (const ERL_NIF_TERM **)&local_array);
      llvm_ptr_deref(env,*(local_array+1),(void **)IncomingBlocks+i);
    }
  }

  unsigned Count;
  enif_get_uint(env, argv[3], (unsigned*)&Count);

LLVMAddIncoming(PhiNode,IncomingValues,IncomingBlocks,Count);

  return enif_make_atom(env,"ok");
}

static ERL_NIF_TERM LLVMCreateBuilderInContext_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMCreateBuilderInContext\r\n");
  if (argc != 1)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMContextRef C;
  llvm_ptr_deref(env, argv[0], (void **) &C);

  LLVMBuilderRef retVal = LLVMCreateBuilderInContext(C);

  return llvm_ptr_create(env, RTLLVMBuilderRef, retVal);
}

static ERL_NIF_TERM LLVMPositionBuilderAtEnd_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMPositionBuilderAtEnd\r\n");
  if (argc != 2)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMBuilderRef Builder;
  llvm_ptr_deref(env, argv[0], (void **) &Builder);

  LLVMBasicBlockRef Block;
  llvm_ptr_deref(env, argv[1], (void **) &Block);

LLVMPositionBuilderAtEnd(Builder,Block);

  return enif_make_atom(env,"ok");
}

static ERL_NIF_TERM LLVMGetInsertBlock_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMGetInsertBlock\r\n");
  if (argc != 1)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMBuilderRef Builder;
  llvm_ptr_deref(env, argv[0], (void **) &Builder);

  LLVMBasicBlockRef retVal = LLVMGetInsertBlock(Builder);

  return llvm_ptr_create(env, RTLLVMBasicBlockRef, retVal);
}

static ERL_NIF_TERM LLVMBuildRet_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMBuildRet\r\n");
  if (argc != 2)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMBuilderRef B;
  llvm_ptr_deref(env, argv[0], (void **) &B);

  LLVMValueRef V;
  llvm_ptr_deref(env, argv[1], (void **) &V);

  LLVMValueRef retVal = LLVMBuildRet(B,V);

  return llvm_ptr_create(env, RTLLVMValueRef, retVal);
}

static ERL_NIF_TERM LLVMBuildBr_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMBuildBr\r\n");
  if (argc != 2)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMBuilderRef B;
  llvm_ptr_deref(env, argv[0], (void **) &B);

  LLVMBasicBlockRef Dest;
  llvm_ptr_deref(env, argv[1], (void **) &Dest);

  LLVMValueRef retVal = LLVMBuildBr(B,Dest);

  return llvm_ptr_create(env, RTLLVMValueRef, retVal);
}

static ERL_NIF_TERM LLVMBuildCondBr_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMBuildCondBr\r\n");
  if (argc != 4)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMBuilderRef B;
  llvm_ptr_deref(env, argv[0], (void **) &B);

  LLVMValueRef If;
  llvm_ptr_deref(env, argv[1], (void **) &If);

  LLVMBasicBlockRef Then;
  llvm_ptr_deref(env, argv[2], (void **) &Then);

  LLVMBasicBlockRef Else;
  llvm_ptr_deref(env, argv[3], (void **) &Else);

  LLVMValueRef retVal = LLVMBuildCondBr(B,If,Then,Else);

  return llvm_ptr_create(env, RTLLVMValueRef, retVal);
}

static ERL_NIF_TERM LLVMBuildFAdd_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMBuildFAdd\r\n");
  if (argc != 4)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMBuilderRef B;
  llvm_ptr_deref(env, argv[0], (void **) &B);

  LLVMValueRef LHS;
  llvm_ptr_deref(env, argv[1], (void **) &LHS);

  LLVMValueRef RHS;
  llvm_ptr_deref(env, argv[2], (void **) &RHS);

  const char *Name = (char *) malloc(sizeof(char) * 255);
  enif_get_string(env, argv[3], (char*)Name, 255, ERL_NIF_LATIN1);

  LLVMValueRef retVal = LLVMBuildFAdd(B,LHS,RHS,Name);

  return llvm_ptr_create(env, RTLLVMValueRef, retVal);
}

static ERL_NIF_TERM LLVMBuildFSub_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMBuildFSub\r\n");
  if (argc != 4)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMBuilderRef B;
  llvm_ptr_deref(env, argv[0], (void **) &B);

  LLVMValueRef LHS;
  llvm_ptr_deref(env, argv[1], (void **) &LHS);

  LLVMValueRef RHS;
  llvm_ptr_deref(env, argv[2], (void **) &RHS);

  const char *Name = (char *) malloc(sizeof(char) * 255);
  enif_get_string(env, argv[3], (char*)Name, 255, ERL_NIF_LATIN1);

  LLVMValueRef retVal = LLVMBuildFSub(B,LHS,RHS,Name);

  return llvm_ptr_create(env, RTLLVMValueRef, retVal);
}

static ERL_NIF_TERM LLVMBuildFMul_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMBuildFMul\r\n");
  if (argc != 4)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMBuilderRef B;
  llvm_ptr_deref(env, argv[0], (void **) &B);

  LLVMValueRef LHS;
  llvm_ptr_deref(env, argv[1], (void **) &LHS);

  LLVMValueRef RHS;
  llvm_ptr_deref(env, argv[2], (void **) &RHS);

  const char *Name = (char *) malloc(sizeof(char) * 255);
  enif_get_string(env, argv[3], (char*)Name, 255, ERL_NIF_LATIN1);

  LLVMValueRef retVal = LLVMBuildFMul(B,LHS,RHS,Name);

  return llvm_ptr_create(env, RTLLVMValueRef, retVal);
}

static ERL_NIF_TERM LLVMBuildUIToFP_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMBuildUIToFP\r\n");
  if (argc != 4)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMBuilderRef B;
  llvm_ptr_deref(env, argv[0], (void **) &B);

  LLVMValueRef Val;
  llvm_ptr_deref(env, argv[1], (void **) &Val);

  LLVMTypeRef DestTy;
  llvm_ptr_deref(env, argv[2], (void **) &DestTy);

  const char *Name = (char *) malloc(sizeof(char) * 255);
  enif_get_string(env, argv[3], (char*)Name, 255, ERL_NIF_LATIN1);

  LLVMValueRef retVal = LLVMBuildUIToFP(B,Val,DestTy,Name);

  return llvm_ptr_create(env, RTLLVMValueRef, retVal);
}

static ERL_NIF_TERM LLVMBuildFCmp_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMBuildFCmp\r\n");
  if (argc != 5)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMBuilderRef B;
  llvm_ptr_deref(env, argv[0], (void **) &B);

  LLVMRealPredicate Op;
  enif_get_uint(env, argv[1], (LLVMRealPredicate*)&Op);

  LLVMValueRef LHS;
  llvm_ptr_deref(env, argv[2], (void **) &LHS);

  LLVMValueRef RHS;
  llvm_ptr_deref(env, argv[3], (void **) &RHS);

  const char *Name = (char *) malloc(sizeof(char) * 255);
  enif_get_string(env, argv[4], (char*)Name, 255, ERL_NIF_LATIN1);

  LLVMValueRef retVal = LLVMBuildFCmp(B,Op,LHS,RHS,Name);

  return llvm_ptr_create(env, RTLLVMValueRef, retVal);
}

static ERL_NIF_TERM LLVMBuildPhi_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMBuildPhi\r\n");
  if (argc != 3)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMBuilderRef B;
  llvm_ptr_deref(env, argv[0], (void **) &B);

  LLVMTypeRef Ty;
  llvm_ptr_deref(env, argv[1], (void **) &Ty);

  const char *Name = (char *) malloc(sizeof(char) * 255);
  enif_get_string(env, argv[2], (char*)Name, 255, ERL_NIF_LATIN1);

  LLVMValueRef retVal = LLVMBuildPhi(B,Ty,Name);

  return llvm_ptr_create(env, RTLLVMValueRef, retVal);
}

static ERL_NIF_TERM LLVMBuildCall_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("\rCalling LLVMBuildCall\r\n");
  if (argc != 5)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMBuilderRef B;
  llvm_ptr_deref(env, argv[0], (void **) &B);

  LLVMValueRef Fn;
  llvm_ptr_deref(env, argv[1], (void **) &Fn);

  int Argssize = 0;
  ERL_NIF_TERM *Argsarray;
  enif_get_tuple(env, argv[2], &Argssize, (const ERL_NIF_TERM **)&Argsarray);
  LLVMValueRef * Args;
  if (Argssize == 0)
    Args = NULL;
  else {
    Args = (LLVMValueRef *)malloc(sizeof(LLVMValueRef *)*Argssize);
    int i,local_size=0;
    ERL_NIF_TERM *local_array;
    for(i = 0;i < Argssize; i++) {
      enif_get_tuple(env,*(Argsarray+i), &local_size, (const ERL_NIF_TERM **)&local_array);
      llvm_ptr_deref(env,*(local_array+1),(void **)Args+i);
    }
  }

  unsigned NumArgs;
  enif_get_uint(env, argv[3], (unsigned*)&NumArgs);

  const char *Name = (char *) malloc(sizeof(char) * 255);
  enif_get_string(env, argv[4], (char*)Name, 255, ERL_NIF_LATIN1);

  LLVMValueRef retVal = LLVMBuildCall(B,Fn,Args,NumArgs,Name);

  return llvm_ptr_create(env, RTLLVMValueRef, retVal);
}

// --- Stop generating from Core_8h.xml


static ErlNifFunc nif_funcs[] =
  {
    // -- Start generating from Core_8h.xml on {{2011,6,19},{22,45,4}}--

    {"LLVMGetGlobalContext_internal",0,LLVMGetGlobalContext_nif},
    {"LLVMModuleCreateWithName_internal",1,LLVMModuleCreateWithName_nif},
    {"LLVMDumpModule_internal",1,LLVMDumpModule_nif},
    {"LLVMDoubleType_internal",0,LLVMDoubleType_nif},
    {"LLVMFunctionType_internal",4,LLVMFunctionType_nif},
    {"LLVMDumpValue_internal",1,LLVMDumpValue_nif},
    {"LLVMConstReal_internal",2,LLVMConstReal_nif},
    {"LLVMGetLinkage_internal",1,LLVMGetLinkage_nif},
    {"LLVMSetLinkage_internal",2,LLVMSetLinkage_nif},
    {"LLVMAddFunction_internal",3,LLVMAddFunction_nif},
    {"LLVMGetNamedFunction_internal",2,LLVMGetNamedFunction_nif},
    {"LLVMGetParam_internal",2,LLVMGetParam_nif},
    {"LLVMGetBasicBlockParent_internal",1,LLVMGetBasicBlockParent_nif},
    {"LLVMAppendBasicBlock_internal",2,LLVMAppendBasicBlock_nif},
    {"LLVMAddIncoming_internal",4,LLVMAddIncoming_nif},
    {"LLVMCreateBuilderInContext_internal",1,LLVMCreateBuilderInContext_nif},
    {"LLVMPositionBuilderAtEnd_internal",2,LLVMPositionBuilderAtEnd_nif},
    {"LLVMGetInsertBlock_internal",1,LLVMGetInsertBlock_nif},
    {"LLVMBuildRet_internal",2,LLVMBuildRet_nif},
    {"LLVMBuildBr_internal",2,LLVMBuildBr_nif},
    {"LLVMBuildCondBr_internal",4,LLVMBuildCondBr_nif},
    {"LLVMBuildFAdd_internal",4,LLVMBuildFAdd_nif},
    {"LLVMBuildFSub_internal",4,LLVMBuildFSub_nif},
    {"LLVMBuildFMul_internal",4,LLVMBuildFMul_nif},
    {"LLVMBuildUIToFP_internal",4,LLVMBuildUIToFP_nif},
    {"LLVMBuildFCmp_internal",5,LLVMBuildFCmp_nif},
    {"LLVMBuildPhi_internal",3,LLVMBuildPhi_nif},
    {"LLVMBuildCall_internal",5,LLVMBuildCall_nif},
// --- Stop generating from Core_8h.xml

  };

ERL_NIF_INIT(llevm,nif_funcs,load_nif,NULL,NULL,NULL)
