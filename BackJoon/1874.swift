


struct Stack<T> {
    private var elements: [T] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var peek: T? {
        return elements.last
    }
    
    var count: Int {
        return elements.count
    }
    
    mutating func push(_ value: T) {
        elements.append(value)
    }
    
    mutating func pop() -> T? {
        return elements.popLast()
    }
}

var stack = Stack<Int>()
var answer: [String] = []
var current: Int = 0

for _ in 0..<Int(readLine()!)! {
    
    let num = Int(readLine()!)!
    
    while current < num {
        current += 1
        stack.push(current)
        answer.append("+")
    }
    
    if stack.peek! == num {
        stack.pop()
        answer.append("-")
    } else {
        answer = ["NO"]
        break
    }
}

print(answer.joined(separator: "\n"))
