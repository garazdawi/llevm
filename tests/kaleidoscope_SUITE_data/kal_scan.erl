-module(kal_scan).


-export([string/1]).

string(Str) ->
    put(scan_tok, 0),
    scan(Str,none,[]).

scan([], none, Acc) ->
    lists:reverse(Acc);

%% Keyword scan
scan("def"++Rest, none, Acc) ->
    scan(Rest, none, [{def,num()}|Acc]);
scan("extern"++Rest, none, Acc) ->
    scan(Rest, none, [{extern,num()}|Acc]);
scan("if"++Rest, none, Acc) ->
    scan(Rest, none, [{'if',num()}|Acc]);
scan("then"++Rest, none, Acc) ->
    scan(Rest, none, [{then,num()}|Acc]);
scan("else"++Rest, none, Acc) ->
    scan(Rest, none, [{else,num()}|Acc]);
scan("for"++Rest, none, Acc) ->
    scan(Rest, none, [{for,num()}|Acc]);
scan("in"++Rest, none, Acc) ->
    scan(Rest, none, [{in,num()}|Acc]);
scan(" "++Rest, none, Acc) ->
    scan(Rest, none, Acc);
scan("\n"++Rest, none, Acc) ->
    scan(Rest, none, Acc);

%% special tokens
scan([Tok|Rest], none, Acc) 
  when Tok == $(; Tok == $); Tok == $;; Tok == $,;
       Tok == $+; Tok == $-; Tok == $/; Tok == $*;
       Tok == $<; Tok == $=  ->
    scan(Rest, none, [{list_to_atom([Tok]),num()}|Acc]);

%% Number scan
scan([Num|Rest], none, Acc) 
  when  ($0 =< Num andalso Num =< $9); Num == $. ->
    scan(Rest, {num, [Num]}, Acc);
scan([Num|Rest],{num,NumAcc},Acc) 
  when ($0 =< Num andalso Num =< $9); Num == $. ->
    scan(Rest, {num, [Num|NumAcc]}, Acc);
scan(String,{num,Num},Acc) ->
    scan(String, none, [{num, num(), lists:reverse(Num)}|Acc]);

%% Identifier scan
scan([Ident|Rest], none, Acc) 
  when  ($a =< Ident andalso Ident =< $z); 
	($A =< Ident andalso Ident =< $Z) ->
    scan(Rest, {ident, [Ident]}, Acc);
scan([Ident|Rest],{ident,IdentAcc},Acc) 
  when ($a =< Ident andalso Ident =< $z);
       ($A =< Ident andalso Ident =< $Z);
       ($0 =< Ident andalso Ident =< $9) ->
    scan(Rest, {ident, [Ident|IdentAcc]}, Acc);
scan(String,{ident,Ident},Acc) ->
    scan(String, none, [{ident, num(), lists:reverse(Ident)}|Acc]).

    
num() ->
    Num = get(scan_tok),
    put(scan_tok, Num+1),
    Num.
