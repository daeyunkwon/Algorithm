
struct Stack<T> {
    private var elements: [T] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var peek: T? {
        return elements.last
    }
    
    mutating func push(_ value: T) {
        self.elements.append(value)
    }
    
    @discardableResult mutating func pop() -> T? {
        return self.elements.popLast()
    }
    
    mutating func reset() {
        self.elements = []
    }
}

let t = Int(readLine()!)!
var stack = Stack<String>()

for _ in 1...t {
    let input = readLine()!.map { String($0) }
    
    for value in input {
        if stack.isEmpty {
            stack.push(value)
        } else {
            if stack.peek! == "(" && value == ")" {
                stack.pop()
            } else {
                stack.push(value)
            }
        }
    }
    
    let result = stack.isEmpty ? "YES" : "NO"
    print(result)
    stack.reset()
}


