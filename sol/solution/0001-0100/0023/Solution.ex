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
    @spec merge_k_lists(lists :: [ListNode.t | nil]) :: ListNode.t | nil
    def merge_k_lists([]), do: nil
    def merge_k_lists([nil]), do: nil
    def merge_k_lists(lists) do
        lists
        |> Enum.reject(&is_nil/1)
        |> merge_k_lists_helper()
    end
    defp merge_k_lists_helper([]), do: nil
    defp merge_k_lists_helper([node]), do: node
    defp merge_k_lists_helper(lists) do
        mid = div(length(lists), 2)
        left = Enum.take(lists, mid)
        right = Enum.drop(lists, mid)
        merge_two_lists(merge_k_lists_helper(left), merge_k_lists_helper(right))
    end
    defp merge_two_lists(nil, l2), do: l2
    defp merge_two_lists(l1, nil), do: l1
    defp merge_two_lists(%ListNode{val: v1, next: n1} = l1, %ListNode{val: v2, next: n2} = l2) do
        if v1 < v2 do
            %ListNode{val: v1, next: merge_two_lists(n1, l2)}
        else
            %ListNode{val: v2, next: merge_two_lists(l1, n2)}
        end
    end
end