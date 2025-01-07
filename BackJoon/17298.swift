
struct Stack<T> {
    private var elements: [T] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var peek: T? {
        return elements.last
    }
    
    mutating func push(_ value: T) {
        elements.append(value)
    }
    
    mutating func pop() -> T? {
        return elements.popLast()
    }
}

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }
var answer = Array(repeating: -1, count: n)
var stack = Stack<Int>()

for i in 0..<n {
    
    while !stack.isEmpty && input[stack.peek!] < input[i] {
        answer[stack.pop()!] = input[i]
    }
    
    stack.push(i)
}

print(answer.map{ String($0) }.joined(separator: " "))



//시간초과

//let n = Int(readLine()!)!
//
//let input = readLine()!.split(separator: " ").map { Int($0)! }
//
//var answer: [String] = []
//
//for i in 0...input.count-2 {
//    var value = input[i]
//    var find = false
//    
//    for j in i+1...input.count-1 {
//        if value < input[j] {
//            value = input[j]
//            find = true
//            break
//        }
//    }
//    
//    if !find {
//        value = -1
//    }
//    
//    answer.append(String(value))
//}
//
//answer.append(String(-1))
//print(answer.joined(separator: " "))
