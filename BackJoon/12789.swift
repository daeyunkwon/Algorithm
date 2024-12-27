

struct Stack {
    private var elements: [Int] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var peek: Int? {
        return elements.last
    }
    
    var count: Int {
        return elements.count
    }
    
    mutating func push(_ value: Int) {
        self.elements.append(value)
    }
    
    mutating func pop() {
        self.elements.popLast()
    }
    
    func check() {
        print(String(describing: elements))
    }
}


let n = Int(readLine()!)!

let numtag = readLine()!.split(separator: " ").map { Int($0)! }

var stack = Stack()

var next = 1

for item in numtag {
    
    if item == next {
        next += 1
    } else {
        stack.push(item)
    }
    
    while !stack.isEmpty && stack.peek! == next {
        stack.pop()
        next += 1
    }
}

let answer = stack.isEmpty ? "Nice" : "Sad"
print(answer)
