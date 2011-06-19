#include <stdio.h>
#include <stdlib.h>

#include "llvm-c/Core.h"

#include "erl_nif.h"

typedef enum {
  // -- Start generating from Core_8h.xml on {{2011,6,19},{2,27,32}}--

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

// -- Start generating from Core_8h.xml on {{2011,6,19},{2,27,32}}--

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


// -- Start generating from Core_8h.xml on {{2011,6,19},{2,27,32}}--

static ERL_NIF_TERM LLVMGetGlobalContext_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("Calling LLVMGetGlobalContext\r\n");
  if (argc != 0)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMContextRef retVal = LLVMGetGlobalContext();

  return llvm_ptr_create(env, RTLLVMContextRef, retVal);
}

static ERL_NIF_TERM LLVMModuleCreateWithName_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("Calling LLVMModuleCreateWithName\r\n");
  if (argc != 1)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  const char *ModuleID = (char *) malloc(sizeof(char) * 255);
  enif_get_string(env, argv[0], (char*)ModuleID, 255, ERL_NIF_LATIN1);

  LLVMModuleRef retVal = LLVMModuleCreateWithName(ModuleID);

  return llvm_ptr_create(env, RTLLVMModuleRef, retVal);
}

static ERL_NIF_TERM LLVMDumpModule_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("Calling LLVMDumpModule\r\n");
  if (argc != 1)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMModuleRef M;
  llvm_ptr_deref(env, argv[0], (void **) &M);

LLVMDumpModule(M);

  return enif_make_atom(env,"ok");
}

static ERL_NIF_TERM LLVMDoubleType_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("Calling LLVMDoubleType\r\n");
  if (argc != 0)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMTypeRef retVal = LLVMDoubleType();

  return llvm_ptr_create(env, RTLLVMTypeRef, retVal);
}

static ERL_NIF_TERM LLVMFunctionType_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("Calling LLVMFunctionType\r\n");
  if (argc != 4)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMTypeRef ReturnType;
  llvm_ptr_deref(env, argv[0], (void **) &ReturnType);

  int size = 0;
  ERL_NIF_TERM *array;
  enif_get_tuple(env, argv[1], &size, (const ERL_NIF_TERM **)&array);
  LLVMTypeRef * ParamTypes;
  if (size == 0)
    ParamTypes = NULL;
  else {
    ParamTypes = (LLVMTypeRef *)malloc(sizeof(LLVMTypeRef *)*size);
    int i,local_size=0;
    ERL_NIF_TERM *local_array;
    for(i = 0;i < size; i++) {
      enif_get_tuple(env,*(array+i), &local_size, (const ERL_NIF_TERM **)&local_array);
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

static ERL_NIF_TERM LLVMConstReal_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("Calling LLVMConstReal\r\n");
  if (argc != 2)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMTypeRef RealTy;
  llvm_ptr_deref(env, argv[0], (void **) &RealTy);

  double N;
  enif_get_double(env, argv[1], (double*)&N);

  LLVMValueRef retVal = LLVMConstReal(RealTy,N);

  return llvm_ptr_create(env, RTLLVMValueRef, retVal);
}

static ERL_NIF_TERM LLVMAddFunction_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("Calling LLVMAddFunction\r\n");
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

static ERL_NIF_TERM LLVMAppendBasicBlockInContext_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("Calling LLVMAppendBasicBlockInContext\r\n");
  if (argc != 3)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMContextRef C;
  llvm_ptr_deref(env, argv[0], (void **) &C);

  LLVMValueRef Fn;
  llvm_ptr_deref(env, argv[1], (void **) &Fn);

  const char *Name = (char *) malloc(sizeof(char) * 255);
  enif_get_string(env, argv[2], (char*)Name, 255, ERL_NIF_LATIN1);

  LLVMBasicBlockRef retVal = LLVMAppendBasicBlockInContext(C,Fn,Name);

  return llvm_ptr_create(env, RTLLVMBasicBlockRef, retVal);
}

static ERL_NIF_TERM LLVMCreateBuilderInContext_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("Calling LLVMCreateBuilderInContext\r\n");
  if (argc != 1)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMContextRef C;
  llvm_ptr_deref(env, argv[0], (void **) &C);

  LLVMBuilderRef retVal = LLVMCreateBuilderInContext(C);

  return llvm_ptr_create(env, RTLLVMBuilderRef, retVal);
}

static ERL_NIF_TERM LLVMBuildRet_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  printf("Calling LLVMBuildRet\r\n");
  if (argc != 2)
    return enif_make_string(env, "wrong number of arguments", ERL_NIF_LATIN1);

  LLVMBuilderRef B;
  llvm_ptr_deref(env, argv[0], (void **) &B);

  LLVMValueRef V;
  llvm_ptr_deref(env, argv[1], (void **) &V);

  LLVMValueRef retVal = LLVMBuildRet(B,V);

  return llvm_ptr_create(env, RTLLVMValueRef, retVal);
}

// --- Stop generating from Core_8h.xml


static ErlNifFunc nif_funcs[] =
  {
    // -- Start generating from Core_8h.xml on {{2011,6,19},{2,27,32}}--

    {"LLVMGetGlobalContext_internal",0,LLVMGetGlobalContext_nif},
    {"LLVMModuleCreateWithName_internal",1,LLVMModuleCreateWithName_nif},
    {"LLVMDumpModule_internal",1,LLVMDumpModule_nif},
    {"LLVMDoubleType_internal",0,LLVMDoubleType_nif},
    {"LLVMFunctionType_internal",4,LLVMFunctionType_nif},
    {"LLVMConstReal_internal",2,LLVMConstReal_nif},
    {"LLVMAddFunction_internal",3,LLVMAddFunction_nif},
    {"LLVMAppendBasicBlockInContext_internal",3,LLVMAppendBasicBlockInContext_nif},
    {"LLVMCreateBuilderInContext_internal",1,LLVMCreateBuilderInContext_nif},
    {"LLVMBuildRet_internal",2,LLVMBuildRet_nif},
// --- Stop generating from Core_8h.xml

  };

ERL_NIF_INIT(llevm,nif_funcs,load_nif,NULL,NULL,NULL)
