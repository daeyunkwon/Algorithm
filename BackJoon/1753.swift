
struct Edge: Comparable {
    let node: Int // 도착지의 노드
    let cost: Int // 간선의 가중치
    
    static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.cost < rhs.cost
    }
}

struct Heap<T: Comparable> {
    private var elements: [T?] = [nil]
    private var size: Int = 0
    
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


let ve = readLine()!.split(separator: " ").map { Int($0)! }
let (v, e) = (ve[0], ve[1])
let startNode = Int(readLine()!)!
var adjList: [[Edge]] = .init(repeating: [], count: v+1)
var distance: [Int] = .init(repeating: Int.max, count: v+1)
for _ in 0..<e {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (firstNode, connectedNode, cost) = (input[0], input[1], input[2])
    adjList[firstNode].append(Edge(node: connectedNode, cost: cost))
}

var heap: Heap<Edge> = .init()
distance[startNode] = 0
heap.insert(Edge(node: startNode, cost: 0))

while !heap.isEmpty {
    let now = heap.delete()!
    
    if distance[now.node] < now.cost { continue } // 이미 더 짧은 가중치의 경로가 발견된 경우
    
    for nextEdge in adjList[now.node] {
        let newCost = now.cost + nextEdge.cost
        if newCost < distance[nextEdge.node] {
            distance[nextEdge.node] = newCost
            heap.insert(Edge(node: nextEdge.node, cost: newCost))
        }
    }
}

distance[1...v].forEach {
    if $0 == Int.max {
        print("INF")
    } else {
        print($0)
    }
}
