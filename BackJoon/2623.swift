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
        if isEmpty { return nil}
        defer { index += 1 }
        return elements[index]
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]

var graph: [[Int]] = Array(repeating: [], count: n+1)
var inDegree: [Int] = Array(repeating: 0, count: n+1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    for j in 2...input[0] {
        if input[0] == 1 { break }
        let numberOfSingerOrder = input[j]
        let numberOfOrder = input[j]
        let numberOfPreviousOrder = input[j-1]
        graph[numberOfPreviousOrder].append(numberOfOrder)
        inDegree[numberOfOrder] += 1
    }
}

var queue: Queue = Queue()
for i in 1...n {
    if inDegree[i] == 0 {
        queue.enqueue(i)
    }
}

var answer: [Int] = []
while !queue.isEmpty {
    let pop = queue.dequeue()!
    answer.append(pop)
    for next in graph[pop] {
        inDegree[next] -= 1
        if inDegree[next] == 0 {
            queue.enqueue(next)
        }
    }
}

if answer.count < n { // 전체 순서를 정하는 것이 불가능한 경우 -> 사이클 내에 갇혀서 진입차수가 절대 0이 되지 않아서 큐에 진입되지 않음! -> answer 배열에 원소가 부족하게 됨
    print(0)
} else {
    answer.forEach { print($0) }
}
