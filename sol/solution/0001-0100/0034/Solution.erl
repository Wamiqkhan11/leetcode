-spec search_range([integer()], integer()) -> [integer()].
search_range(Nums, Target) ->
    {L, R} = {find_bound(Nums, Target, true), find_bound(Nums, Target, false)},
    [L, R].
find_bound(Nums, Target, First) ->
    loop(Nums, Target, 0, length(Nums)-1, -1, First).
loop(Nums, Target, L, R, Ans, First) when L =< R ->
    Mid = (L + R) div 2,
    Val = lists:nth(Mid+1, Nums),
    if Val =:= Target ->
            if First -> loop(Nums, Target, L, Mid-1, Mid, First);
               true -> loop(Nums, Target, Mid+1, R, Mid, First)
            end;
       Val < Target -> loop(Nums, Target, Mid+1, R, Ans, First);
       true -> loop(Nums, Target, L, Mid-1, Ans, First)
    end;
loop(_, _, _, _, Ans, _) -> Ans.