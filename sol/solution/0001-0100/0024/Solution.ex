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
  @spec swap_pairs(head :: ListNode.t() | nil) :: ListNode.t() | nil
  def swap_pairs(nil), do: nil
  def swap_pairs(%ListNode{next: nil} = head), do: head
  def swap_pairs(%ListNode{val: v1, next: %ListNode{val: v2, next: rest}}) do
    swapped_rest = swap_pairs(rest)
    %ListNode{val: v2, next: %ListNode{val: v1, next: swapped_rest}}
  end
end