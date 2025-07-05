

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph: [[Int]] = .init(repeating: [], count: n + 1)
var visited: [Bool] = .init(repeating: false, count: n + 1)

for i in 1...n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    for (j, value) in input.enumerated() {
        if value == 1 {
            // 양방향 연결
            graph[i].append(j+1)
            graph[j+1].append(i)
        }
    }
}

let travel = readLine()!.split(separator: " ").map { Int($0)! } // 여행할 도시들

func dfs(now: Int) {
    visited[now] = true
    
    for next in graph[now] {
        if !visited[next] {
            dfs(now: next)
        }
    }
}

dfs(now: travel[0])

var answer: String = "YES"
travel.forEach {
    if !visited[$0] { answer = "NO" } // 미방문은 즉 연결되지 않았다는 의미로, 하나라도 연결되지 않았다면 NO 처리
}

print(answer)
