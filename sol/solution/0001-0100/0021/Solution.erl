%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).
-spec merge_two_lists(List1 :: #list_node{} | null, List2 :: #list_node{} | null) -> #list_node{} | null.
merge_two_lists(null, List2) -> List2;
merge_two_lists(List1, null) -> List1;
merge_two_lists(List1 = #list_node{val = V1, next = Next1}, List2 = #list_node{val = V2, next = Next2}) ->
    if
        V1 =< V2 ->
            #list_node{val = V1, next = merge_two_lists(Next1, List2)};
        true ->
            #list_node{val = V2, next = merge_two_lists(List1, Next2)}
    end.