-spec four_sum(Nums :: [integer()], Target :: integer()) -> [[integer()]].
four_sum(Nums, Target) ->
    case length(Nums) < 4 of
        true -> [];
        false ->
            SortedNums = lists:sort(Nums),
            Array = array:from_list(SortedNums),
            N = length(SortedNums),
            four_sum_helper(Array, N, Target, 0, [])
    end.
four_sum_helper(Array, N, Target, I, Result) when I >= N - 3 -> Result;
four_sum_helper(Array, N, Target, I, Result) ->
    case I > 0 andalso array:get(I, Array) =:= array:get(I-1, Array) of
        true -> 
            four_sum_helper(Array, N, Target, I+1, Result);
        false ->
            NewResult = three_sum_helper(Array, N, Target, I, I+1, Result),
            four_sum_helper(Array, N, Target, I+1, NewResult)
    end.
three_sum_helper(Array, N, Target, I, J, Result) when J >= N - 2 -> Result;
three_sum_helper(Array, N, Target, I, J, Result) ->
    case J > I + 1 andalso array:get(J, Array) =:= array:get(J-1, Array) of
        true ->
            three_sum_helper(Array, N, Target, I, J+1, Result);
        false ->
            NewResult = two_pointer_helper(Array, N, Target, I, J, J+1, N-1, Result),
            three_sum_helper(Array, N, Target, I, J+1, NewResult)
    end.
two_pointer_helper(Array, _N, _Target, _I, _J, Left, Right, Result) when Left >= Right -> Result;
two_pointer_helper(Array, N, Target, I, J, Left, Right, Result) ->
    Sum = array:get(I, Array) + array:get(J, Array) + 
          array:get(Left, Array) + array:get(Right, Array),
    case Sum of
        Target ->
            Quadruplet = [array:get(I, Array), array:get(J, Array), 
                         array:get(Left, Array), array:get(Right, Array)],
            NewLeft = skip_duplicates_left(Array, Left, Right),
            NewRight = skip_duplicates_right(Array, Left, Right),
            two_pointer_helper(Array, N, Target, I, J, NewLeft, NewRight, [Quadruplet | Result]);
        Sum when Sum < Target ->
            two_pointer_helper(Array, N, Target, I, J, Left+1, Right, Result);
        _ ->
            two_pointer_helper(Array, N, Target, I, J, Left, Right-1, Result)
    end.
skip_duplicates_left(Array, Left, Right) ->
    skip_duplicates_left(Array, Left, Right, Left+1).
skip_duplicates_left(Array, Left, Right, NewLeft) when NewLeft < Right ->
    case array:get(NewLeft, Array) =:= array:get(Left, Array) of
        true -> skip_duplicates_left(Array, Left, Right, NewLeft+1);
        false -> NewLeft
    end;
skip_duplicates_left(_Array, _Left, Right, NewLeft) when NewLeft >= Right -> NewLeft.
skip_duplicates_right(Array, Left, Right) ->
    skip_duplicates_right(Array, Left, Right, Right-1).
skip_duplicates_right(Array, Left, Right, NewRight) when NewRight > Left ->
    case array:get(NewRight, Array) =:= array:get(Right, Array) of
        true -> skip_duplicates_right(Array, Left, Right, NewRight-1);
        false -> NewRight
    end;
skip_duplicates_right(_Array, Left, _Right, NewRight) when NewRight =< Left -> NewRight.
