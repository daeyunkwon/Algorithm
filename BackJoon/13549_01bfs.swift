
struct Deque<T> {
    private var front: [T] = []
    private var back: [T] = []
    
    var isEmpty: Bool {
        front.isEmpty && back.isEmpty
    }
    
    mutating func insertFront(_ element: T) {
        front.append(element)
    }
    
    mutating func insertBack(_ element: T) {
        back.append(element)
    }
    
    mutating func popFront() -> T? {
        guard !isEmpty else { return nil }
        if front.isEmpty {
            front = back.reversed()
            back.removeAll()
        }
        return front.popLast()
    }
    
    mutating func popBack() -> T? {
        guard !isEmpty else { return nil }
        if back.isEmpty {
            back = front.reversed()
            front.removeAll()
        }
        return back.popLast()
    }
}

struct Edge: Comparable {
    let node: Int
    let cost: Int
    
    static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.cost < rhs.cost
    }
}

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var visited: [Bool] = .init(repeating: false, count: 100000+1)
var deque: Deque<Edge> = .init()

func bfs(start: Int) {
    deque.insertBack(Edge(node: n, cost: 0))
    visited[start] = true
    
    while !deque.isEmpty {
        let now = deque.popFront()!
        
        if now.node == k {
            print(now.cost)
            break
        }
        
        let nexts: [Edge] = [
            Edge(node: now.node * 2, cost: 0),
            Edge(node: now.node - 1, cost: 1),
            Edge(node: now.node + 1, cost: 1)
        ]
        
        for nextEdge in nexts {
            guard (0...100000) ~= nextEdge.node else { continue }
            if !visited[nextEdge.node] {
                visited[nextEdge.node] = true
                if nextEdge.cost == 0 {
                    deque.insertFront(Edge(node: nextEdge.node, cost: now.cost + nextEdge.cost))
                } else {
                    deque.insertBack(Edge(node: nextEdge.node, cost: now.cost + nextEdge.cost))
                }
            }
        }
    }
}

bfs(start: n)
