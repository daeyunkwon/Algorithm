

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var graph: [[Int]] = .init(repeating: [], count: n+1)
var inDegree: [Int] = Array(repeating: 0, count: n+1)

struct Queue {
    private var elements: [Int] = []
    private var index = 0
    
    var isEmpty: Bool {
        index < elements.count ? false : true
    }
    
    mutating func enqueue(_ element: Int) {
        elements.append(element)
    }
    
    mutating func dequeue() -> Int? {
        if isEmpty { return nil }
        defer {
            index += 1
        }
        return elements[index]
    }
}

var queue: Queue = Queue()

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let frontEdge = input[0]
    let nextEdge = input[1]
    graph[frontEdge].append(nextEdge)
    inDegree[nextEdge] += 1
}

for i in 1...n {
    if inDegree[i] == 0 {
        queue.enqueue(i)
    }
}

var answer: [Int] = []

while !queue.isEmpty {
    let item = queue.dequeue()!
    answer.append(item)
    for next in graph[item] {
        inDegree[next] -= 1
        if inDegree[next] == 0 {
            queue.enqueue(next)
        }
    }
}

print(answer.map { String($0) }.joined(separator: " "))





