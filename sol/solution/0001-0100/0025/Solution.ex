# Definition for singly-linked list.
#
# defmodule ListNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           next: ListNode.t() | nil
#         }
#   defstruct val: 0, next: nil
# end
defmodule Solution do
  @spec reverse_k_group(head :: ListNode.t | nil, k :: integer) :: ListNode.t | nil
  def reverse_k_group(head, k) when k <= 1 or head == nil, do: head
  def reverse_k_group(head, k) do
    {nodes, rest, count} = take_nodes(head, k, [], 0)
    if count < k do
      head
    else
      rest_rev = reverse_k_group(rest, k)
      build_reversed(nodes, rest_rev)
    end
  end
  defp take_nodes(node, 0, acc, count), do: {Enum.reverse(acc), node, count}
  defp take_nodes(nil, _k, acc, count), do: {Enum.reverse(acc), nil, count}
  defp take_nodes(%ListNode{} = node, k, acc, count) do
    take_nodes(node.next, k - 1, [node | acc], count + 1)
  end
  defp build_reversed([], acc), do: acc
  defp build_reversed([%ListNode{val: v} | t], acc) do
    build_reversed(t, %ListNode{val: v, next: acc})
  end
end