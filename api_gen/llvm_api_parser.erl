-module(llvm_api_parser).

-export([parse/1,to_erlang_tag/1,to_erlang_type/1]).

-include("llvm_api.hrl").
-include_lib("xmerl/include/xmerl.hrl").

parse(Path) ->
    Acc = fun(#xmlText{value = " ", pos = P}, Acc, S) ->
		  {Acc, P, S};  % new return format
	     (X, Acc, S) ->
		  {[X|Acc], S}
	  end,
    {XML, []} = xmerl_scan:file(Path,[{space,normalize}, {acc_fun, Acc}]),
    lists:reverse(parse_xml(XML,[])).


parse_xml(#xmlElement{ name = memberdef, 
		       attributes = [#xmlAttribute{ name = kind, value = "enum"}|_],
		     content = Content},Acc) ->
    [parse_enum(Content,#enum{})|Acc];
parse_xml(#xmlElement{ name = memberdef, 
		       attributes = [#xmlAttribute{ name = kind, value = "typedef"}|_],
		     content = Content},Acc) ->
    [parse_typedef(Content,#typedef{})|Acc];
parse_xml(#xmlElement{ name = memberdef, 
		       attributes = [#xmlAttribute{ name = kind, value = "function"}|_],
		     content = [_,_,_,#xmlElement{ content = 
						       [#xmlText{ value = Name }]}|_]
		       = Content},Acc) ?LIMIT ->
    [parse_function(Content,#function{})|Acc];
parse_xml(#xmlText{}, Acc) ->
    Acc;
parse_xml(#xmlElement{ content = Content }, Acc) ->
    lists:foldl(fun(XML, NewAcc) ->
			parse_xml(XML,NewAcc)
		end, Acc, Content).
		
%
% Parse Enum things
%	    
parse_enum(#xmlElement{ name = name, content = [#xmlText{ value = Name }]},
	   Enum) ->
    Enum#enum{ name = Name };
parse_enum(#xmlElement{ name = enumvalue, content = Content},Enum) ->
    Member = parse_enum_member(Content, #enum_member{}),
    Enum#enum{ members = [Member|Enum#enum.members]};
parse_enum(#xmlElement{ name = detaileddescription, content = Descr}, 
	       Enum) ->
    Enum#enum{ docs = parse_text(Descr) };
parse_enum(#xmlElement{},Enum) ->
    Enum;
parse_enum(XML, Enum) when is_list(XML) ->
    FinEnum = lists:foldl(fun(XMLElement, Acc) ->
				  parse_enum(XMLElement, Acc)
			  end,Enum,XML),
    Members = lists:reverse(FinEnum#enum.members),
    {NewMembers,_} = lists:mapfoldl(
		       fun(#enum_member{ value = undefined } = Member, Num) ->
			       {Member#enum_member{ value = Num}, Num + 1};
			  (Member, Num) ->
			       {Member, Num + Member#enum_member.value + 1} % Use initializer's value
		       end,0, Members),
    FinEnum#enum{ members = NewMembers }.
    

parse_enum_member(#xmlElement{ name = name, 
				content = [#xmlText{ value = Name }]},
		  Member) ->
    Member#enum_member{ name = Name };
parse_enum_member(#xmlElement{ name = initializer, content = Text},
		  Member) ->
    Member#enum_member{ value = parse_value(Text) };
parse_enum_member(#xmlElement{ name = detaileddescription, content = Descr}, 
	       Member) ->
    Member#enum_member{ docs = parse_text(Descr) };
parse_enum_member(#xmlElement{ }, Member) ->
    Member;
parse_enum_member(XML, EnumMember) when is_list(XML) ->
    lists:foldl(fun(XMLElement, Acc) ->
			parse_enum_member(XMLElement, Acc)
		end,EnumMember,XML).

parse_value(XML) ->
    Str = parse_text(XML, ""),
    case {string:tokens(Str, " <"),string:tokens(Str, "x")} of
	{[Left,Right],_} ->
	    list_to_integer(Left) bsl list_to_integer(Right);
	{_,[_Left,Right]} ->
	    list_to_integer(Right,16);
	{[Integer],_} ->
	    list_to_integer(Integer)
    end.

%
% Parse typedef
%
parse_typedef(#xmlElement{ name = type, content = TypeXML }, Typedef) ->
    [TypeStr|_] = lists:reverse(string:tokens(parse_text(TypeXML)," ")),
		  
    IsPtr = case lists:reverse(TypeStr) of
		[$*|_] ->
		    true;
		_Else ->
		    false
	    end,
    Typedef#typedef{ is_ptr = IsPtr, type = TypeStr };
parse_typedef(#xmlElement{ name = name, content = [#xmlText{ value = Name }]}, 
	      Typedef) ->
    Typedef#typedef{ name = Name };
parse_typedef(#xmlElement{ name = detaileddescription, 
			   content = Descr}, 
	      Typedef) ->
    Typedef#typedef{ docs = parse_text(Descr) };
parse_typedef(#xmlElement{}, Typedef) ->
    Typedef;
parse_typedef(XML, Typedef) when is_list(XML) ->
    lists:foldl(fun(XMLElement, Acc) ->
			parse_typedef(XMLElement, Acc)
		end,Typedef,XML).

%
% Generic
%
parse_function(#xmlElement{ name = name, content = [#xmlText{ value = Name }]}, 
	       Func) ->
    Func#function{ name = Name };
parse_function(#xmlElement{ name = type, content = Type }, Func) ->
    Func#function{ return_type = parse_type(Type) };
parse_function(#xmlElement{ name = detaileddescription, content = Descr}, 
	       Func) ->
    Func#function{ docs = parse_text(Descr) };
parse_function(#xmlElement{ name = param, content = ParamXML },Func) ->
    put(func_name, Func#function.name),
    Param = parse_param(ParamXML, #param{}),
    Func#function{ params = [Param|Func#function.params]};
parse_function(#xmlElement{ }, Func) ->
    Func;
parse_function(XML, Func) when is_list(XML) ->
    FinFunc = lists:foldl(fun(XMLElement, Acc) ->
				  parse_function(XMLElement, Acc)
			  end,Func,XML),
    NewParam = lists:flatmap(fun(#param{ type = "LLVMBuilderRef", 
					 name = undefined } = Param) ->
				     [Param#param{ name = "B" }];
				(#param{ type = "LLVMAttribute", 
					 name = undefined } = Param) ->
				     [Param#param{ name = "PA" }];
				(#param{ type = "LLVMPassManagerRef", 
					 name = undefined } = Param) ->
				     [Param#param{ name = "PM" }];
				(#param{ type = "LLVMTargetDataRef", 
					 name = undefined } = Param) ->
				     [Param#param{ name = "TD" }];
				(#param{ type = "LLVMTypeRef", 
					 name = undefined } = Param) ->
				     [Param#param{ name = "TypeRef" }];
				(#param{ type = "lto_code_gen_t", 
					 name = undefined } = Param) ->
				     [Param#param{ name = "code_gen" }];
				(#param{ type = "lto_debug_model", 
					 name = undefined } = Param) ->
				     [Param#param{ name = "dbg" }];
				(#param{ type = "lto_codegen_model", 
					 name = undefined } = Param) ->
				     [Param#param{ name = "code_gen" }];
				(#param{ type = "const char *", 
					 name = undefined } = Param) ->
				     [Param#param{ name = "string" }];
				(#param{ type = "void" }) ->
				     [];
				(#param{ type = Type, 
					 name = undefined } = Param) ->
				     [Param#param{ name = Type++"_var" }];
				(P) ->
				     [P]
			     end,lists:reverse(FinFunc#function.params)),
    OutParam = [Param#param{ out_param = is_out_param(get(func_name),PName) } ||
		   Param = #param{ name = PName} <- NewParam],
    FinFunc#function{ params = OutParam}.

parse_param(#xmlElement{ name = type, content = TypeXML }, Param) ->
    Type = parse_type(TypeXML),
    case is_array(get(func_name),Param#param.name) of
	true ->
	    StrippedType = lists:flatten(string:tokens(Type," *")),
	    Param#param{ type = Type, array = true,
			 erlang_type = ["tuple(",to_erlang_type(StrippedType),")"],
			 erlang_tag = to_erlang_tag(StrippedType) };
	false ->
	    Param#param{ type = Type, erlang_type = to_erlang_type(Type), 
			 erlang_tag = to_erlang_tag(Type) }
    end;
parse_param(#xmlElement{ name = declname, content = [#xmlText{ value = Name }]}, 
	    Param) ->
    Param#param{ name = Name };
parse_param(#xmlElement{ name = array }, Param) ->
    Param#param{ array = true };
parse_param(XML, Param) when is_list(XML) ->
    lists:foldl(fun(XMLElement, Acc) ->
			parse_param(XMLElement, Acc)
		end,Param,lists:reverse(XML)).

parse_type([#xmlElement{ 
	       name = ref, 
	       content = [#xmlText{ value = Type }]}]) ->
    Type;
parse_type(Type) ->
    parse_text(Type).


%
% Generic
%
parse_text(XML) ->
    parse_text(XML,"").
parse_text([#xmlElement{ content = Content}|Rest], Acc) ->
    parse_text(Rest, [parse_text(Content)|Acc]);
parse_text([#xmlText{ value = Val }|Rest],Acc) ->
    parse_text(Rest,[Val|Acc]);
parse_text([],Acc) ->
    lists:flatten(lists:reverse(Acc)).

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
to_erlang_tag("unsigned int") ->
    "integer";
to_erlang_tag("uint64_t") ->
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
to_erlang_tag("size_t") ->
    "integer";
to_erlang_tag("off_t") ->
    "integer";
to_erlang_tag("double") ->
    "float";
to_erlang_tag("void") ->
    "atom";
to_erlang_tag("bool") ->
    "boolean";
to_erlang_tag("LLVMBool") ->
    "boolean";
to_erlang_tag("constcharconst") ->
    "string";
to_erlang_tag("constchar") ->
    "string";
to_erlang_tag("const "++Rest) ->
    to_erlang_tag(Rest);
to_erlang_tag("enum "++Rest) ->
    to_erlang_tag(Rest);
to_erlang_tag(Else) ->
    "'"++Else++"'".

%% Check hardcoded arrays
is_array(FName,PName) ->
    lists:member({FName,PName},?ARRAYS).
is_out_param(_FName,"Out"++_) ->
    true;
is_out_param(_,_) ->
    false.

