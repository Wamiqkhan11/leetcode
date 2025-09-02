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
use std::cmp::Ordering;
use std::collections::BinaryHeap;
#[derive(PartialEq, Eq)]
struct MinHeapNode {
    val: i32,
    node: Option<Box<ListNode>>,
}
impl PartialOrd for MinHeapNode {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        other.val.partial_cmp(&self.val)
    }
}
impl Ord for MinHeapNode {
    fn cmp(&self, other: &Self) -> Ordering {
        other.val.cmp(&self.val)
    }
}
impl Solution {
    pub fn merge_k_lists(lists: Vec<Option<Box<ListNode>>>) -> Option<Box<ListNode>> {
        let mut heap = BinaryHeap::new();
        for list in lists {
            if let Some(node) = list {
                heap.push(MinHeapNode {
                    val: node.val,
                    node: Some(node),
                });
            }
        }
        let mut dummy = Box::new(ListNode::new(0));
        let mut tail = &mut dummy.next;
        while let Some(MinHeapNode { node, .. }) = heap.pop() {
            if let Some(mut n) = node {
                *tail = Some(n.clone());
                tail = &mut tail.as_mut().unwrap().next;
                if let Some(next_node) = n.next.take() {
                    heap.push(MinHeapNode {
                        val: next_node.val,
                        node: Some(next_node),
                    });
                }
            }
        }
        dummy.next
    }
}