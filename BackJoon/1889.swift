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
var graph: [[Int]] = .init(repeating: [], count: n+1)
var inDegree: [Int] = .init(repeating: 0, count: n+1)
for i in 1...n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (firstGiftTarget, secondGiftTarget) = (input[0], input[1])
    graph[i].append(firstGiftTarget)
    graph[i].append(secondGiftTarget)
    inDegree[firstGiftTarget] += 1
    inDegree[secondGiftTarget] += 1
}

var queue = Queue()

for i in 1...n {
    if inDegree[i] < 2 {
        queue.enqueue(i) // 큐에는 참여 불가능한 학생들을 담는다.
    }
}

while !queue.isEmpty {
    let now = queue.dequeue()!
    for next in graph[now] {
        inDegree[next] -= 1
        if inDegree[next] == 1 {
            queue.enqueue(next)
        }
    }
}

var answer: [Int] = []
for i in 1...n {
    if inDegree[i] == 2 {
        answer.append(i) // 진입차수가 2인 경우는 선물을 2개 받은 학생으로 참여가 가능하다.
    }
}

print(answer.count)
print(answer.map { String($0) }.joined(separator: " "))
