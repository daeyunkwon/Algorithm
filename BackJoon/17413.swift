
struct Stack<T> {
    var elements: [T] = []
    
    var isEmpty: Bool {
        elements.isEmpty
    }
    
    mutating func push(_ value: T) {
        elements.append(value)
    }
    
    mutating func pop() -> T? {
        elements.popLast()
    }
}

var stack = Stack<Character>()
var check = Stack<Character>()
let strings = Array(readLine()!)
var answer = ""


for i in 0...strings.count-1 {
    let item = strings[i]
    
    if item == "<" {
        while !stack.isEmpty {
            answer += String(stack.pop()!)
        }
        answer += String(item)
        check.push(item)
        continue
    }
    
    if item == ">" {
        answer += String(item)
        check.pop()
        continue
    }
    
    if !check.isEmpty {
        answer += String(item)
        continue
    }
    
    if item == " " {
        while !stack.isEmpty {
            answer += String(stack.pop()!)
        }
        
        answer += String(item)
        continue
    }
    
    stack.push(item)
    
    if i == strings.count - 1 {
        while !stack.isEmpty {
            answer += String(stack.pop()!)
        }
        break
    }
}


print(answer)
