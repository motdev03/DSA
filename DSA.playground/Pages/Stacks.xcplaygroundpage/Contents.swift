import UIKit

var greeting = "Hello, playground"


// STACKS - LIFO -> Last In First Out

struct Stack<Element> {
    private var storage: [Element] = []
    
    mutating func push(element: Element) -> Self {
        storage.append(element)
        return self
    }
    
    mutating func pop() -> Self {
        storage.popLast()
        return self
    }
    
}

extension Stack: CustomStringConvertible {
    var description: String {
        let elements = storage.map({ "\($0)" }).reversed().joined(separator: "\n")
        return "-------Top-------\n" + elements + "\n--------Bottom--------"
    }
}

var stack = Stack<Int>()
stack.push(element: 99)
stack.push(element: 10)
stack.push(element: 11)
stack.push(element: 14)

print(stack)

stack.pop()
stack.pop()

print(stack)
