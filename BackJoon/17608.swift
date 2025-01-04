

struct Stack<Int> {
    private var elements: [Int] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var peek: Int? {
        return elements.last
    }
    
    mutating func push(_ value: Int) {
        elements.append(value)
    }
    
    mutating func pop() -> Int? {
        elements.popLast()
    }
}

var stack = Stack<Int>()
var answer = 1
var point = 0

for _ in 0..<Int(readLine()!)! {
    let input = Int(readLine()!)!
    stack.push(input)
}

point = stack.peek!

while !stack.isEmpty {
    let value = stack.pop()!
    if value > point {
        answer += 1
        point = value
    }
}

print(answer)

