import UIKit

var greeting = "Hello, playground"
 
// FIFO - First In First out.

struct Queue<T> {
    var storage = [T]()
    
    mutating func enqueue(_ element: T) {
        storage.append(element)
    }
    
    mutating func dequeue() -> T? {
        storage.isEmpty ? nil: storage.removeFirst()
    }
}

var queue = Queue<Int>()
queue.enqueue(10)
queue.enqueue(11)
queue.enqueue(100)

dump(queue)

queue.dequeue()

dump(queue)
