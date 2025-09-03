-spec search_insert([integer()], integer()) -> integer().
search_insert(Nums, Target) ->
    search(Nums, Target, 0, length(Nums) - 1).
search(Nums, Target, Left, Right) when Left =< Right ->
    Mid = (Left + Right) div 2,
    Val = lists:nth(Mid + 1, Nums),
    case Val of
        Target -> Mid;
        _ when Val < Target -> search(Nums, Target, Mid + 1, Right);
        _ -> search(Nums, Target, Left, Mid - 1)
    end;
search(_, _, Left, _) ->
    Left.