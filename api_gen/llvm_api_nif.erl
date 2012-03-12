-module(llvm_api_nif).

-include("llvm_api.hrl").

-export([generate_types/1,
	 generate_resource_types/1,
	 generate_functions/1,
	 generate_mappings/1]).

generate_types([#typedef{ name = Name }|Rest]) ->
    ["RT",Name,",~n",generate_types(Rest)];
generate_types([#enum{ name = "@0" }|Rest]) ->
    generate_types(Rest);
generate_types([#enum{ name = Name }|Rest]) ->
    ["RT",Name,",~n",generate_types(Rest)];
generate_types([_|R]) ->
    generate_types(R);
generate_types([]) ->
    [].

generate_resource_types(_Entities) ->
    "".

generate_functions([#function{name = Name, 
			      params = Params, 
			      return_type = Return}|Rest]) ?LIMIT ->
    put({param_count,Name},0),
    ["static ERL_NIF_TERM ",Name,"_nif(ErlNifEnv* env, int argc, "
     "const ERL_NIF_TERM argv[]) {~n",
%     "  printf(\"\\rCalling ",Name,"\\r\\n\");~n",
     [generate_param_extract(Name,Param) || Param <- Params],
     if Return /= "void" ->
	     ["  ",Return," retVal = ",Name,"(",
	      llvm_api:generate_params(Params,fun(#param{ name = PName, type = T}) ->
						      ["(",T,")",PName]
					      end),
	      ");~n~n  return ",
	      generate_return(Params, Return),";"];
	true ->
	     [Name,"(",
	      llvm_api:generate_params(Params,fun(#param{ name = PName, type = T}) ->
						      ["(",T,")",PName]
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

generate_param_extract(Func,#param{ out_param = true} = Param) ->
    generate_param_extract(Func,Param,undefined);
generate_param_extract(Func,Param) ->
    Num = get({param_count,Func}),
    put({param_count,Func},Num+1),
    generate_param_extract(Func,Param,integer_to_list(Num)).

generate_param_extract(_Fun, #param{ name = Name, out_param = true, type = Type}, 
		       _Num) ->
    ["  ",Type," ",Name," = (",Type,")calloc(1,sizeof(",Type,"));~n~n"];
generate_param_extract(Func, #param{ type = "const "++Type} = Param, Num ) ->
    generate_param_extract(Func, Param#param{ type = Type }, Num);
generate_param_extract(_Func,#param{ name = Name, array = true, type = Type}, Num) ->
    ["  int ",Name,"size = 0;~n"
     "  ERL_NIF_TERM *",Name,"array;~n"
     "  enif_get_tuple(env, argv[",Num,"], &",Name,"size, (const ERL_NIF_TERM **)&",Name,"array);~n"
     "  ",Type," ",Name,";~n"
     "  if (",Name,"size == 0)~n"
     "    ",Name," = NULL;~n"
     "  else {~n"
     "    ",Name," = (",Type,")malloc(sizeof(",Type,")*",Name,"size);~n"
     "    int i,local_size=0;~n"
     "    ERL_NIF_TERM *local_array;~n"
     "    for(i = 0;i < ",Name,"size; i++) {~n"
     "      enif_get_tuple(env,*(",Name,"array+i), &local_size, (const ERL_NIF_TERM **)&local_array);~n"
     "      llvm_ptr_deref(env,*(local_array+1),(void **)",Name,"+i);~n"
     "    }~n"
     "  }~n~n"];
generate_param_extract(_Func,#param{ name = Name, type = "double" = Type}, Num) ->
    ["  ",Type," ",Name,";~n"
     "  enif_get_double(env, argv[",Num,"], (double*)&",Name,");~n~n"];
generate_param_extract(_Func,#param{ name = Name, type = Type}, Num) 
  when ?IS_ENUM(Type); Type == "unsigned"  ->
    ["  ",Type," ",Name,";~n"
     "  enif_get_uint(env, argv[",Num,"], (",Type,"*)&",Name,");~n~n"];
generate_param_extract(_Func,#param{ name = Name, type = Type}, Num) 
  when Type == "unsigned long long"->
    ["  ",Type," ",Name,";~n"
     "  enif_get_uint64(env, argv[",Num,"], (ErlNifUInt64 *)&",Name,");~n~n"];
generate_param_extract(_Func,#param{ name = Name, type = Type}, Num) 
  when Type == "int"->
    ["  ",Type," ",Name,";~n"
     "  enif_get_int(env, argv[",Num,"], (",Type,"*)&",Name,");~n~n"];
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
	
generate_return(Params, Return) ->
    case [P || P <- Params, P#param.out_param == true] of
	[] ->
	    generate_return(Return);
	OutParams ->
	    generate_return_with_out_params(OutParams, Return)
    end.

generate_return("unsigned"++_) ->
    ["  enif_make_uint(env, retVal)"];
generate_return("uint64_t") ->
    ["  enif_make_uint(env, retVal)"];
generate_return("int") ->
    ["  enif_make_int(env, retVal)"];
generate_return("long long") ->
    ["  enif_make_int(env, retVal)"];
generate_return(Return) when ?IS_ENUM(Return) ->
    ["  enif_make_int(env, (int)retVal)"];
generate_return(Bool) when Bool == "LLVMBool";Bool == "bool" ->
    ["  retVal ? enif_make_atom(env,\"true\") : enif_make_atom(env,\"false\")"];
generate_return("double") ->
    ["  enif_make_double(env,retVal)"];
generate_return(String) when String == "const char *"; String == "char *" ->
    ["  enif_make_string(env,retVal,ERL_NIF_LATIN1)"];
generate_return("const void *") ->
    ["  llvm_ptr_create(env, RTVoidPtr, (void *)retVal)"];
generate_return("void *") ->
    generate_return("VoidPtr");
generate_return("enum "++_Rest) ->
    ["  enif_make_int(env, (int)retVal)"];
generate_return(Return) ->
    ["  llvm_ptr_create(env, RT",Return,", retVal)"].

generate_return_with_out_params(OutParams, Return) ->
    ["  enif_make_tuple",integer_to_list(length(OutParams)+1),
     "(env, ", generate_return(Return),",",
     llvm_api:generate_params(
       OutParams,
       fun(#param{ type = "char **", name = PName }) ->
	       ["*",PName," != NULL?enif_make_string(env, *",PName,",ERL_NIF_LATIN1):enif_make_list(env,0)"];
	  (#param{ type = Type, name = PName }) ->
	       ["llvm_ptr_create(env, RT",strip_ptr(Type),",*",PName,")"]
       end),");~n~n"].


generate_mappings([#function{ name = Name, params = Params}|Rest]) ?LIMIT ->
    InParams = [P || P <- Params, P#param.out_param == false],
    ["    {\"",Name,"_internal\",",integer_to_list(length(InParams)),
     ",",Name,"_nif},~n",generate_mappings(Rest)];
generate_mappings([_|R]) ->
    generate_mappings(R);
generate_mappings([]) ->
    [].

strip_ptr(Atom) when is_atom(Atom) ->
    list_to_atom(strip_ptr(atom_to_list(Atom)));
strip_ptr(List) when is_list(List) ->
    [_,_|Rest] = lists:reverse(List),
    lists:reverse(Rest).
