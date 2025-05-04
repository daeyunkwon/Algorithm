
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

let n = Int(readLine()!)!
var graph: [[Int]] = Array(repeating: [], count: n+1)
var inDegree: [Int] = Array(repeating: 0, count: n+1)
var time: [Int] = Array(repeating: 0, count: n+1)

for i in 1...n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let workNum = i
    let workTime = input[0]
    let nextWorkCount = input[1]
    
    time[workNum] = workTime
    for j in 0..<nextWorkCount {
        let nextWorkNum = input[j + 2]
        graph[workNum].append(nextWorkNum)
        inDegree[nextWorkNum] += 1
    }
}

var queue: Queue = Queue()
var dp: [Int] = Array(repeating: 0, count: n+1)

for i in 1...n {
    if inDegree[i] == 0 {
        queue.enqueue(i)
        dp[i] = time[i]
    }
}

while !queue.isEmpty {
    let pop = queue.dequeue()!
    for next in graph[pop] {
        inDegree[next] -= 1
        dp[next] = max(dp[next], time[next]+dp[pop])
        if inDegree[next] == 0 {
            queue.enqueue(next)
        }
    }
}

print(dp.max()!)
