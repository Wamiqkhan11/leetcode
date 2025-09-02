%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).
-spec merge_k_lists(Lists :: [#list_node{} | null]) -> #list_node{} | null.
merge_k_lists([]) -> null;
merge_k_lists(Lists) -> merge_all(Lists).
merge_all([L]) -> L;
merge_all(Lists) -> merge_all_pairs(Lists, []).
merge_all_pairs([], Acc) ->
    merge_all(lists:reverse(Acc));
merge_all_pairs([A], Acc) ->
    merge_all(lists:reverse([A | Acc]));
merge_all_pairs([A, B | Rest], Acc) ->
    merge_all_pairs(Rest, [merge_two(A, B) | Acc]).
merge_two(null, B) -> B;
merge_two(A, null) -> A;
merge_two(#list_node{val = Va, next = Na} = A,
          #list_node{val = Vb, next = Nb} = B) ->
    if
        Va =< Vb ->
            #list_node{val = Va, next = merge_two(Na, B)};
        true ->
            #list_node{val = Vb, next = merge_two(A, Nb)}
    end.