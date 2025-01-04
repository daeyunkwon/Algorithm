

struct Stack<T> {
    var elements: [T] = []
    
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
        elements.popLast()
    }
    
    mutating func clear() {
        elements.removeAll()
    }
}

var stack = Stack<String>()
var temp = Stack<String>()

for _ in 1...Int(readLine()!)! {
    let input = readLine()!.map { String($0) }
    
    for char in input {
        switch char {
        case "<":
            if let value = stack.pop() {
                temp.push(value)
            }
            
        case ">":
            if let value = temp.pop() {
                stack.push(value)
            }
            
        case "-":
            let _ = stack.pop()
            
        default:
            stack.push(char)
        }
    }
    
    while !temp.isEmpty {
        stack.push(temp.pop()!)
    }
    
    print(stack.elements.joined())
    
    stack.clear()
    temp.clear()
}
