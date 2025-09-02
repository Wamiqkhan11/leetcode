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
     * @param ListNode[] $lists
     * @return ListNode
     */
    function mergeKLists($lists){
        $arr=[];foreach($lists as$l)while($l){$arr[]=$l->val;$l=$l->next;}
        sort($arr);$dummy=new ListNode(0);$cur=$dummy;
        foreach($arr as$v){$cur->next=new ListNode($v);$cur=$cur->next;}
        return $dummy->next;
    }
}