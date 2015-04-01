%% @author eddie


-module(functions).
-author(eddie).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
         same/2, 
         second/1, 
         head/1, 
         valid_date/1, 
         old_enough/1, 
         right_age/1, 
         wrong_age/1
        ]).

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

old_enough(X) when X >= 16 -> true;
old_enough(_) -> false.

right_age(X) when X >= 16, X =< 104 -> true;
right_age(_) -> false.

wrong_age(X) when X < 16; X > 104 -> true;
wrong_age(_) -> false.
