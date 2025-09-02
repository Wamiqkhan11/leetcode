defmodule Solution do
  @spec is_valid(s :: String.t) :: boolean
  def is_valid(s), do: match_brackets(s, [])
  defp match_brackets(<<?(, rest::binary>>, stack), do: match_brackets(rest, [?( | stack])
  defp match_brackets(<<?[, rest::binary>>, stack), do: match_brackets(rest, [?[ | stack])
  defp match_brackets(<<?{, rest::binary>>, stack), do: match_brackets(rest, [?{ | stack])
  defp match_brackets(<<?), rest::binary>>, [?( | stack]), do: match_brackets(rest, stack)
  defp match_brackets(<<?], rest::binary>>, [?[ | stack]), do: match_brackets(rest, stack)
  defp match_brackets(<<?}, rest::binary>>, [?{ | stack]), do: match_brackets(rest, stack)
  defp match_brackets("", []), do: true
  defp match_brackets(_, _), do: false
end