

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] // 정점 개수
let m = input[1] // 간선 개수
var answer = 0

var graph: [[Int]] = Array(repeating: [], count: n+1)
// 그래프 형태 (예제입력1)
/* [
 [],    0번 노드
 [2],   1번 노드 -> 2번 노드랑 서로 연결됨 (nextNode: 2)
 [5],   2번 노드 -> 5번 노드랑 서로 연결됨 (nextNode: 5)
 [4],   3번 노드 -> 4번 노드랑 서로 연결됨 (nextNode: 4)
 [6],   4번 노드 -> 6번 노드랑 서로 연결됨 (nextNode: 6)
 [1],   5번 노드 -> 1번 노드랑 서로 연결됨 (nextNode: 1)
 []     6번 노드 (nextNode: 없음)
]
*/

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
//    graph[input[0]].append(input[1])
    let u = input[0], v = input[1]
    graph[u].append(v)
    graph[v].append(u)
}

var visited: [Bool] = .init(repeating: false, count: n+1)

func dfs(node: Int) {
    visited[node] = true
    
    for nextNode in graph[node] {
        if !visited[nextNode] { // 미방문일 경우
            visited[nextNode] = true
            dfs(node: nextNode) // dfs 수행
        }
    }
}

// 1번 노드부터 dfs 수행 시작
for i in 1...n {
    if !visited[i] {
        answer += 1
        dfs(node: i)
    }
}

print(answer)
