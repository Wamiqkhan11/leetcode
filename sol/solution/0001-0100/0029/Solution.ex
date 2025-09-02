defmodule Solution do
  @spec divide(integer, integer) :: integer
  def divide(dividend, divisor) do
    int_max = 2_147_483_647
    int_min = -2_147_483_648
    cond do
      dividend == int_min and divisor == -1 -> int_max
      dividend == int_min and divisor == 1 -> int_min
      true ->
        a = abs(dividend)
        b = abs(divisor)
        res = loop(a, b, 0)
        if (dividend > 0) != (divisor > 0), do: -res, else: res
    end
  end
  defp loop(a, b, res) when a < b, do: res
  defp loop(a, b, res) do
    {temp, multiple} = double_loop(b, a, b, 1)
    loop(a - temp, b, res + multiple)
  end
  defp double_loop(_b, a, temp, multiple) when temp * 2 > a, do: {temp, multiple}
  defp double_loop(b, a, temp, multiple), do: double_loop(b, a, temp * 2, multiple * 2)
end