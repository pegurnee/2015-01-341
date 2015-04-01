-module(useless).
-export([add/2, hello/0, greet_and_add_two/1]).
-author("eddie").

% comment
add(A,B) ->
  A + B.

%% Stylish comment
hello() ->
  io:format("Hello, world!~n").

greet_and_add_two(X) ->
  add(X,2).
