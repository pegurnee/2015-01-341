%% @author eddie
%% @doc @todo Add description to dolphin.


-module(dolphin).

%% ====================================================================
%% API functions
%% ====================================================================
-export([dolphin3/0, dolphin2/0, dolphin1/0]).

dolphin1() ->
    receive
      do_a_flip ->
          io:format("nuh uh~n");
      fish ->
          io:format("so long, and thanks for all the fish~n");
      _ ->
          io:format("heh~n")
    end.

dolphin2() ->
    receive
      {From, do_a_flip} ->
          From ! "nuh uh";
      {From, fish} ->
          From ! "So long and thanks for all the fish";
      _ ->
          io:format("heh~n")
    end.

dolphin3() ->
    receive
      {From, do_a_flip} ->
          From ! "nuh uh",
        dolphin3();
      {From, fish} ->
          From ! "So long and thanks for da fish";
      _ ->
          io:format("heh~n"),
          dolphin3()
    end.

%% ====================================================================
%% Internal functions
%% ====================================================================


