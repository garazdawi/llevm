-module(llvm_api_nif).

-include("llvm_api.hrl").

-export([generate_types/1,
	 generate_resource_types/1,
	 generate_functions/1,
	 generate_mappings/1]).

generate_types([#typedef{ name = Name }|Rest]) ->
    ["RT",Name,",~n",generate_types(Rest)];
generate_types([#enum{ name = Name }|Rest]) ->
    ["RT",Name,",~n",generate_types(Rest)];
generate_types([_|R]) ->
    generate_types(R);
generate_types([]) ->
    [].

generate_resource_types(Entities) ->
    "".

generate_functions([#function{name = Name, 
			      params = Params, 
			      return_type = Return}|Rest]) ?LIMIT ->
    put({param_count,Name},0),
    ["static ERL_NIF_TERM ",Name,"_nif(ErlNifEnv* env, int argc, "
     "const ERL_NIF_TERM argv[]) {~n"
     "  printf(\"Calling ",Name,"\\r\\n\");~n"
     "  if (argc != ",integer_to_list(length(Params)),")~n"
     "    return enif_make_string(env, \"wrong number of arguments\", ERL_NIF_LATIN1);~n~n",
     [generate_param_extract(Name,Param) || Param <- Params],
     if Return /= "void" ->
	     ["  ",Return," retVal = ",Name,"(",
	      llvm_api:generate_params(Params,fun(#param{ name = PName}) ->
						      PName
					      end),
	      ");~n~n"
	      "  return llvm_ptr_create(env, RT",Return,", retVal);"];
	true ->
	     [Name,"(",
	      llvm_api:generate_params(Params,fun(#param{ name = PName}) ->
						      PName
					      end),
	      ");~n~n",
	     "  return enif_make_atom(env,\"ok\");"]
     end,
     "~n}~n~n"
     ,generate_functions(Rest)];
generate_functions([_|R]) ->
    generate_functions(R);
generate_functions([]) ->
    [].

generate_param_extract(Func,Param) ->
    Num = get({param_count,Func}),
    put({param_count,Func},Num+1),
    generate_param_extract(Func,Param,integer_to_list(Num)).
generate_param_extract(_Func,#param{ name = Name, array = true, type = Type}, Num) ->
    ["  int size = 0;~n"
     "  ERL_NIF_TERM *array;~n"
     "  enif_get_tuple(env, argv[",Num,"], &size, (const ERL_NIF_TERM **)&array);~n"
     "  ",Type," ",Name,";~n"
     "  if (size == 0)~n"
     "    ",Name," = NULL;~n"
     "  else {~n"
     "    ",Name," = (",Type,")malloc(sizeof(",Type,")*size);~n"
     "    int i,local_size=0;~n"
     "    ERL_NIF_TERM *local_array;~n"
     "    for(i = 0;i < size; i++) {~n"
     "      enif_get_tuple(env,*(array+i), &local_size, (const ERL_NIF_TERM **)&local_array);~n"
     "      llvm_ptr_deref(env,*(local_array+1),(void **)",Name,"+i);~n"
     "    }~n"
     "  }~n~n"];
generate_param_extract(_Func,#param{ name = Name, type = "double" = Type}, Num) ->
    ["  ",Type," ",Name,";~n"
     "  enif_get_double(env, argv[",Num,"], (double*)&",Name,");~n~n"];
generate_param_extract(_Func,#param{ name = Name, type = "unsigned" = Type}, Num) ->
    ["  ",Type," ",Name,";~n"
     "  enif_get_uint(env, argv[",Num,"], (unsigned*)&",Name,");~n~n"];
generate_param_extract(_Func,#param{ name = Name, type = "LLVMBool" = Type}, Num) ->
    ["  char *",Name,"_tmp = (char *) malloc(sizeof(char) * 255);~n"
     "  enif_get_atom(env, argv[",Num,"], (char*)",Name,"_tmp, 255, ERL_NIF_LATIN1);~n"
     "  ",Type," ",Name," = (strcmp(",Name,"_tmp,\"true\") == 0);~n~n"];
generate_param_extract(_Func,#param{ name = Name, type = CharType}, Num) 
  when CharType == "char *"; CharType == "const char *" ->
    ["  ",CharType,Name," = (char *) malloc(sizeof(char) * 255);~n"
     "  enif_get_string(env, argv[",Num,"], (char*)",Name,", 255, ERL_NIF_LATIN1);~n~n"];
generate_param_extract(_Func,#param{ name = Name, type = Type }, Num) ->
    ["  ",Type," ",Name,";~n"
     "  llvm_ptr_deref(env, argv[",Num,"], (void **) &",Name,");~n~n"].
	

generate_mappings([#function{ name = Name, params = Params}|Rest]) ?LIMIT ->
    ["    {\"",Name,"_internal\",",integer_to_list(length(Params)),
     ",",Name,"_nif},~n",generate_mappings(Rest)];
generate_mappings([_|R]) ->
    generate_mappings(R);
generate_mappings([]) ->
    [].

