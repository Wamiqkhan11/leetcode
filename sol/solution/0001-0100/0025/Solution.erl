%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).
-spec reverse_k_group(Head :: #list_node{} | null, K :: integer()) -> #list_node{} | null.
reverse_k_group(Head, K) when K =< 1 -> Head;
reverse_k_group(Head, K) when Head =:= null -> null;
reverse_k_group(Head, K) ->
  List = to_list(Head),
  NewList = reverse_k_chunks(List, K),
  from_list(NewList).
to_list(null) -> [];
to_list(#list_node{val = V, next = Next}) -> [V | to_list(Next)].
from_list([]) -> null;
from_list([H | T]) -> #list_node{val = H, next = from_list(T)}.
reverse_k_chunks(List, K) ->
  Groups = reverse_k_chunks(List, K, []),
  lists:append(Groups).
reverse_k_chunks([], _K, Acc) -> lists:reverse(Acc);
reverse_k_chunks(List, K, Acc) ->
  {Chunk, Rest, Len} = take_chunk(List, K, [], 0),
  Group = if Len == K -> Chunk; true -> lists:reverse(Chunk) end,
  reverse_k_chunks(Rest, K, [Group | Acc]).
take_chunk(Rest, 0, Chunk, Len) -> {Chunk, Rest, Len};
take_chunk([], _K, Chunk, Len) -> {Chunk, [], Len};
take_chunk([H | T], K, Chunk, Len) -> take_chunk(T, K - 1, [H | Chunk], Len + 1).