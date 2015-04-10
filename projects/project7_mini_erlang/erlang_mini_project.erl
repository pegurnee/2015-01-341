%% @author eddie
%% @doc @todo Add description to erlang_mini_project.

-module(erlang_mini_project).
-author(eddie).

%% ====================================================================
%% API functions
%% ====================================================================
-export([count/2, substring/2, get_last/1, zip/2, permute/1, ackermann/2]).

count(X,Y) -> false.

substring(X,Y) -> false.

get_last(X) -> false.

zip([], _) -> [];
zip(_, []) -> [];
zip([Head1 | Tail1], [Head2 | Tail2]) -> [{Head1, Head2} | zip(Tail1, Tail2)].

permute(X) -> false.

ackermann(M, N) when M < 0; N < 0 -> fail_blog;
ackermann(0, N) -> N + 1;
ackermann(M, 0) -> ackermann(M - 1, 1);
ackermann(M, N) -> ackermann(M - 1, ackermann(M, N - 1)).

%% ====================================================================
%% Internal functions
%% ====================================================================


