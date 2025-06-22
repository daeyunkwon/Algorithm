
let firstInput = readLine()!.split(separator: " ").map { Int($0)! }
let (n, s, d) = (firstInput[0], firstInput[1], firstInput[2]) // 개수, 위치, 힘

var graph: [[Int]] = .init(repeating: [], count: n + 1)
var visited: [Bool] = .init(repeating: false, count: n + 1)
var answer: Int = 0

for _ in 1..<n {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    let (x, y) = (xy[0], xy[1])
    graph[x].append(y)
    graph[y].append(x)
}

func dfs(node: Int) -> Int {
    visited[node] = true
    var maxDepth: Int = 0
    
    for next in graph[node] {
        if visited[next] { continue }
        
        let childDepth = dfs(node: next) + 1 // 1은 현재 노드 위치를 포함하여 깊이를 계산하기 위해
        
        if childDepth > d { // 힘으로 전단지를 돌릴 수 없어, 오토바이로 노드 이동 필요
            answer += 2 // 왕복
        }
        
        maxDepth = max(maxDepth, childDepth) // 현재 노드에서 가장 깊은 노드까지의 거리를 구하기 위해 
    }
    
    return maxDepth
}

_ = dfs(node: s)
print(answer)
