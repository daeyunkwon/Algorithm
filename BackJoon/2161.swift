

struct Queue {
    private var elements: [Int] = []
    private var front = 0
    
    init(n: Int) {
        elements = Array(1...n)
    }
    
    var isEmpty: Bool {
        elements.count - 1 < front
    }
    
    var count: Int {
        elements.count - front
    }
    
    var peek: Int? {
        !isEmpty ? elements[front] : nil
    }
    
    mutating func enqueue(_ value: Int) {
        elements.append(value)
    }
    
    mutating func dequeue() -> Int? {
        if !isEmpty {
            defer { front += 1 }
            return elements[front]
        }
        return nil
    }
}

var queue = Queue(n: Int(readLine()!)!)
var answer: [Int] = []
var runCount = 1

while !queue.isEmpty {
    if runCount % 2 == 1 {
        let value = queue.dequeue()!
        answer.append(value)
    }
    
    if runCount % 2 == 0 {
        queue.enqueue(queue.dequeue()!)
    }
    
    runCount += 1
}

print(answer.map { String($0) }.joined(separator: " "))
