-module(llvm_api).

-export([generate/2, generate_params/2]).

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
    split_format(lists:flatten(NewStr),0,[], 
		 fun(SubStr) -> io:format(D,add_escape(SubStr),[]) end),
    file:close(D);
replace("@@"++Rest, What, With) ->
    case lists:prefix(What,Rest) of
	true ->
	    ["@@",What,"@@\n",With,Rest -- (What++"@@")];
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

    Nif = filename:join([Path,"csrc","llevm.c"]),
    file:copy("llevm.c.in",Nif),
    put(nif, Nif),
    
    ok.

header(From, Str, Cmt) ->
    Pre = io_lib:format(Cmt++" -- Start generating from ~s "
				     "on ~w--~n~n",[From,calendar:local_time()]),
    List = split_format(lists:flatten(Str),0,[], 
			fun(SubStr) -> io_lib:format(SubStr,[]) end),
    Post = io_lib:format(Cmt++" --- Stop generating from ~s~n",[From]),
    [Pre,List,Post].

split_format(Rest,Len,Acc,F) when Len == 128, hd(Acc) /= $~ ->
    [split_format([],0,Acc,F)|split_format(Rest,0,[],F)];
split_format([C|R],Len,Acc,F) ->
    split_format(R,Len+1,[C|Acc],F);
split_format([],_,[],_) ->
    [];
split_format([],_,Acc,F) ->
    F(lists:reverse(Acc)).

generate_int(From, Entities) ->
    replace(include, "CONST",
	    header(From,llvm_api_erlang:generate_enums(Entities),"%%")),
    replace(module, "TYPES",
	    header(From, llvm_api_erlang:generate_erlang_types(Entities),"%%")),
    replace(module, "EXPORTS",
	    header(From, llvm_api_erlang:generate_exports(Entities),"%%")),
    replace(module, "FUNCTIONS",
	    header(From, llvm_api_erlang:generate_erlang_functions(Entities),"%%")),
    replace(nif, "TYPES",
	    header(From,llvm_api_nif:generate_types(Entities),"//")),
    replace(nif, "RESOURCE_TYPES",
	    header(From,llvm_api_nif:generate_resource_types(Entities),"//")),
    replace(nif, "FUNCTIONS",
	    header(From,llvm_api_nif:generate_functions(Entities),"//")),
    replace(nif, "NIF_MAPPINGS",
	    header(From,llvm_api_nif:generate_mappings(Entities),"//")).

generate_params([], _Fun) ->
    [];
generate_params([P | Rest], Fun) ->
    case Fun(P) of
	[] -> generate_params(Rest, Fun);
	Res ->
	    [Res | generate_rest(Rest, Fun)]
    end.
generate_rest([], _Fun) ->
    [];
generate_rest([#param{} = P|Rest], Fun) ->
    case Fun(P) of
	[] -> generate_rest(Rest,Fun);
	Res -> 
	    [",",Res|generate_rest(Rest,Fun)]
    end.

add_escape([$~|R]) ->
    [$~,$~|add_escape(R)];
add_escape([C|R]) ->
    [C|add_escape(R)];
add_escape([]) ->
    [].
