-spec str_str(Haystack :: unicode:unicode_binary(),
              Needle   :: unicode:unicode_binary()) -> integer().
str_str(Haystack, Needle) ->
    case Needle of
        <<>> -> 0;
        _ ->
            case binary:match(Haystack, Needle) of
                nomatch -> -1;
                {Pos, _Len} -> Pos
            end
    end.