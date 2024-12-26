
struct Stack {
    private var elements: [String] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var peek: String {
        return self.isEmpty ? "" : elements.last!
    }
    
    mutating func push(_ value: String) {
        self.elements.append(value)
    }
    
    mutating func pop() {
        self.elements.popLast()
    }
    
    mutating func reset() {
        self.elements = []
    }
}

var stack = Stack()

while let input = readLine(), input != "." {
    for s in input {
        if s == ")" {
            stack.peek == "(" ? stack.pop() : stack.push(String(s))
        } else if s == "]"  {
            stack.peek == "[" ? stack.pop() : stack.push(String(s))
        } else if s == "(" || s == "[" {
            stack.push(String(s))
        }
    }
    let answer = stack.isEmpty ? "yes" : "no"
    print(answer)
    stack.reset()
}
