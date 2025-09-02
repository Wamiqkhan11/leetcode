-spec find_substring(S :: unicode:unicode_binary(), Words :: [unicode:unicode_binary()]) -> [integer()].
find_substring(S, Words) ->
  case Words of
    [] -> [];
    _ ->
      case same_length(Words) of
        false -> [];
        true ->
          WordLen = byte_size(hd(Words)),
          TotalWords = length(Words),
          TotalLen = WordLen * TotalWords,
          SLen = byte_size(S),
          if SLen < TotalLen -> [];
             true ->
               WordsMap = build_words_map(Words, #{}),
               find_positions(S, SLen, WordsMap, WordLen, TotalWords, TotalLen, 0, [])
          end
      end
  end.
find_positions(S, SLen, WordsMap, WordLen, TotalWords, TotalLen, Pos, Acc) when Pos =< SLen - TotalLen ->
  Sub = binary:part(S, {Pos, TotalLen}),
  Map = build_sub_map(Sub, WordLen, TotalWords, 0, #{}),
  NewAcc = case Map == WordsMap of true -> [Pos | Acc]; false -> Acc end,
  find_positions(S, SLen, WordsMap, WordLen, TotalWords, TotalLen, Pos + 1, NewAcc);
find_positions(_S, _SLen, _WordsMap, _WordLen, _TotalWords, _TotalLen, _Pos, Acc) ->
  lists:reverse(Acc).
build_words_map([H|T], Acc) ->
  build_words_map(T, update_count(H, Acc));
build_words_map([], Acc) -> Acc.
build_sub_map(_Sub, _WordLen, TotalWords, TotalWords, Acc) -> Acc;
build_sub_map(Sub, WordLen, TotalWords, I, Acc) ->
  W = binary:part(Sub, {I*WordLen, WordLen}),
  build_sub_map(Sub, WordLen, TotalWords, I+1, update_count(W, Acc)).
update_count(W, Acc) ->
  maps:update_with(W, fun(V) -> V + 1 end, 1, Acc).
same_length([H|T]) ->
  L = byte_size(H),
  lists:all(fun(W) -> byte_size(W) =:= L end, T);
same_length([]) -> true.