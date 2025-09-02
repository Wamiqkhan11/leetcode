// Definition for singly-linked list.
// #[derive(PartialEq, Eq, Clone, Debug)]
// pub struct ListNode {
//   pub val: i32,
//   pub next: Option<Box<ListNode>>
// }
// 
// impl ListNode {
//   #[inline]
//   fn new(val: i32) -> Self {
//     ListNode {
//       next: None,
//       val
//     }
//   }
// }
use crate::list_node::ListNode;
impl Solution {
    pub fn remove_nth_from_end(head: Option<Box<ListNode>>, n: i32) -> Option<Box<ListNode>> {
        let mut dummy = Box::new(ListNode { val: 0, next: head });
        let mut len = 0;
        {
            let mut p = dummy.next.as_ref();
            while let Some(node) = p {
                len += 1;
                p = node.next.as_ref();
            }
        }
        let mut cur = &mut dummy;
        for _ in 0..(len - n) {
            cur = cur.next.as_mut().unwrap();
        }
        let next = cur.next.as_mut().and_then(|node| node.next.take());
        cur.next = next;
        dummy.next
    }
}
impl __serializer__::Serialize for ListNode {
    fn serialize(&self) -> String {
        let mut res = Vec::new();
        let mut node = Some(self);
        while let Some(n) = node {
            res.push(n.val.to_string());
            node = n.next.as_deref();
        }
        format!("[{}]", res.join(","))
    }
}