%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).
-spec remove_nth_from_end(Head :: #list_node{} | null, N :: integer()) -> #list_node{} | null.
remove_nth_from_end(Head, N) ->
    Nodes = to_list(Head),
    Len = length(Nodes),
    Index = Len - N,
    case Index < 0 of
        true -> Head;
        false ->
            NewNodes = remove_at(Nodes, Index),
            from_list(NewNodes)
    end.
to_list(null) -> [];
to_list(#list_node{val = V, next = Next}) -> [V | to_list(Next)].
remove_at(List, Index) ->
    {Left, [_|Right]} = lists:split(Index, List),
    Left ++ Right.
from_list([]) -> null;
from_list([H|T]) -> #list_node{val = H, next = from_list(T)}.