

struct Queue {
    private var elements: [Int] = []
    private var front = 0
    
    init(n: Int) {
        elements = Array(1...n)
    }
    
    var isEmpty: Bool {
        return elements.count - 1 < front
    }
    
    var peek: Int? {
        if isEmpty {
            return nil
        } else {
            return elements[front]
        }
    }
    
    var count: Int {
        return elements.count - front
    }
    
    mutating func enqueue(_ value: Int) {
        elements.append(value)
    }
    
    mutating func dequeue() -> Int? {
        if !isEmpty {
            defer { front += 1 }
            return elements[front]
        } else {
            return nil
        }
    }
}


let nk = readLine()!.split(separator: " ").map { Int($0)! }
var queue = Queue(n: nk[0])
var answer: [Int] = []

while !queue.isEmpty {
    for i in 1...nk[1] {
        let value = queue.dequeue()!
        
        if i == nk[1] {
            answer.append(value)
        } else {
            queue.enqueue(value)
        }
    }
}

let result = answer.map { String($0) }.joined(separator: ", ")
print("<\(result)>")
