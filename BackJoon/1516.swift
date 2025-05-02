
struct Queue {
    private(set) var elements: [Int] = []
    private var index = 0
    
    var isEmpty: Bool {
        index >= elements.count ? true : false
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


let n = Int(readLine()!)!
var buildTime: [Int] = Array(repeating: 0, count: n+1)
var graph: [[Int]] = Array(repeating: [], count: n+1)
var inDegree: [Int] = Array(repeating: 0, count: n+1)
var dp: [Int] = Array(repeating: 0, count: n+1)

for i in 1...n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    for j in 0..<input.count {
        if j == 0 {
            buildTime[i] = input[j]
            continue
        }
        
        if input[j] == -1 {
            break
        }
        
        graph[input[j]].append(i)
        inDegree[i] += 1
    }
}

var queue: Queue = .init()

for i in 1...n {
    if inDegree[i] == 0 {
        queue.enqueue(i)
        dp[i] = buildTime[i]
    }
}

while !queue.isEmpty {
    let buildingNum = queue.dequeue()!
    for next in graph[buildingNum] {
        inDegree[next] -= 1
        dp[next] = max(dp[next], dp[buildingNum] + buildTime[next])
//        dp[next] = dp[buildingNum] + buildTime[next]
        if inDegree[next] == 0 {
            queue.enqueue(next)
        }
    }
}

dp.filter { $0 != 0 }.forEach {
    print($0)
}
