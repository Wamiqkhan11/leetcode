/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var heap = Heap<ListNode>(priorityFunction: { $0.val < $1.val })
        for list in lists {
            if let node = list {
                heap.insert(node)
            }
        }
        let dummy = ListNode(0)
        var tail = dummy
        while let node = heap.remove() {
            tail.next = node
            tail = tail.next!
            if let nextNode = node.next {
                heap.insert(nextNode)
            }
        }
        return dummy.next
    }
}
struct Heap<T> {
    private var elements: [T] = []
    private let priorityFunction: (T, T) -> Bool
    init(elements: [T] = [], priorityFunction: @escaping (T, T) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        buildHeap()
    }
    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }
    func peek() -> T? { elements.first }
    mutating func insert(_ element: T) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }
    mutating func remove() -> T? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let element = elements.removeLast()
        siftDown(from: 0)
        return element
    }
    private mutating func buildHeap() {
        for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
            siftDown(from: i)
        }
    }
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(of: child)
        while child > 0 && priorityFunction(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(of: child)
        }
    }
    private mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(of: parent)
            let right = rightChildIndex(of: parent)
            var candidate = parent
            if left < elements.count && priorityFunction(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < elements.count && priorityFunction(elements[right], elements[candidate]) {
                candidate = right
            }
            if candidate == parent { return }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    private func parentIndex(of index: Int) -> Int { (index - 1) / 2 }
    private func leftChildIndex(of index: Int) -> Int { 2 * index + 1 }
    private func rightChildIndex(of index: Int) -> Int { 2 * index + 2 }
}