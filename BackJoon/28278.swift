
import Foundation

struct Stack<T> {
    private var elements: [T] = []
    init() {}
    
    mutating func push(_ element: T) {
        self.elements.append(element)
    }
    
    mutating func pop() -> T? {
        self.elements.popLast()
    }
    
    func peek() -> T? {
        self.elements.last
    }
    
    var isEmpty: Bool {
        self.elements.isEmpty
    }
    
    var count: Int {
        self.elements.count
    }
}

extension Stack: CustomStringConvertible {
  var description: String {
    elements.description
  }
}


var stack = Stack<Int>()

let n = Int(readLine()!)!

for _ in 0..<n {
    let command = readLine()!.split(separator: " ").map { Int($0)! }
    switch command[0] {
    case 1:
        stack.push(command[1])
    case 2:
        if stack.isEmpty {
            print(-1)
        } else {
            print(stack.pop()!)
        }
    case 3:
        print(stack.count)
    case 4:
        stack.isEmpty ? print(1) : print(0)
    case 5:
        if let element = stack.peek() {
            print(element)
        } else {
            print(-1)
        }
    default: break
    }
}
