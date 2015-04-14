%% @author eddie
%% @doc @todo Add description to ping_pong.


-module(ping_pong).

%% ====================================================================
%% API functions
%% ====================================================================
-export([pong/0, ping/2, start/0]).

start() ->
  Pong_PID = spawn(ping_pong, pong, []),
  spawn(ping_pong, ping, [3, Pong_PID]).

ping(0, Pong_PID) ->
  Pong_PID ! finished,
  io:format("ping finished~n");
ping(N, Pong_PID) ->
  Pong_PID ! {ping, self()},
  receive
      pong ->
          io:format("Ping received pong~n")
  end,
  ping(N - 1, Pong_PID).

pong() ->
  receive
      finished ->
          io:format("pong finished~n");
      {ping, Ping_PID} ->
          io:format("Pong received ping~n"),
          Ping_PID ! pong,
          pong()
  end.


%% ====================================================================
%% Internal functions
%% ====================================================================


