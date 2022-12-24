import UIKit

var greeting = "Hello, playground"

// Recursion - A function calling itself. Anything that can be done with recursion can be done with while loops as well.
// But recursion reduces the number of line. But there is no performance gain. Infact while loops could be slighlty better in performance.

// Factorial of a number using recursion.
func factorial(of number: Int) -> Int {
    if number == 0 { // This is the base case of the recursion.
        return 1
    }
    
    return number * factorial(of: number - 1) // This is the recursive case of the recursion.
}

print(factorial(of: 5))

// Power using recursion
func getPower(_ power: Int, of number: Int) -> Int {
    if power == 1 { // This is the base case of the recursion.
        return number
    }
    return number * getPower((power - 1), of: number) // This is the recursive case of the recursion.
}

print(getPower(4, of: 2))


// Complexity

// Constant Time - print the first element of an array
// Linear Time - print every element of an array.
// Quadratic Time - with very little change in data time increases considerably.
func print(names: [String]) {
    for _ in names {
        names.forEach({
            print($0)
        })
    }
}
// Logartmic Time - Binary Search. As the data grows time flattens out.
// Qusilinear Time - Sort functions in swift.
//                   Not better than logartmic, but better than Quadratic as time flattens out after a particular level of data is reached.

