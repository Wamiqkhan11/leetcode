-spec is_valid(S :: unicode:unicode_binary()) -> boolean().
is_valid(S) ->
    Chars = unicode:characters_to_list(S),
    Pairs = #{ $) => $(, $] => $[, $} => ${ },
    check(Chars, [], Pairs).
check([], [], _Pairs) ->
    true;
check([], _Stack, _Pairs) ->
    false;
check([C | Rest], Stack, Pairs) ->
    case maps:get(C, Pairs, undefined) of
        undefined ->
            check(Rest, [C | Stack], Pairs);
        Open ->
            case Stack of
                [Open | Tail] -> check(Rest, Tail, Pairs);
                _ -> false
            end
    end.
