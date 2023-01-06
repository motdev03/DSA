//: [Previous](@previous)

import Foundation

/*
 Binary Trees - Each node can have atmost 2 childs. A left child and right child. Please note it is atmost 2 childs, so 0 or 1 child can also happen.
 Uses - Binary search tree
             10
           /    \
          9      2
         / \    / \
        1   3  4   6
 */

class BinaryNode<Element> {
    var value: Element
    var leftChild, rightChild: BinaryNode?
    
    init(_ value: Element) {
        self.value = value
    }
}

let ten = BinaryNode(10)
let nine = BinaryNode(9)
let two = BinaryNode(2)
let one = BinaryNode(1)
let three = BinaryNode(3)
let four = BinaryNode(4)
let six = BinaryNode(6)

ten.leftChild = nine
ten.rightChild = two

nine.leftChild = one
nine.rightChild = three

two.leftChild = four
two.rightChild = six

// MARK: In Order Traversal

extension BinaryNode {
    func traverseInOrder(visit: (Element) -> ()) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
}

ten.traverseInOrder(visit: {
    print($0)
})

// MARK: Post Order Traversal

extension BinaryNode {
    func postOrderTraversal(visit: (Element) -> ()) {
        
    }
}
