-spec search([integer()], integer()) -> integer().
search(Nums, Target) ->
    search(Nums, Target, 0, length(Nums) - 1).
search(Nums, Target, L, R) when L =< R ->
    Mid = (L + R) div 2,
    Val = lists:nth(Mid+1, Nums),
    LVal = lists:nth(L+1, Nums),
    RVal = lists:nth(R+1, Nums),
    if Val =:= Target -> Mid;
       LVal =< Val ->
           if LVal =< Target, Target < Val ->
                  search(Nums, Target, L, Mid - 1);
              true -> search(Nums, Target, Mid + 1, R)
           end;
       true ->
           if Val < Target, Target =< RVal ->
                  search(Nums, Target, Mid + 1, R);
              true -> search(Nums, Target, L, Mid - 1)
           end
    end;
search(_, _, _, _) -> -1.