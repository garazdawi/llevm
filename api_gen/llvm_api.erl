-module(llvm_api).

-export([generate/2]).

-include("llvm_api.hrl").

generate(From, To) ->
    Files = filelib:wildcard(From),
    init(To),
    [generate_int(filename:basename(File),llvm_api_parser:parse(File)) || 
	      File <- Files].

replace(Where, What, With) when is_atom(Where) ->
    {ok, Bin} = file:read_file(get(Where)),
    NewStr = replace(binary_to_list(Bin), What, With),
    {ok,D} = file:open(get(Where),[write]),
    io:format(D,NewStr,[]),
    file:close(D);
replace("@@"++Rest, What, With) ->
    case lists:prefix(What,Rest) of
	true ->
	    [With,Rest -- (What++"@@")];
	_Else ->
	    ["@@"|replace(Rest, What, With)]
    end;
replace([C|R],What,With) ->
    [C|replace(R,What,With)].
    

init(Path) ->
    Inc = filename:join([Path,"include","llevm.hrl"]),
    file:copy("llevm.hrl.in",Inc),
    put(include, Inc),
    
    Module = filename:join([Path,"src","llevm.erl"]),
    file:copy("llevm.erl.in",Module),
    put(module, Module),

    Nif = filename:join([Path,"csrc","nif.c"]),
    file:copy("nif.c.in",Nif),
    put(nif, Nif),
    
    ok.

header(From, Str) ->
    Pre = io_lib:format("%% -- Start generating from ~s "
				     "on ~p--~n~n",[From,calendar:local_time()]),
    List = split_io_lib_format(lists:flatten(Str),0,[]),
    Post = io_lib:format("%% --- Stop generating from ~s~n",[From]),
    [Pre,List,Post].

split_io_lib_format(Rest,Len,Acc) when Len == 128, hd(Acc) /= $~ ->
    [split_io_lib_format([],0,Acc)|split_io_lib_format(Rest,0,[])];
split_io_lib_format([C|R],Len,Acc) ->
    split_io_lib_format(R,Len+1,[C|Acc]);
split_io_lib_format([],_,[]) ->
    [];
split_io_lib_format([],_,Acc) ->
    io_lib:format(lists:reverse(Acc),[]).





generate_int(From, Entities) ->
    replace(include, "CONST", header(From,generate_enums(Entities))),
    replace(module, "TYPES", header(From, generate_types(Entities))),
    replace(module, "EXPORTS",header(From, generate_exports(Entities))),
    replace(module, "FUNCTIONS",header(From, generate_functions(Entities))).


