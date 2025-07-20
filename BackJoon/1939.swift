
struct Edge: Comparable {
    let node: Int
    let cost: Int
    
    static func <(lhs: Self, rhs: Self) -> Bool {
        lhs.cost < rhs.cost
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var graph: [[Edge]] = .init(repeating: [], count: n + 1)
var maxWeight: Int = 0

for _ in 1...m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c) = (input[0], input[1], input[2])
    let edgeA = Edge(node: b, cost: c)
    let edgeB = Edge(node: a, cost: c)
    graph[a].append(edgeA)
    graph[b].append(edgeB)
    maxWeight = max(maxWeight, c) // 최대 중량값 기억해두기
}

let se = readLine()!.split(separator: " ").map { Int($0)! }
let (start, end) = (se[0], se[1])

func bfs(_ weight: Int) -> Bool {
    var visited: [Bool] = .init(repeating: false, count: n + 1)
    visited[start] = true
    var queue: [Int] = [start]
    var index: Int = 0
    
    while index < queue.count {
        let now = queue[index]
        
        if now == end { // 허용되는 중량이라면 목적지에 도착 가능한 것
            return true
        }
        
        for next in graph[now] {
            if !visited[next.node] && next.cost >= weight {
                queue.append(next.node)
                visited[next.node] = true
            }
        }
        
        index += 1
    }
    
    return false // 해당 중량값으로 목적지에 도착할 수 없는 경우
}

// 가능한 최대 중량 값을 이분탐색으로 찾기
var left = 1
var right = maxWeight
var answer = 0

while left <= right {
    let mid = (left + right) / 2
    
    if bfs(mid) {
        // 해당 중량값을 bfs를 돌렸는데 목적지에 도착할 수 있는 경우
        answer = mid
        left = mid + 1
    } else {
        // 해당 중량값을 bfs를 돌렸는데 목적지에 도착할 수 없는 경우
        right = mid - 1
    }
}

print(answer) // 목적지에 도착할 수 있되, 최대 중량값
