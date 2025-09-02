-spec generate_parenthesis(N :: integer()) -> [unicode:unicode_binary()].
generate_parenthesis(N) ->
    generate(N, N, <<>>).
generate(0, 0, Acc) ->
    [Acc];
generate(Open, Close, Acc) when Open > 0, Open =< Close ->
    generate(Open - 1, Close, <<Acc/binary, "(">>) ++
    (if Close > Open -> generate(Open, Close - 1, <<Acc/binary, ")">>); true -> [] end);
generate(Open, Close, Acc) when Close > Open ->
    generate(Open, Close - 1, <<Acc/binary, ")">>);
generate(_, _, _) ->
    [].