

struct Queue {
    private var elements: [Int] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        elements.count
    }
    
    var peekFirst: Int? {
        elements.first
    }
    
    var peekLast: Int? {
        elements.last
    }
    
    mutating func enqueue(_ value: Int) {
        elements.append(value)
    }
    
    mutating func dequeue() -> Int? {
        return isEmpty ? nil : elements.removeFirst()
    }
}

var queue = Queue()
let n = Int(readLine()!)!

for _ in 1...n {
    let command = readLine()!.split(separator: " ").map { String($0) }
    
    switch command[0] {
    case "push":
        queue.enqueue(Int(command[1])!)
        
    case "pop":
        if let value = queue.dequeue() {
            print(value)
        } else {
            print(-1)
        }
        
    case "size":
        print(queue.count)
        
    case "empty":
        queue.isEmpty ? print(1) : print(0)
        
    case "front":
        if let value = queue.peekFirst {
            print(value)
        } else {
            print(-1)
        }
        
    case "back":
        if let value = queue.peekLast {
            print(value)
        } else {
            print(-1)
        }
        
    default: break
    }
}