generate_enums([#enum{ name = Name, members = Members, docs = _Docs }|Rest]) ->
    ["%% enum ",Name,"~n",
     generate_enum_member(Name, Members),
     "~n",
     generate_enums(Rest)];
generate_enums([_|Rest]) ->
    generate_enums(Rest);
generate_enums([]) ->
    [].

generate_enum_member(EnumName, [#enum_member{ name = Name, 
					      value = Value, 
					      docs = Docs }|Rest]) ->
    ["-define(",Name,",{'",Name,"',",integer_to_list(Value),"}).~n",
     if Docs /= [] ->
	    ["%% ",add_escape(Docs),"~n"];
       true ->
	    []
    end,
     generate_enum_member(EnumName, Rest)];
generate_enum_member(_EnumName, []) ->
    [].


generate_types([#typedef{ name = Name, is_ptr = true, docs = Docs }|Rest]) ->
    ["-opaque '",Name,"'() :: {'",Name,"',binary()}.~n"
     "%% ",add_escape(Docs),"~n"|
     generate_types(Rest)];
generate_types([#typedef{ name = Name, type = Type, 
			  is_ptr = false, docs = Docs }|Rest]) ->
    ErlangType = case Type of
		     "int" -> "integer"
		 end,
    ["-type '",Name,"'() :: ",ErlangType,"().~n"
     "%% ",add_escape(Docs),"~n~n"|
     generate_types(Rest)];
generate_types([#enum{ name = Name }|Rest]) ->
    ["-opaque '",Name,"'() :: {'",Name,"',integer()}.~n"|
     generate_types(Rest)];
generate_types([_|R]) ->
    generate_types(R);
generate_types([]) ->
    [].

generate_functions([#function{ name = Name,
			       return_type = Return,
			       params = Params,
			       docs = Docs }|Rest]) ->
    DocStr = ["%% @doc ",add_escape(Docs),"~n"],
    SpecStr = ["-spec '",Name,"'(",
	       generate_params(Params,
			       fun(#param{name = PName, type=T}) -> 
				       [to_var(PName)," :: ",to_erlang_type(T)] end),
	       ") -> ",to_erlang_type(Return),".~n"],

    BodyStr = ["'",Name,"'(",
	       generate_params(
		 Params,
		 fun(#param{ name = PName, type = T }) ->
			 case is_erlang_type(T) of
			     false ->
				 ["{",to_erlang_tag(T),",",to_var(PName),"}"];
			     ptr ->
				 Tag = case to_erlang_tag(T) of
				     "'char * *'" ->
					       "'string";
					   Else ->
					       hd(string:tokens(Else," "))
				       end,
				 ["{ptr,{",Tag,
				  "',",to_var(PName),"}}"];
			     true ->
				 to_var(PName)
			 end
		 end),
	       ") ->~n"
	       "\t'",Name,"_internal'(",
	       generate_params(Params,fun(#param{ name = PName }) ->
					      to_var(PName)
				      end),
	       ").~n"
	      "'",Name,"_internal'(",
	      generate_params(Params, fun(#param{ name = PName}) ->
					      ["_",to_var(PName)]
				      end),
	      ") ->~n"
	      "\tnif_not_loaded.~n~n"],
    [DocStr,SpecStr,BodyStr|generate_functions(Rest)];
     
generate_functions([_|R]) ->
    generate_functions(R);
generate_functions([]) ->
    [].

generate_params([], _Fun) ->
    [];
generate_params([#param{} = P], Fun) ->
    [Fun(P)];
generate_params([#param{} = P|Rest], Fun) ->
    [Fun(P),","|generate_params(Rest,Fun)].

generate_exports([#function{ name = Name, params = Params}|Rest]) ->
    ["-export(['",Name,"'/",integer_to_list(length(Params)),"]).~n"|
     generate_exports(Rest)];
generate_exports([_|R]) ->
    generate_exports(R);
generate_exports([]) ->
    [].

add_escape([$&|R]) ->
    "&amp;"++add_escape(R);
add_escape([$~|R]) ->
    [$~,$~|add_escape(R)];
add_escape([C|R]) ->
    [C|add_escape(R)];
add_escape([]) ->
    [].

to_erlang_type(Val) ->
    Tag = to_erlang_tag(Val),
    case lists:reverse(Tag) of
	[$',$*,$ |Rest] ->
	    "llvm_ptr("++to_erlang_type(tl(lists:reverse(Rest)))++")";
	_ ->
	    Tag++"()"
    end.


to_erlang_tag("unsigned") ->
    "integer";
to_erlang_tag("int") ->
    "integer";
to_erlang_tag("integer") ->
    "integer";
to_erlang_tag("char *") ->
    "string";
to_erlang_tag("char **") ->
    "'char * *'";
to_erlang_tag("const char *") ->
    "string";
to_erlang_tag("const uint64_t") ->
    "integer";
to_erlang_tag("uint8_t") ->
    "integer";
to_erlang_tag("unsigned long long") ->
    "integer";
to_erlang_tag("long long") ->
    "integer";
to_erlang_tag("double") ->
    "float";
to_erlang_tag("void") ->
    "atom";
to_erlang_tag(Else) ->
    "'"++Else++"'".

is_erlang_type(Type) ->
    case hd(to_erlang_type(Type)) of
	$' ->
	    false;
	$l ->
	    ptr;
	_Else ->
	    true
    end.

to_var([C|Rest]) when $a =< C, C =< $z ->
    [C - $a + $A|Rest];
to_var(Else) ->
    Else.
		       
