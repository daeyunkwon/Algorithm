struct Heap {
    private var elements: [Int?] = [nil]
    private var size = 0
    
    var isEmpty: Bool {
        size <= 0 ? true : false
    }
    
    mutating func insert(_ element: Int) {
        elements.append(element)
        size += 1
        
        var index = size
        while index > 1 {
            let parent = index / 2
            if elements[parent]! <= elements[index]! { break }
            elements.swapAt(parent, index)
            index = parent
        }
    }
    
    mutating func delete() -> Int? {
        if isEmpty { return nil }
        
        let popItem = elements[1]
        elements[1] = elements[size]
        size -= 1
        _ = elements.popLast()
        
        var index = 1
        while index * 2 <= size {
            let left = index * 2
            let right = index * 2 + 1
            var child: Int
            if right <= size && elements[right]! < elements[left]! {
                child = right
            } else {
                child = left
            }
            if elements[index]! <= elements[child]! { break }
            elements.swapAt(index, child)
            index = child
        }
        
        return popItem
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
var minHeap: Heap = Heap()

var graph: [[Int]] = Array(repeating: [], count: nm[0]+1)
var inDegree: [Int] = Array(repeating: 0, count: nm[0]+1)

for _ in 0..<nm[1] {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let firstEdge = input[0]
    let nextEdge = input[1]
    graph[firstEdge].append(nextEdge)
    inDegree[nextEdge] += 1 // 해당 문제번호에 대해서, 선행으로 풀어야 할 문제 개수를 카운팅
}

for i in 1...nm[0] {
    if inDegree[i] == 0 { // 선행으로 풀어야 할 문제가 없는 경우, 최소힙을 이용해 문제번호가 가장 작은 것을 선별
        minHeap.insert(i)
    }
}

var answer: [Int] = []

while !minHeap.isEmpty {
    let pop = minHeap.delete()! // 먼저 풀어야할 문제 번호가 꺼내진다
    answer.append(pop)
    for next in graph[pop] {
        inDegree[next] -= 1
        if inDegree[next] == 0 { // 선행으로 풀어야 할 문제가 없는 경우
            minHeap.insert(next) // minHeap을 이용해 문제번호가 가장 작은 것을 선별
        }
    }
}

print(
    answer.map { String($0) }.joined(separator: " ")
    )
