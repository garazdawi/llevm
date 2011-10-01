Nonterminals module variable function function_clauses function_clause clause_args clause_arg exprs expr params.
Terminals num atom var '(' ')' ';' ',' '+' '-' '<' '*' '=' '->' '.' '/'. 

Rootsymbol module.
Left 100 '+'.
Left 150 '-'.
Left 200 '*'.
Left 250 '/'.
Left 50 '<'.

module -> function '.' : '$1'.

function -> function_clauses : build_function('$1').

function_clauses -> function_clause : ['$1'].
function_clauses -> function_clause ';' function_clauses : ['$1'|'$3'].

function_clause -> atom '(' clause_args ')' '->' exprs : {clause, value_of('$1'), '$3', '$6'}.

clause_args -> clause_arg : ['$1'].
clause_args -> clause_arg ',' clause_args : ['$1'|'$3'].

clause_arg -> num : {int, value_of('$1')}.
clause_arg -> var : {var, value_of('$1')}.

exprs -> expr : ['$1'].
exprs -> expr ',' exprs : ['$1'|'$3'].

expr -> num : {int, value_of('$1')}.
expr -> var : {var, value_of('$1')}.
expr -> expr '+' expr : {'+','$1','$3'}.
expr -> expr '-' expr : {'-','$1','$3'}.
expr -> expr '*' expr : {'*','$1','$3'}.
expr -> expr '/' expr : {'/','$1','$3'}.
expr -> atom '(' params ')' : {call, value_of('$1'), '$3'}.

params -> expr : ['$1'].
params -> expr ',' params : ['$1'|'$3'].

Erlang code.
value_of(Token) ->
    element(3, Token).

build_function([{clause, Name, Args, _}|_] = Clauses) ->
    NumArgs = length(Args),
    {function, Name, NumArgs, check_clauses(Name, NumArgs, 0, Clauses)}.

check_clauses(Name, NumArgs, Label, [{clause, Name, Args, Body}|Rest]) 
  when length(Args) == NumArgs ->
    [{clause, Args, Body}|check_clauses(Name, NumArgs, Label + 1, Rest)];
check_clauses(_Name, _NumArgs, _Label, []) ->
    [];
check_clauses(_Name, _, _, _) ->
    return_error(0, "head missmatch").
