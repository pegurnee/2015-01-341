%% @author eddie
%% @doc @todo Add description to erlang_mini_project.

-module(erlang_mini_project).
-author(eddie).

%% ====================================================================
%% API functions
%% ====================================================================
-export([count/2, substring/2, get_last/1, zip_pairs/2, permute/1, ackermann/2]).

count(X,Y) -> false.

substring(X,Y) -> false.

get_last(X) -> false.

zip_pairs(X,Y) -> false.

permute(X) -> false.

ackermann(M, N) when M < 0; N < 0 -> fail_blog;
ackermann(0, N) -> N + 1;
ackermann(M, 0) -> ackermann(M - 1, 1);
ackermann(M, N) -> ackermann(M - 1, ackermann(M, N - 1)).

%% ====================================================================
%% Internal functions
%% ====================================================================


