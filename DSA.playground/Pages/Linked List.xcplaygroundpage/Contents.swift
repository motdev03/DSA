import UIKit

var greeting = "Hello, playground"

// Linked List - each item in a linked list is called a node.

class Node<Value> {
    var value: Value
    var next: Node? // the last node will not have any next node.
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}


extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> " + String(describing: next) + " "
    }
}

let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3

print(node1)

struct LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    
    init() {
        
    }
    
    var isEmpty: Bool { head == nil }
    
    // MARK: Push
    /// Linked list push happends to the head.
    /// A pushed element replaced the existing head.
    /// If tail is nil, implies currently there are no elements in the LL, so head and tail are the same.
    mutating func push(value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    // MARK: Append
    /// Append will update the tail.
    mutating func append(value: Value) {
        let tailNode = Node(value: value, next: nil)
        tail?.next = tailNode
        tail = tailNode
        if head == nil {
            head = tail
        }
    }
    
    mutating func getNode(at index: Int) -> Node<Value>? {
        var currentIndex = 0
        var currentNode = head
        while currentNode != nil, currentIndex <= index {
            if index == currentIndex {
                return currentNode
            } else {
                currentIndex += 1
                currentNode = currentNode?.next
            }
        }
        return nil
    }
 
    mutating func insert(value: Value, index: Int) {
        let newNode = Node(value: value, next: nil)

        guard index != 0 else {
            newNode.next = head
            head = newNode
            return
        }
        if let nodeBefore = getNode(at: index - 1) {
            newNode.next = nodeBefore.next
            nodeBefore.next = newNode
        }
    }
    
    mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    mutating func removeLast() -> Value? {
        guard head?.next != nil else {
            return pop()
        }
        var current = head
        var previous = head
        while let next = current?.next {
            previous = current
            current = next
        }
        tail = previous
        previous?.next = nil
        return current?.value
    }
    
    mutating func remove(nodeAt index: Int) {
        guard index != 0 else {
            head = head?.next
            return
        }
        let node = getNode(at: index - 1)
        if node?.next === tail {
            tail = node
        }
        node?.next = node?.next?.next
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return head.description
    }
}

print("testing remove(nodeAt \n")
var removeLinkedList = LinkedList<Int>()
removeLinkedList.push(value: 2)
removeLinkedList.push(value: 3)
removeLinkedList.push(value: 22)
removeLinkedList.push(value: 33)
print(removeLinkedList)
removeLinkedList.remove(nodeAt: 0)
print(removeLinkedList)

var linkedList = LinkedList<Int>()
linkedList.push(value: 2) // headNode, tailNode -> value: 2, next: nil = firstNode
linkedList.push(value: 3) // headNode -> value 3, next: firstNode = secondNode
linkedList.push(value: 22) // headNode -> value: 22, next: secondNode = thirdNode
linkedList.push(value: 33) // headNode -> value: 33, next: thirdNode = fourthNode
print(linkedList)
print("testing removeLast \n")
linkedList.removeLast()
linkedList.removeLast()
print(linkedList)
linkedList.removeLast()
print(linkedList)
linkedList.removeLast()
print(linkedList)
linkedList.removeLast()
print(linkedList)

var appendLinkedList = LinkedList<Int>()
appendLinkedList.append(value: 2)
appendLinkedList.append(value: 3)
appendLinkedList.append(value: 22)
appendLinkedList.append(value: 33)
appendLinkedList.insert(value: 11, index: 2)
print("testing append, insert and pop \n")
print(appendLinkedList)
appendLinkedList.insert(value: 44, index: 5)
print(appendLinkedList)
appendLinkedList.insert(value: 1, index: 0)
print(appendLinkedList)
appendLinkedList.insert(value: 100, index: 100)
print(appendLinkedList)
appendLinkedList.insert(value: 100, index: -1)
print(appendLinkedList)
print(appendLinkedList.pop())






