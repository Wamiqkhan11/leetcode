-spec longest_valid_parentheses(binary()) -> integer().
longest_valid_parentheses(S) ->
    L = binary_to_list(S),
    LR = pass_lr(L, 0, 0, 0),
    RL = pass_rl(L, 0, 0, 0),
    case LR > RL of true -> LR; false -> RL end.
pass_lr([], Left, Right, Best) ->
    Best1 = if Left =:= Right -> max(Best, 2*Right); true -> Best end,
    Best1;
pass_lr([$( | T], Left, Right, Best) ->
    update_lr(T, Left+1, Right, Best);
pass_lr([$) | T], Left, Right, Best) ->
    update_lr(T, Left, Right+1, Best).
update_lr(T, Left, Right, Best) ->
    case Left of
        L when L =:= Right -> pass_lr(T, Left, Right, max(Best, 2*Right));
        _ ->
            case Right > Left of
                true -> pass_lr(T, 0, 0, Best);
                false -> pass_lr(T, Left, Right, Best)
            end
    end.
pass_rl(L, Left, Right, Best) ->
    pass_rl_rev(lists:reverse(L), Left, Right, Best).
pass_rl_rev([], Left, Right, Best) ->
    Best1 = if Left =:= Right -> max(Best, 2*Left); true -> Best end,
    Best1;
pass_rl_rev([$( | T], Left, Right, Best) ->
    update_rl(T, Left+1, Right, Best);
pass_rl_rev([$) | T], Left, Right, Best) ->
    update_rl(T, Left, Right+1, Best).
update_rl(T, Left, Right, Best) ->
    case Left of
        L when L =:= Right -> pass_rl_rev(T, Left, Right, max(Best, 2*Left));
        _ ->
            case Left > Right of
                true -> pass_rl_rev(T, 0, 0, Best);
                false -> pass_rl_rev(T, Left, Right, Best)
            end
    end.