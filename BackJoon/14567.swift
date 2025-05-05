struct Queue {
    private var elements: [Int] = []
    private var index = 0
    
    var isEmpty: Bool {
        index >= elements.count ? true : false
    }
    
    mutating func enqueue(_ element: Int) {
        elements.append(element)
    }
    
    mutating func dequeue() -> Int? {
        if isEmpty { return nil }
        defer { index += 1 }
        return elements[index]
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var inDegree: [Int] = Array(repeating: 0, count: n+1)
var graph: [[Int]] = Array(repeating: [], count: n+1)
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let now = input[0]
    let next = input[1]
    graph[now].append(next)
    inDegree[next] += 1
}

var queue = Queue()
var dp: [Int] = Array(repeating: 0, count: n+1)

for i in 1...n {
    if inDegree[i] == 0 {
        queue.enqueue(i)
        dp[i] = 1
    }
}

while !queue.isEmpty {
    let pop = queue.dequeue()!
    for next in graph[pop] {
        inDegree[next] -= 1
        dp[next] = dp[pop] + 1
        if inDegree[next] == 0 {
            queue.enqueue(next)
        }
    }
}

let answer = dp[1..<dp.count].map { String($0) }.joined(separator: " ")
print(answer)
