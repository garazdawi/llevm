#include "llvm/DerivedTypes.h"
#include "llvm/LLVMContext.h"
#include "llvm/Module.h"
#include "llvm/Analysis/Verifier.h"
#include "llvm/Support/IRBuilder.h"
#include <cstdio>
#include <string>
#include <map>
#include <vector>

extern "C" {
#include "erl_nif.h"
}

using namespace llvm;

typedef enum llvm_type {
	MODULE = 1
} llvm_type_t;

typedef struct llvm_ptr {
	llvm_type_t type;
	void *value;
} llvm_ptr_t;

static ErlNifResourceType* module;

static int load_nif(ErlNifEnv* env, void** priv_data, ERL_NIF_TERM load_info) {
	module = enif_open_resource_type(env, "llvm_nif", "module", NULL,
			ERL_NIF_RT_CREATE, NULL);
	return 0;
}

static int llvm_ptr_deref(ErlNifEnv* env, ERL_NIF_TERM term, void** objp) {
	llvm_ptr_t *ptr;
	enif_get_resource(env, term, module, (void **) &ptr);
	*objp = ptr->value;
	return 0;
}

static ERL_NIF_TERM llvm_ptr_create(ErlNifEnv* env, llvm_type_t type,
		void *data) {
	ERL_NIF_TERM term;
	llvm_ptr_t *ptr = (llvm_ptr_t*) enif_alloc_resource(module,
			sizeof(llvm_ptr_t));

	/* initialize struct ... */
	ptr->type = type;
	ptr->value = data;

	term = enif_make_resource(env, ptr);

	enif_release_resource(ptr);
	return term;
}

static ERL_NIF_TERM module_new(ErlNifEnv* env, int argc,
		const ERL_NIF_TERM argv[]) {
	char *name = (char*) malloc(sizeof(char) * 255);
	if (enif_get_string(env, argv[0], name, 255, ERL_NIF_LATIN1) < 1)
		return enif_make_string(env, "failed!", ERL_NIF_LATIN1);

	LLVMContext *ctx;
	if (argc == 2)
		llvm_ptr_deref(env, argv[1], (void **) &ctx);
	else
		ctx = &getGlobalContext();

	Module* myModule = new Module(name, *ctx);

	return llvm_ptr_create(env, MODULE, (void*) myModule);
}

static ERL_NIF_TERM module_getFunction(ErlNifEnv* env, int argc,
		const ERL_NIF_TERM argv[]) {
	return enif_make_string(env, "Hello world!", ERL_NIF_LATIN1);
}

static ERL_NIF_TERM module_dump(ErlNifEnv* env, int argc,
		const ERL_NIF_TERM argv[]) {
	Module *myModule;
	llvm_ptr_deref(env, argv[0], (void **) &myModule);
	myModule->dump();
	return enif_make_atom(env, "ok");
}

static ErlNifFunc nif_funcs[] = { { "module_new", 1, module_new }, {
		"module_getFunction", 2, module_getFunction }, { "module_dump", 1,
		module_dump } };

extern "C" {
ERL_NIF_INIT(llvm_nif,nif_funcs,load_nif,NULL,NULL,NULL)
}
