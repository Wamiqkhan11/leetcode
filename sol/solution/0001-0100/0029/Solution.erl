-spec divide(integer(), integer()) -> integer().
divide(Dividend, Divisor) ->
    IntMax = (1 bsl 31) - 1,
    IntMin = -(1 bsl 31),
    case {Dividend, Divisor} of
        {IntMin, -1} -> IntMax;
        {IntMin, 1} -> IntMin;
        _ ->
            A = abs(Dividend),
            B = abs(Divisor),
            Res = divide_loop(A, B, 0),
            if (Dividend > 0) xor (Divisor > 0) -> -Res;
               true -> Res
            end
    end.
divide_loop(A, B, Res) when A < B -> Res;
divide_loop(A, B, Res) ->
    {Temp, Multiple} = double_loop(B, A, B, 1),
    divide_loop(A - Temp, B, Res + Multiple).

double_loop(Temp, A, TempAcc, Multiple) ->
    case (TempAcc bsl 1) =< A of
        true -> double_loop(Temp, A, TempAcc bsl 1, Multiple bsl 1);
        false -> {TempAcc, Multiple}
    end.