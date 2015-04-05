%% @author eddie


-module(what_the_if).
-author(eddie).

%% ====================================================================
%% API functions
%% ====================================================================
-export([beachf/1, beach/1, insert/2, help_me/1, oh_god/1, heh_fine/0]).

heh_fine() ->
  if 1 =:= 1 ->
         works
  end,
  if 1 =:= 2; 1 =:= 1 ->
         works
  end,
  if 1 =:= 2, 1 =:= 1 ->
         fails
  end.

%% ====================================================================
%% Internal functions
%% ====================================================================


