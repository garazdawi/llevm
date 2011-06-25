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
    io:format(D,NewStr,[]),
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
				     "on ~p--~n~n",[From,calendar:local_time()]),
    List = split_io_lib_format(lists:flatten(Str),0,[]),
    Post = io_lib:format(Cmt++" --- Stop generating from ~s~n",[From]),
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
generate_params([#param{} = P], Fun) ->
    [Fun(P)];
generate_params([#param{} = P|Rest], Fun) ->
    [Fun(P),","|generate_params(Rest,Fun)].
