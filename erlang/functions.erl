%% @author eddie


-module(functions).
-author("eddie").

%% ====================================================================
%% API functions
%% ====================================================================
-export([same/2, second/1, head/1, valid_date/1]).



%% ====================================================================
%% Internal functions
%% ====================================================================
head([H|_]) -> H.

second([_,X|_]) -> X.

same(X,X) -> true;
same(_,_) -> false.

valid_date({Date = {Y,M,D}, Time = {H,Min,S}}) ->
    io:format("The date tuple (~p) says today is ~p/~p/~p~n", [Date,Y,M,D]),
    io:format("The time tuple (~p) indicates: ~p:~p:~p.~n", [Time,H,Min,S]);
valid_date(_) ->
    io:format("Wrong data my friend!!!~n").
