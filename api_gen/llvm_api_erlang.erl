-module(llvm_api_erlang).

-include("llvm_api.hrl").

-export([generate_enums/1,generate_exports/1,generate_erlang_types/1,
	 generate_erlang_functions/1]).

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
    ["-define(",Name,",{'",EnumName,"',",integer_to_list(Value),"}).~n",
     if Docs /= [] ->
	     ["%% ",add_escape(Docs),"~n"];
	true ->
	     []
     end,
     generate_enum_member(EnumName, Rest)];
generate_enum_member(_EnumName, []) ->
    [].


generate_erlang_types([#typedef{ name = Name, is_ptr = true, docs = Docs }|Rest]) ->
    ["-opaque '",Name,"'() :: {'",Name,"',binary()}.~n"
     "%% ",add_escape(Docs),"~n"|
     generate_erlang_types(Rest)];
generate_erlang_types([#typedef{ name = Name, type = Type, 
				 is_ptr = false, docs = Docs }|Rest]) ->
    ErlangType = case Type of
		     "int" -> "integer"
		 end,
    ["-type '",Name,"'() :: ",ErlangType,"().~n"
     "%% ",add_escape(Docs),"~n~n"|
     generate_erlang_types(Rest)];
generate_erlang_types([#enum{ name = Name }|Rest]) ->
    ["-opaque '",Name,"'() :: {'",Name,"',integer()}.~n"|
     generate_erlang_types(Rest)];
generate_erlang_types([_|R]) ->
    generate_erlang_types(R);
generate_erlang_types([]) ->
    [].

generate_erlang_functions([#function{ name = Name,
				      return_type = Return,
				      params = Params,
				      docs = Docs }|Rest]) ->
    DocStr = ["%% @doc ",add_escape(Docs),"~n"],
    SpecStr = ["-spec '",Name,"'(",
	       llvm_api:generate_params(Params,
					fun(#param{name = PName, erlang_type=T}) -> 
						[to_var(PName)," :: ",T] end),
	       ") -> ",llvm_api_parser:to_erlang_type(Return),".~n"],

    BodyStr = ["'",Name,"'(",
	       llvm_api:generate_params(
		 Params,
		 fun(#param{ name = PName, array = false, erlang_type = T, 
			     erlang_tag = Tag}) ->
			 case is_erlang_type(T) of
			     false ->
				 ["{",Tag,",",to_var(PName),"}"];
			     ptr ->
				 PtrTag = case Tag of
					   "'char * *'" ->
					       "'string";
					   Else ->
					       hd(string:tokens(Else," "))
				       end,
				 ["{ptr,{",PtrTag,
				  "',",to_var(PName),"}}"];
			     true ->
				 to_var(PName)
			 end;
		    (#param{ name = PName, array = true }) ->
			 to_var(PName)
		 end),
	       ") ->~n"
	       "\t{",llvm_api_parser:to_erlang_tag(Return),",'",Name,"_internal'(",
	       llvm_api:generate_params(Params,fun(#param{ name = PName }) ->
						       to_var(PName)
					       end),
	       ")}.~n"
	       "'",Name,"_internal'(",
	       llvm_api:generate_params(Params, fun(#param{ name = PName}) ->
							["_",to_var(PName)]
						end),
	       ") ->~n"
	       "\tnif_not_loaded.~n~n"],
    [DocStr,SpecStr,BodyStr|generate_erlang_functions(Rest)];

generate_erlang_functions([_|R]) ->
    generate_erlang_functions(R);
generate_erlang_functions([]) ->
    [].

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

to_var([C|Rest]) when $a =< C, C =< $z ->
    [C - $a + $A|Rest];
to_var(Else) ->
    Else.

is_erlang_type(ErlangType) ->
    case hd(ErlangType) of
	$' ->
	    false;
	$l ->
	    ptr;
	_Else ->
	    true
    end.
