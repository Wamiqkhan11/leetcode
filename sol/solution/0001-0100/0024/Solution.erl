%% Definition for singly-linked list.
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).
-spec swap_pairs(Head :: #list_node{} | null) -> #list_node{} | null.
swap_pairs(null) ->
    null;
swap_pairs(#list_node{next = null} = Head) ->
    Head;
swap_pairs(#list_node{val = V1, next = #list_node{val = V2, next = Rest}}) ->
    SwappedRest = swap_pairs(Rest),
    Second = #list_node{val = V2, next = #list_node{val = V1, next = SwappedRest}},
    Second.