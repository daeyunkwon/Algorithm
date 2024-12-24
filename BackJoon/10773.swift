


struct Stack {
    private var elements: [Int] = []
    private var sum = 0
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var peek: Int? {
        return elements.last
    }
    
    mutating func push(_ value: Int) {
        elements.append(value)
        self.sum += value
    }
    
    mutating func pop() {
        if let last = elements.popLast() {
            self.sum -= last
        }
    }
    
    func getSumValue() -> Int {
        return sum
    }
}

let k = Int(readLine()!)!
var stack = Stack()

for _ in 1...k {
    let input = Int(readLine()!)!
    
    if input == 0 {
        stack.pop()
    } else {
        stack.push(input)
    }
}

print(stack.getSumValue())
