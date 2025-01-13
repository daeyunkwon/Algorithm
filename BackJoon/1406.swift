

struct Stack {
    var elements: [Character] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    mutating func push(_ value: Character) {
        elements.append(value)
    }
    
    mutating func pop() -> Character? {
        return elements.popLast()
    }
}

var stack = Stack()
var temp = Stack()

let input = Array(readLine()!)
stack.elements = input

let n = Int(readLine()!)!

for _ in 1...n {
    let command = readLine()!
    
    switch command {
    case "L":
        if let value = stack.pop() {
            temp.push(value)
        }
        
    case "D":
        if let value = temp.pop() {
            stack.push(value)
        }
        
    case "B":
        stack.pop()
    default:
        stack.push(command.last!)
    }
}

print(String(stack.elements + temp.elements.reversed()))
