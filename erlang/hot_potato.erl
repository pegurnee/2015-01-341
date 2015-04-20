%% @author eddie
%% @doc @todo Add description to hot_potato.


-module(hot_potato).

%% ====================================================================
%% API functions
%% ====================================================================
-export([hp/0,hp3/0]).

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
            
    
hp3() -> 
  Other_PID = spawn(hot_potato, catch_potato, []),
  spawn(hot_potato, throw_potato, [3, Other_PID]).

throw_potato(0, Other_PID) ->
  Other_PID ! finished,
  io:format("you lose ~p~n", [self()]);
throw_potato(N, Other_PID) ->
  io:format("~p just caught ~p~n", [self(), N]),
  receive
      {_, Other_PID} ->
          Other_PID ! {crypto:rand_uniform(0, 8), self()},
          catch_potato()
  end.


catch_potato() ->
  receive
      finished ->
          io:format("you win ~p~n", [self()]);
      {N, Other_PID} ->
          io:format("~p just caught ~p~n", [self(), N]),
          throw_potato(crypto:rand_uniform(0, 8), self())
  end.


%% ====================================================================
%% Internal functions
%% ====================================================================


