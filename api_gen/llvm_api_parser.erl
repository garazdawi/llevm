-module(llvm_api_parser).

-export([parse/1]).

-include("llvm_api.hrl").
-include_lib("xmerl/include/xmerl.hrl").

parse(Path) ->
    Acc = fun(#xmlText{value = " ", pos = P}, Acc, S) ->
		  {Acc, P, S};  % new return format
	     (X, Acc, S) ->
		  {[X|Acc], S}
	  end,
    {XML, []} = xmerl_scan:file(Path,[{space,normalize}, {acc_fun, Acc}]),
    parse_xml(XML,[]).


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
		     content = Content},Acc) ->
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
			       {Member, Num}
		       end,1, Members),
    FinEnum#enum{ members = NewMembers }.
    

parse_enum_member(#xmlElement{ name = name, 
				content = [#xmlText{ value = Name }]},
		  Member) ->
    Member#enum_member{ name = Name };
parse_enum_member(#xmlElement{ name = initializer, content = Text},
		  Member) ->
    Member#enum_member{ value = parse_value(Text) };
parse_enum_member(#xmlElement{ }, Member) ->
    Member;
parse_enum_member(XML, EnumMember) when is_list(XML) ->
    lists:foldl(fun(XMLElement, Acc) ->
			parse_enum_member(XMLElement, Acc)
		end,EnumMember,XML).

parse_value(XML) ->
    Str = parse_text(XML, ""),
    case string:tokens(Str, " <") of
	[Left,Right] ->
	    list_to_integer(Left) bsl list_to_integer(Right);
	[Integer] ->
	    list_to_integer(Integer)
    end.

%
% Parse typedef
%
parse_typedef(#xmlElement{ name = type, content = TypeXML }, Typedef) ->
    TypeStr = parse_text(TypeXML),
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
    Param = parse_param(ParamXML, #param{}),
    Func#function{ params = [Param|Func#function.params]};
parse_function(#xmlElement{ name = Name }, Func) 
  when 
      Name == definition; 
      Name == argsstring; 
      Name == briefdescription; 
      Name == inbodydescription; 
      Name == location ->
    Func;
parse_function(XML, Func) when is_list(XML) ->
    FinFunc = lists:foldl(fun(XMLElement, Acc) ->
				  parse_function(XMLElement, Acc)
			  end,Func,XML),
    FinFunc#function{ params = lists:reverse(FinFunc#function.params)}.


parse_param(#xmlElement{ name = type, content = TypeXML }, Param) ->
    Type = parse_type(TypeXML),
    Param#param{ type = Type };
parse_param(#xmlElement{ name = declname, content = [#xmlText{ value = Name }]}, 
	    Param) ->
    Param#param{ name = Name };
parse_param(#xmlElement{ name = array}, Param) ->
    Param#param{ array = true };
parse_param(XML, Param) when is_list(XML) ->
    lists:foldl(fun(XMLElement, Acc) ->
			parse_param(XMLElement, Acc)
		end,Param,XML).

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
parse_text([#xmlElement{ name = Name, content = Content}|Rest], Acc) ->
    SName = atom_to_list(Name),
    parse_text(Rest, [["<",SName++">",parse_text(Content),"</",SName++">"]|Acc]);
parse_text([#xmlText{ value = Val }|Rest],Acc) ->
    parse_text(Rest,[Val|Acc]);
parse_text([],Acc) ->
    lists:flatten(lists:reverse(Acc)).
