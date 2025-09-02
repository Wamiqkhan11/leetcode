/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public int val;
 *     public ListNode next;
 *     public ListNode(int val=0, ListNode next=null) {
 *         this.val = val;
 *         this.next = next;
 *     }
 * }
 */
public class Solution {
    public ListNode MergeTwoLists(ListNode list1, ListNode list2) {
        if (list1 == null) return list2;
        if (list2 == null) return list1;

        if (list1.val < list2.val) {
            list1.next = MergeTwoLists(list1.next, list2);
            return list1;
        } else {
            list2.next = MergeTwoLists(list1, list2.next);
            return list2;
        }
    }
    public ListNode MergeKLists(ListNode[] lists) {
        if (lists.Length == 0) return null;
        if (lists.Length == 1) return lists[0];
        return Recursive(0, lists.Length - 1);
        ListNode Recursive(int a, int b) {
            if (a == b) return lists[a];
            var mid = a + (b - a) / 2;
            var list1 = Recursive(a, mid);
            var list2 = Recursive(mid + 1, b);
            return MergeTwoLists(list1, list2);
        }
    }
}