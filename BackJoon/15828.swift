

struct Queue {
    private var elements: [Int] = []
    private var front = 0
    
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
    
    func description() {
        if !isEmpty {
            let sliced = elements[front...]
            print(sliced.map { String($0) }.joined(separator: " "))
            return
        }
        
        print("empty")
    }
}

var queue = Queue()
var answer: [Int] = []

let n = Int(readLine()!)!

while true {
    let input = Int(readLine()!)!
    
    if input == -1 {
        break
    }
    
    if input == 0 {
        queue.dequeue()
        continue
    }
    
    queue.enqueue(input)
}

queue.description()
