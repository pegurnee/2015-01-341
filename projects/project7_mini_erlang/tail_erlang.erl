%% @author eddie
%% @doc @todo Add description to tail_erlang.

-module(tail_erlang).
-author(eddie).

%% ====================================================================
%% API functions
%% ====================================================================
-export([count/2, substring/2, get_last/1, zip/2, permute/1, ackermann/2]).

count(X, Y) -> count_tail(X, Y, 0).

substring(X,Y) -> subHelp(0, X, Y).

get_last([]) -> [];
get_last([X]) -> X;
get_last([_, Y|Tail]) -> get_last([Y|Tail]).

zip([], _) -> [];
zip(_, []) -> [];
zip([Head1|Tail1], [Head2|Tail2]) -> [{Head1, Head2}|zip(Tail1, Tail2)].

permute([]) -> [[]];
permute(List) -> [[Head|Tail] || Head <- List, Tail <- permute(List -- [Head])].

ackermann(M, N) when M < 0; N < 0 -> fail_blog;
ackermann(0, N) -> N + 1;
ackermann(M, 0) -> ackermann(M - 1, 1);
ackermann(M, N) -> ackermann(M - 1, ackermann(M, N - 1)).

%% ====================================================================
%% Internal functions
%% ====================================================================


count_tail(_, [], Acc) -> Acc;
count_tail(X, [Y|YS], Acc) -> 
    case X =:= Y of
        true -> 1 + count(X, YS, Acc);
        false -> count(X, YS, Acc)
    end.

subHelp(_, _, []) -> -1;
subHelp(Index, X, Y) ->
    case take(Y, length(X)) of
        X -> Index;
        _ -> subHelp(Index + 1, X, tail(Y))
    end.

take([], _) -> [];
take(_, 0) -> [];
take([Head|Tail], N) -> [Head|take(Tail, N - 1)].

tail([]) -> [];
tail([_|T]) -> T.
