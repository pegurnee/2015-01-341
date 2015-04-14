%% @author eddie
%% @doc @todo Add description to hot_potato.


-module(hot_potato).

%% ====================================================================
%% API functions
%% ====================================================================
-export(hp/0]).

hp() ->
    receive
        0 ->
            io:format("hot potato~n");
        {From, 0} ->
            io:format("hot potato~n"),
            From ! game_over;
        _ ->
            X = crypto:rand_uniform(0, 2),
            io:format("sending ~p~n", [X]),
            hp()
    end.
            
    
%% hp3() -> 
%%   Other_PID = spawn(hot_potato, pass, []),
%%   spawn(hot_potato, pass, [3, Other_PID]).
%% 
%% pass(0, Other_PID) ->
%%   Other_PID ! finished,
%%   io:format("you lose ~p~n", [self()]);
%% pass(N, Other_PID) ->
%%   receive
%%       finished ->
%%           io:format("you win ~p~n", [self()]);
%%       {0, Other_PID} ->
%%           io:format("you lose ~p~n", [self()]),
%%           Other_PID ! finished;
%%       {_, Other_PID} ->
%%           Other_PID ! {crypto:rand_uniform(0, 8), self()};
%%           
%%   end,
%%   ping(N - 1, Pong_PID).
%% 
%% pong() ->
%%   receive
%%       finished ->
%%           io:format("pong finished~n");
%%       {ping, Ping_PID} ->
%%           io:format("Pong received ping~n"),
%%           Ping_PID ! pong,
%%           pong()
%%   end.


%% ====================================================================
%% Internal functions
%% ====================================================================


