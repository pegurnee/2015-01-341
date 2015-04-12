%% @author eddie
%% @doc @todo Add description to recursion.


-module(recursion).

%% ====================================================================
%% API functions
%% ====================================================================
-export([]).

fac(0) -> 1;
fac(N) when N > 0 -> N * fac(N - 1).

tail_fac(N) -> tail_fac(N, 1).

tail_fac(0, Acc) -> Acc;
tail_fac(N, Acc) when N > 0 -> tail_fac(N - 1, N * Acc).

len([]) -> 1;
len([_ | T]) -> 1 + len(T).

tail_len(L) -> tail_len(L, 0).

tail_len([], Acc) -> Acc;
tail_len([_ | T], Acc) -> tail_len(T, Acc + 1).

duplicate(0, _) -> [];
duplicate(N, Elem) when N > 0 ->
  [Elem|duplicate(N - 1, Elem)].

tail_duplicate(N, Elem) -> tail_duplicate(N, Elem, []).
tail_duplicate(0, _, List) -> List;
tail_duplicate(N, Elem, List) when N > 0 ->
  tail_dup(N - 1, Elem, [Term|List]).

reverse([]) -> [];
reverse([H|T]) -> reverse(T) ++ [H].

tail_reverse(L) -> tail_reverse(L, []).

tail_reverse([], Acc) -> Acc;
tail_reverse([H|T], Acc) -> tail_reverse(T, [H|Acc]).




%% ====================================================================
%% Internal functions
%% ====================================================================


