-module(erlang_scan).


-export([string/1]).

string(Str) ->
    put(scan_tok, 0),
    scan(Str,none,[]).

scan([], none, Acc) ->
    lists:reverse(Acc);

%% Keyword scan
scan("->"++Rest, none, Acc) ->
    scan(Rest, none, [{'->',num()}|Acc]);
scan(" "++Rest, none, Acc) ->
    scan(Rest, none, Acc);
scan("\n"++Rest, none, Acc) ->
    scan(Rest, none, Acc);

%% special tokens
scan([Tok|Rest], none, Acc) 
  when Tok == $(; Tok == $); Tok == $;; Tok == $,;
       Tok == $+; Tok == $-; Tok == $/; Tok == $*;
       Tok == $<; Tok == $=; Tok == $.  ->
    scan(Rest, none, [{list_to_atom([Tok]),num()}|Acc]);

%% Number scan
scan([Num|Rest], none, Acc) 
  when  ($0 =< Num andalso Num =< $9) ->
    scan(Rest, {num, [Num]}, Acc);
scan([Num|Rest],{num,NumAcc},Acc) 
  when ($0 =< Num andalso Num =< $9)->
    scan(Rest, {num, [Num|NumAcc]}, Acc);
scan(String,{num,Num},Acc) ->
    scan(String, none, [{num, num(), lists:reverse(Num)}|Acc]);

%% Atom scan
scan([Char|Rest], none, Acc) 
  when  ($a =< Char andalso Char =< $z)->
    scan(Rest, {atom, [Char]}, Acc);
scan([Char|Rest],{atom,AtomAcc},Acc) 
  when ($a =< Char andalso Char =< $z);
       ($A =< Char andalso Char =< $Z);
       ($0 =< Char andalso Char =< $9) ->
    scan(Rest, {atom, [Char|AtomAcc]}, Acc);
scan(String,{atom,Char},Acc) ->
    scan(String, none, [{atom, num(), lists:reverse(Char)}|Acc]);

%% Variable scan
scan([Char|Rest], none, Acc) 
  when  ($A =< Char andalso Char =< $Z)->
    scan(Rest, {var, [Char]}, Acc);
scan([Char|Rest],{var,VarAcc},Acc) 
  when ($a =< Char andalso Char =< $z);
       ($A =< Char andalso Char =< $Z);
       ($0 =< Char andalso Char =< $9) ->
    scan(Rest, {var, [Char|VarAcc]}, Acc);
scan(String,{var,Char},Acc) ->
    scan(String, none, [{var, num(), lists:reverse(Char)}|Acc]).
    
num() ->
    Num = get(scan_tok),
    put(scan_tok, Num+1),
    Num.
