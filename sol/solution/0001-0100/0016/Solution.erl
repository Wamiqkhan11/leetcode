-spec three_sum_closest(Nums :: [integer()], Target :: integer()) -> integer().
three_sum_closest(Nums, Target) ->
    % I -> nums = [-1,2,1,-4], target = 1
    % O -> 2 (-1 + 2 + 1 = 2)
    Sorted = lists:sort(Nums),
    Array = array:from_list(Sorted),
    % [-4,-1,1,2]
    {_, Res} =
        array:foldl(fun (_I, V, {V, _} = Acc) ->
                            % skip duplicate value (vs prev)
                            Acc;
                        (I, V, {_, Prev}) ->
                            % 2 pointer movement
                            P1 = I + 1,
                            P2 = array:size(Array) - 1,
                            ClosestSum = find(Target, V, P1, P2, Array, Prev),
                            {V, closest(ClosestSum, Prev, Target)}
                    end,
                    {undefined, undefined},
                    Array),
    Res.
% returns closest sum to target for current E
find(_Target, _E, P1, P2, _Array, Res) when P1 >= P2 ->
    % finished traversing for E
    Res;
find(Target, E, P1, P2, Array, PrevSum) when P1 < P2 ->
    E1 = array:get(P1, Array),
    E2 = array:get(P2, Array),
    Sum = E + E1 + E2,
    % return triplet or move pointers
    case Sum of
        _ when Sum == Target ->
            % get the next pointers that skip past duplicates
            Next_P1 = pointer(P1, 1, array:size(Array) - 1, Array, E1),
            Next_P2 = pointer(P2, -1, P1, Array, E2),
            % return closest sum
            find(Target, E, Next_P1, Next_P2, Array, closest(Sum, PrevSum, Target));
        _ when Sum < Target ->
            find(Target, E, P1 + 1, P2, Array, closest(Sum, PrevSum, Target));
        _ when Sum > Target ->
            find(Target, E, P1, P2 - 1, Array, closest(Sum, PrevSum, Target))
    end.
closest(Sum, undefined, _Target) ->
    Sum;
closest(Sum, PrevSum, Target) ->
    A = abs(Target - Sum),
    B = abs(Target - PrevSum),
    R = min(A, B),
    case R of
        X when X == A ->
            Sum;
        Y when Y == B ->
            PrevSum
    end.
pointer(P, 1 = Amnt, Lim, Array, Prev) ->
    V = array:get(P, Array),
    case V of
        _ when V == Prev, P < Lim ->
            pointer(P + Amnt, Amnt, Lim, Array, Prev);
        _ ->
            P
    end;
pointer(P, -1 = Amnt, Lim, Array, Prev) ->
    V = array:get(P, Array),
    case V of
        _ when V == Prev, P > Lim ->
            pointer(P + Amnt, Amnt, Lim, Array, Prev);
        _ ->
            P
    end.