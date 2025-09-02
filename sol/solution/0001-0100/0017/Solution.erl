-spec letter_combinations(Digits :: unicode:unicode_binary()) -> [unicode:unicode_binary()].
letter_combinations(Digits) when Digits == <<>> ->
    [];
letter_combinations(Digits) ->
    Map = #{
        <<"2">> => [<<"a">>, <<"b">>, <<"c">>],
        <<"3">> => [<<"d">>, <<"e">>, <<"f">>],
        <<"4">> => [<<"g">>, <<"h">>, <<"i">>],
        <<"5">> => [<<"j">>, <<"k">>, <<"l">>],
        <<"6">> => [<<"m">>, <<"n">>, <<"o">>],
        <<"7">> => [<<"p">>, <<"q">>, <<"r">>, <<"s">>],
        <<"8">> => [<<"t">>, <<"u">>, <<"v">>],
        <<"9">> => [<<"w">>, <<"x">>, <<"y">>, <<"z">>]
    },
    letter_combinations(Digits, Map).
letter_combinations(Digits, Map) ->
    DigitsList = unicode:characters_to_list(Digits),
    LettersList = [maps:get(<<D>>, Map, []) || D <- DigitsList],
    combine(LettersList).
combine([]) -> [];
combine([H]) -> H;
combine([H|T]) ->
    [<<A/binary, B/binary>> || A <- H, B <- combine(T)].