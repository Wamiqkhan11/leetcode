defmodule Solution do
    @spec find_substring(s :: String.t(), words :: [String.t()]) :: [integer]
    def find_substring(s, words) do
        if words == [] do
            []
        else
            word_len = String.length(hd(words))
            word_count = length(words)
            total_len = word_len * word_count
            n = String.length(s)
            word_map = Enum.frequencies(words)
            s_chars = String.to_charlist(s)
            for i <- 0..(word_len - 1), reduce: [] do
                acc ->
                    sliding_window(s_chars, i, word_len, word_count, total_len, n, word_map, acc)
            end
            |> Enum.sort()
        end
    end
    defp sliding_window(s_chars, start, word_len, word_count, total_len, n, word_map, acc) do
        window_map = %{}
        count = 0
        left = start
        do_slide(s_chars, start, left, count, window_map, word_len, word_count, total_len, n, word_map, acc)
    end
    defp do_slide(s_chars, i, left, count, window_map, word_len, word_count, total_len, n, word_map, acc) do
        if i + word_len <= n do
            word = s_chars |> Enum.slice(i, word_len) |> to_string()
            if Map.has_key?(word_map, word) do
                window_map = Map.update(window_map, word, 1, &(&1 + 1))
                count = count + 1
                {left, count, window_map, acc} =
                    shrink_window(s_chars, left, i, word, window_map, count, word_len, word_map, acc)
                acc =
                    if count == word_count do
                        [left | acc]
                    else
                        acc
                    end
                do_slide(s_chars, i + word_len, left, count, window_map, word_len, word_count, total_len, n, word_map, acc)
            else
                do_slide(s_chars, i + word_len, i + word_len, 0, %{}, word_len, word_count, total_len, n, word_map, acc)
            end
        else
            acc
        end
    end
    defp shrink_window(s_chars, left, i, word, window_map, count, word_len, word_map, acc) do
        if window_map[word] > word_map[word] do
            left_word = s_chars |> Enum.slice(left, word_len) |> to_string()
            window_map = Map.update!(window_map, left_word, &(&1 - 1))
            count = count - 1
            shrink_window(s_chars, left + word_len, i, word, window_map, count, word_len, word_map, acc)
        else
            {left, count, window_map, acc}
        end
    end
end