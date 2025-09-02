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
     * @param Integer $k
     * @return ListNode
     */
    function reverseKGroup($head, $k) {
        $curr = $head;
        $count = 0;
        while ($curr !== null && $count < $k) {
            $curr = $curr->next;
            $count++;
        }
        if ($count === $k) {
            $reversedHead = $this->reverseLinkedList($head, $k);
            // Recursively process the remaining list
            $head->next = $this->reverseKGroup($curr, $k);
            return $reversedHead;
        }
        return $head;
    }
    /**
     * Reverses a linked list of size k and returns the new head.
     * @param ListNode $head
     * @param Integer $k
     * @return ListNode
     */
    private function reverseLinkedList($head, $k) {
        $prev = null;
        $curr = $head;
        while ($k > 0) {
            $next = $curr->next;
            $curr->next = $prev;
            $prev = $curr;
            $curr = $next;
            $k--;
        }
        return $prev;
    }
}