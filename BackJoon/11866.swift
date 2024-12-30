
struct Queue {
    private var elements: [Int] = []
    private var front: Int = 0
    
    init(N: Int) {
        for n in 1...N {
            self.enqueue(n)
        }
    }
    
    var isEmpty: Bool {
        return elements.count-1 < front
    }
    
    var count: Int {
        return elements.count - front
    }
    
    var peek: Int? {
        front < elements.count ? elements[front] : nil
    }
    
    mutating func enqueue(_ value: Int) {
        self.elements.append(value)
    }
    
    mutating func dequeue() -> Int? {
        if isEmpty {
            return nil
        } else {
            defer { front += 1 }
            return elements[front]
        }
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }, n = input[0], k = input[1]
var result: [Int] = []
var queue = Queue(N: n)

while !queue.isEmpty {
    for i in 1...k {
        if i == k {
            let item = queue.dequeue()!
            result.append(item)
            continue
        }
        let item = queue.dequeue()!
        queue.enqueue(item)
    }
}

print("<\(result.map{String($0)}.joined(separator: ", "))>")


