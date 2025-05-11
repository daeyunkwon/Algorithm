
struct Edge: Comparable {
    let position: Int
    let time: Int
    static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.time < rhs.time
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

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1]) // 수빈과 동생 위치
var distance: [Int] = .init(repeating: Int.max, count: 100000 + 1)
var heap: Heap<Edge> = .init()

heap.insert(Edge(position: n, time: 0))
distance[n] = 0

while !heap.isEmpty {
    let now = heap.delete()!
    
    if distance[now.position] < now.time { continue }
    
    let nexts: [Edge] = [ // 현재 위치와 연결된 다음 좌표들
        Edge(position: now.position + 1, time: 1),
        Edge(position: now.position - 1, time: 1),
        Edge(position: now.position * 2, time: 0)
    ]
    
    for nextEdge in nexts {
        guard (0...100000) ~= nextEdge.position else { continue } // 범위 안의 좌표가 맞는지 유효성 검사
        let newTime = now.time + nextEdge.time
        if newTime < distance[nextEdge.position] {
            distance[nextEdge.position] = newTime
            heap.insert(Edge(position: nextEdge.position, time: newTime))
        }
    }
}

print(distance[k])
