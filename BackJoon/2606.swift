

let nodeCount = Int(readLine()!)!
let edgeCount = Int(readLine()!)!

var graph: [[Int]] = Array(repeating: [], count: nodeCount + 1)
for _ in 0..<edgeCount {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0]
    let b = input[1]
    graph[a].append(b)
    graph[b].append(a)
}

var visited: [Bool] = .init(repeating: false, count: nodeCount + 1)

/*
 [
    [], : 0번 노드
    [2, 5], : 1번 노드 -> 2번과 5번 노드와 연결됨을 의미
    [3],
    [],
    [7],
    [2, 6],
    [],
    [] : 7번 노드
 ]
*/

var answer = 0

func dfs(startNode: Int) {
    visited[startNode] = true
    
    for nextNode in graph[startNode] {
        if !visited[nextNode] {
            dfs(startNode: nextNode)
            answer += 1
        }
    }
}

func bfs(startNode: Int) {
    var queue: [Int] = []
    var index: Int = 0
    queue.append(startNode)
    visited[startNode] = true
    
    while queue.count > index {
        let currentNode = queue[index]
        for nextNode in graph[currentNode] {
            if !visited[nextNode] {
                visited[nextNode] = true
                queue.append(nextNode)
                answer += 1
            }
        }
        index += 1
    }
}

bfs(startNode: 1)
print(answer)
