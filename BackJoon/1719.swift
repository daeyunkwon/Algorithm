
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
    let node: Int
    let cost: Int
    
    static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.cost < rhs.cost
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var graph: [[Edge]] = .init(repeating: [], count: n + 1)
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (start, end, cost) = (input[0], input[1], input[2])
    graph[start].append(Edge(node: end, cost: cost))
    graph[end].append(Edge(node: start, cost: cost))
}

func dijkstra(start: Int) -> [Int] {
    var heap: Heap<Edge> = .init()
    var distance: [Int] = .init(repeating: Int.max, count: n + 1)
    heap.insert(Edge(node: start, cost: 0))
    distance[start] = 0
    var previousNode: [Int] = .init(repeating: 0, count: n + 1)
    
    while !heap.isEmpty {
        let now = heap.delete()!
        if distance[now.node] < now.cost { continue }
        
        for next in graph[now.node] {
            let newCost = now.cost + next.cost
            
            if newCost < distance[next.node] {
                heap.insert(Edge(node: next.node, cost: newCost))
                distance[next.node] = newCost
                previousNode[next.node] = now.node
            }
        }
    }
    
    var firstMove: [Int] = .init(repeating: 0, count: n + 1)
    
    for i in 1...n {
        if i == start { continue }
        var prev = i
        while previousNode[prev] != start {
            prev = previousNode[prev]
        }
        firstMove[i] = prev
    }
    
    return firstMove
}

var answer: [[String]] = .init(repeating: Array(repeating: "0", count: n + 1), count: n + 1)

for i in 1...n {
    let arr = dijkstra(start: i)
    for j in 1...n {
        if i == j {
            answer[i][j] = "-"
        } else {
            answer[i][j] = String(arr[j])
        }
    }
}

for i in 1...n {
    let result = answer[i][1...n].joined(separator: " ")
    print(result)
}
