-module(llvm_nif).

-on_load(load_my_nifs/0).

-export([module_new/1, module_getFunction/2, module_dump/1]).

load_my_nifs() ->
    erlang:load_nif("./priv/x86_64/llevm",0).

module_new(_Name) ->
    not_loaded.

module_getFunction(_Mod, _Callee) ->
    not_loaded.

module_dump(_Mod) ->
    not_loaded.
