
struct Edge: Comparable {
    let node: Int
    let cost: Int
    
    static func <(lhs: Self, rhs: Self) -> Bool {
        return lhs.cost < rhs.cost
    }
}

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
        if isEmpty { return nil }
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

let nmkx = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k, x) = (nmkx[0], nmkx[1], nmkx[2], nmkx[3])
var adjList: [[Edge]] = .init(repeating: [], count: n+1)
var distance: [Int] = .init(repeating: Int.max, count: n+1) // 출발지는 0, 모든 노드는 출발지로부터 최소 비용 거리가 저장될 예정
var heap: Heap<Edge> = .init()

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (input[0], input[1])
    adjList[a].append(Edge(node: b, cost: 1)) // 모든 간선 비용은 1
}

distance[x] = 0 // 출발지 거리 0으로 설정
heap.insert(Edge(node: x, cost: 0)) // 출발지를 x로 설정, 비용은 0

while !heap.isEmpty {
    let now = heap.delete()!
    
    if now.cost > distance[now.node] { continue } // 현재 heap에서 꺼낸 경로가 이미 기록된 최소 비용보다 더 비싸면 생략
    
    for nextEdge in adjList[now.node] {
        let nextNode = nextEdge.node
        let newCost = now.cost + nextEdge.cost
        
        if newCost < distance[nextNode] { // 더 짧은 경로를 찾은 경우
            distance[nextNode] = newCost
            heap.insert(Edge(node: nextNode, cost: newCost))
        }
    }
}

var answer: [Int] = []
for i in 1...n {
    if distance[i] == k {
        answer.append(i)
    }
}

if answer.isEmpty {
    print(-1)
} else {
    answer.forEach { print($0) }
}
