

struct Queue {
    private var elements: [(Int, Int)] = []
    private var front = 0
    
    var isEmpty: Bool {
        return elements.count - 1 < front
    }
    
    var count: Int {
        return elements.count - front
    }
    
    var peek: (Int, Int)? {
        isEmpty ? nil : elements[front]
    }
    
    var max: Int? {
        let slicedArray = elements[front...]
        let value = slicedArray.max { first, second in
            first.1 < second.1
        }
        return value?.1
    }
    
    func isMax(_ value: (Int, Int)) -> Bool {
        value.1 == max
    }
    
    mutating func enqueue(_ value: (Int, Int)) {
        elements.append(value)
    }
    
    mutating func dequeue() -> (Int, Int)? {
        if !isEmpty {
            defer { front += 1 }
            return elements[front]
        } else {
            return nil
        }
    }
    
    mutating func setup(arr: [(Int, Int)]) {
        elements = arr
    }
    
    mutating func sort() {
        elements.sort(by: >)
    }
}

for _ in 1...Int(readLine()!)! {
    
    let nm = readLine()!.split(separator: " ").map { Int($0)! }, n = nm[0], m = nm[1]
    
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    var queue = Queue()
    var answer = 0
    var count = 0
    let targetIndex = m
    
    for value in input.enumerated() {
        queue.enqueue(value)
    }
    
    while !queue.isEmpty {
        let item = queue.peek!
        
        if queue.isMax(item) {
            let item = queue.dequeue()!
            count += 1
            
            if item.0 == targetIndex {
                answer = count
            }
        } else {
            queue.enqueue(queue.dequeue()!)
        }
    }
    
    print(answer)
}
