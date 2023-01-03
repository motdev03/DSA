//: [Previous](@previous)

import Foundation

// Trees can represent hierarchical data, allowing managing sorted data and fast look ups.
// Trees contain many different node.
// Different kind of nodes:
// 1. Parent node - can have multiple child nodes.
// 2. Root node - no parent node. The first node.
// 3. Leaf node - has no child.

// Example
/*
                   Beverages  -------> Root node
                  /         \
                 /           \
                hot         cold  ------> Parent/Child nodes.
               /   \       /    \
              /     \     /      \
            tea  coffee soda    milk  -------> Leaf node
 */

class TreeNode<T> {
    var value: T
    var children: [TreeNode] = []
    
    init(_ value: T) {
        self.value = value
    }
    
    func add(_ child: TreeNode) {
        self.children.append(child)
    }
}

/*
 Depth First Traversal - Depth-first search (DFS) is an algorithm for traversing or searching tree or graph data structures. The algorithm starts at the root node (selecting some arbitrary node as the root node in the case of a graph) and explores as far as possible along each branch before backtracking.
 */

extension TreeNode {
    func forEachDepthFirst(_ visit: (TreeNode) -> ()) {
        visit(self)
        children.forEach({
            $0.forEachDepthFirst(visit)
        })
    }
}

let beverages = TreeNode<String>("Beverages")

let hot = TreeNode<String>("Hot")
let cold = TreeNode<String>("Cold")

beverages.add(hot)
beverages.add(cold)

let tea = TreeNode<String>("Tea")
let coffee = TreeNode<String>("Coffee")
hot.add(tea)
hot.add(coffee)

let soda = TreeNode<String>("Soda")
let milk = TreeNode<String>("Milk")
cold.add(soda)
cold.add(milk)

print("\n ----------- Depth First Traversal ---------- \n")

beverages.forEachDepthFirst {
    print($0.value)
}

/*
 Level Order Traversal - A Level Order Traversal is a traversal which always traverses based on the level of the tree. So, this traversal first traverses the nodes corresponding to Level 0, and then Level 1, and so on, from the root node.
 */
struct Queue<Element> {
    var elements = [Element]()
    
    @discardableResult
    mutating func enqueue(_ element: Element) -> Element {
        elements.append(element)
        return element
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        elements.isEmpty ? nil: elements.removeFirst()
    }
}

extension TreeNode {
    func forEachLevelOrder(_ visit: (TreeNode) -> ()) {
        visit(self)
        var queue = Queue<TreeNode>()
        self.children.forEach({
            queue.enqueue($0)
        })
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach({
                queue.enqueue($0)
            })
        }
    }
}

print("\n ----------- Level Order Traversal ---------- \n")
beverages.forEachLevelOrder({
    print($0.value)
})




