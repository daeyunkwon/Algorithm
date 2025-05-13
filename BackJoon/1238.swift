
struct Heap<T: Comparable> {
    private var elements: [T?] = [nil]
    private var size = 0
    
    var isEmpty: Bool {
        size == 0 ? true : false
    }
    
    mutating func insert(_ element: T) {
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
    
    mutating func delete() -> T? {
        guard !isEmpty else { return nil }
        let popItem = elements[1]
        elements[1] = elements[size]
        size -= 1
        _ = elements.popLast()
        
        var index = 1
        while index * 2 <= size {
            let lc = index * 2
            let rc = index * 2 + 1
            var child: Int
            if rc <= size && elements[rc]! < elements[lc]! {
                child = rc
            } else {
                child = lc
            }
            if elements[index]! <= elements[child]! { break }
            elements.swapAt(index, child)
            index = child
        }
        return popItem
    }
}

struct Edge: Comparable {
    let destination: Int
    let time: Int
    
    static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.time < rhs.time
    }
}

let nmx = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, x) = (nmx[0], nmx[1], nmx[2])
var distance: [[Int]] = .init(repeating: Array(repeating: Int.max, count: n+1), count: n+1)
var graph: [[Edge]] = .init(repeating: [], count: n+1)
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (start, destination, time) = (input[0], input[1], input[2])
    graph[start].append(Edge(destination: destination, time: time))
}


func dijkstra(start: Int) {
    var heap: Heap<Edge> = .init()
    heap.insert(Edge(destination: start, time: 0))
    distance[start][start] = 0

    while !heap.isEmpty {
        let now = heap.delete()!
        if distance[start][now.destination] < now.time { continue }
        for nextEdge in graph[now.destination] {
            let newTime = nextEdge.time + now.time
            if newTime < distance[start][nextEdge.destination] {
                distance[start][nextEdge.destination] = newTime
                heap.insert(Edge(destination: nextEdge.destination, time: newTime))
            }
        }
    }
}

for i in 1...n { // 모든 마을에 대해서 다익스트라 실행
    dijkstra(start: i)
}

var answer = 0
for i in 1...n {
    let total = distance[i][x] + distance[x][i] // i번 마을사람이 x에서 모임하고 다시 돌아가는 데 걸리는 시간
    answer = max(answer, total)
}

print(answer)
