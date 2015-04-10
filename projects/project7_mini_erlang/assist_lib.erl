%% @author eddie
%% @doc @todo Add description to assist_lib.


-module(assist_lib).
-author(eddie).

%% ====================================================================
%% API functions
%% ====================================================================
-export([]).

zip_pairs(_, []) -> [];
zip_pairs([], _) -> [];
zip_pairs([XH | XT], [YH | YT]) -> [fuse_pair(XH, YH) | zip_pairs(XT, YT)].
fuse_pair({X1, X2}, {Y1, Y2}) -> {X1, X2, Y1, Y2}.

%% ====================================================================
%% Internal functions
%% ====================================================================


