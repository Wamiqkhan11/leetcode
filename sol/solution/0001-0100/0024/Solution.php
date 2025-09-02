/**
 * Definition for a singly-linked list.
 * class ListNode {
 *     public $val = 0;
 *     public $next = null;
 *     function __construct($val = 0, $next = null) {
 *         $this->val = $val;
 *         $this->next = $next;
 *     }
 * }
 */
class Solution {
    /**
     * @param ListNode $head
     * @return ListNode
     */
    function swapPairs($head) {
        if (!$head || !$head->next) return $head;
        $dummy = new ListNode(0, $head);
        $prev = $dummy;
        while ($prev->next && $prev->next->next) {
            $first = $prev->next;
            $second = $first->next;
            $first->next = $second->next;
            $second->next = $first;
            $prev->next = $second;
            $prev = $first;
        }
        return $dummy->next;
    }
}