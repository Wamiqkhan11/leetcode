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
     * @param Integer $n
     * @return ListNode
     */
    function removeNthFromEnd($head, $n) {
        $dummy = new ListNode(0, $head);
        $first = $dummy;
        $second = $dummy;
        for ($i = 0; $i <= $n; $i++) {
            $first = $first->next;
        }
        while ($first !== null) {
            $first = $first->next;
            $second = $second->next;
        }
        $second->next = $second->next->next;
        return $dummy->next;
    }
}