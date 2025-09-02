// Definition for singly-linked list.
// #[derive(PartialEq, Eq, Clone, Debug)]
// pub struct ListNode {
//   pub val: i32,
//   pub next: Option<Box<ListNode>>
// }
// impl ListNode {
//   #[inline]
//   fn new(val: i32) -> Self {
//     ListNode {
//       next: None,
//       val
//     }
//   }
// }
impl Solution {
    pub fn reverse_k_group(head: Option<Box<ListNode>>, k: i32) -> Option<Box<ListNode>> {
        let k_usize = k as usize;
        let mut count = 0;
        let mut ptr = &head;
        while let Some(node) = ptr {
            count += 1;
            if count == k_usize { break; }
            ptr = &node.next;
        }
        if count < k_usize {
            return head;
        }
        let (mut reversed_head, remainder) = Self::reverse_linked_list(head, k_usize);
        if let Some(ref mut node) = reversed_head {
            let mut tail = node.as_mut();
            while let Some(ref mut next_node) = tail.next {
                tail = next_node.as_mut();
            }
            tail.next = Self::reverse_k_group(remainder, k);
        }
        reversed_head
    }
    fn reverse_linked_list(mut head: Option<Box<ListNode>>, k: usize) -> (Option<Box<ListNode>>, Option<Box<ListNode>>) {
        let mut prev: Option<Box<ListNode>> = None;
        let mut curr = head.take();
        let mut remaining_k = k;
        while remaining_k > 0 {
            if let Some(mut node) = curr {
                let next = node.next.take();
                node.next = prev;
                prev = Some(node);
                curr = next;
                remaining_k -= 1;
            } else {
                break;
            }
        }
        (prev, curr)
    }
}