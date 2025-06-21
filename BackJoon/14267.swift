

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var graph: [[Int]] = .init(repeating: [], count: n + 1)
var answer: [Int] = .init(repeating: 0, count: n + 1)

let relationship = readLine()!.split(separator: " ").map { Int($0)! }

for i in 0..<relationship.count {
    let boss = relationship[i]
    let staff = i + 1
    
    if boss == -1 { continue }
    
    graph[boss].append(staff)
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (staff, cost) = (input[0], input[1])
    
    // 칭찬 정보는 각 노드에만 저장 (바로 자식에게 퍼뜨리지 않음)
    answer[staff] += cost
}

var visited: [Bool] = .init(repeating: false, count: n + 1)

func dfs(now: Int, visited: inout [Bool], cost: Int) {
    visited[now] = true
    answer[now] += cost
    
    for next in graph[now] {
        if !visited[next] {
            let nextCost = answer[now]
            dfs(now: next, visited: &visited, cost: nextCost)
        }
    }
}

// 루트 노드부터 DFS로 한 번만 탐색하며, 칭찬을 누적해서 자식들에게 전달
dfs(now: 1, visited: &visited, cost: answer[1])


let convertString = answer[1...].map { String($0) }.joined(separator: " ")
print(convertString)
