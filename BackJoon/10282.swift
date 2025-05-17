
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

struct Edge: Comparable {
    let node: Int
    let cost: Int
    
    static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.cost < rhs.cost
    }
}

let tc = Int(readLine()!)!
for _ in 0..<tc {
    
    let ndc = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, d, c) = (ndc[0], ndc[1], ndc[2])
    var graph: [[Edge]] = .init(repeating: [], count: n + 1)
    var distance: [Int] = .init(repeating: Int.max, count: n + 1)
    
    for _ in 0..<d {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (a, b, s) = (input[0], input[1], input[2])
        graph[b].append(Edge(node: a, cost: s))
    }
    
    var heap: Heap<Edge> = .init()
    heap.insert(Edge(node: c, cost: 0))
    distance[c] = 0
    
    while !heap.isEmpty {
        let now = heap.delete()!
        if distance[now.node] < now.cost { continue }
        for next in graph[now.node] {
            let newCost = next.cost + now.cost
            if newCost < distance[next.node] {
                heap.insert(Edge(node: next.node, cost: newCost))
                distance[next.node] = newCost
            }
        }
    }
    
    let answer: [Int] = distance.filter {
        if $0 != Int.max {
            return true
        }
        return false
    }
    
    print(answer.count, answer.max()!)
}
