


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

for _ in 0..<Int(readLine()!)! {
    let command = readLine()!.split(separator: " ").map { String($0) }
    
    switch command[0] {
    case "push": 
        stack.push(Int(command[1])!)
    
    case "pop":
        if let value = stack.pop() {
            print(value)
        } else {
            print(-1)
        }
    
    case "size":
        print(stack.count)
        
    case "empty":
        stack.isEmpty ? print(1) : print(0)
        
    case "top":
        if let value = stack.peek {
            print(value)
        } else {
            print(-1)
        }
    default: break
    }
}
