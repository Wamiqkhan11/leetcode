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
  @spec merge_two_lists(list1 :: ListNode.t | nil, list2 :: ListNode.t | nil) :: ListNode.t | nil
  def merge_two_lists(nil, list2), do: list2
  def merge_two_lists(list1, nil), do: list1
  def merge_two_lists(%{val: v1, next: n1} = list1, %{val: v2, next: n2} = list2) do
    if v1 <= v2 do
      %ListNode{val: v1, next: merge_two_lists(n1, list2)}
    else
      %ListNode{val: v2, next: merge_two_lists(list1, n2)}
    end
  end
end