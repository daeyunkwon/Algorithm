
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

struct Node: Comparable {
    let x: Int
    let y: Int
    let cost: Int
    
    static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.cost < rhs.cost
    }
}

let n = Int(readLine()!)!
var graph: [[Node]] = .init(repeating: [], count: n)
var distance: [[Int]] = .init(repeating: Array(repeating: Int.max, count: n), count: n)

for i in 0..<n {
    let arr = readLine()!.map { Int(String($0))! }
    for j in 0..<arr.count {
        var cost: Int
        if arr[j] == 0 { // 검은방이면 비용 1로 지정
            cost = 1
        } else { // 흰방이면 비용 0으로 지정
            cost = 0
        }
        let node = Node(x: j, y: i, cost: cost)
        graph[i].append(node)
    }
}

var heap: Heap<Node> = .init()
heap.insert(Node(x: 0, y: 0, cost: 0))
distance[0][0] = 0

while !heap.isEmpty { // 다익스트라를 통해 흰방을 먼저 지나가되, 어쩔 수 없는 경우에만 검은방을 지나간다.
    let now = heap.delete()!
    
    if distance[now.y][now.x] < now.cost { continue }
    
    // 상하좌우
    let dx = [now.x, now.x, now.x - 1, now.x + 1]
    let dy = [now.y - 1, now.y + 1, now.y, now.y]
    
    var nexts: [Node] = []
    for i in 0...3 {
        if dx[i] < 0 || dy[i] < 0 || dx[i] >= n || dy[i] >= n { continue } // 유효 범위 아닌 경우 체크
        nexts.append(graph[dy[i]][dx[i]])
    }
    
    for next in nexts {
        let newCost = now.cost + next.cost
        if newCost < distance[next.y][next.x] {
            heap.insert(Node(x: next.x, y: next.y, cost: newCost))
            distance[next.y][next.x] = newCost
        }
    }
}

print(distance[n-1][n-1]) // 검은방의 cost를 1로 했었는데, 이를 검은방을 지나간 횟수로 활용 가능
