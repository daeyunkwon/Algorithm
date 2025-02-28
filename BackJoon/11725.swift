

let n = Int(readLine()!)!
var graph: [[Int]] = .init(repeating: [], count: n+1)

for _ in 1...n-1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0]
    let b = input[1]
    graph[a].append(b)
    graph[b].append(a)
}

var visited: [Bool] = .init(repeating: false, count: n+1)
var answer: [Int] = .init(repeating: 0, count: n+1)

func dfs(_ node: Int) {
    visited[node] = true
    
    for nextNode in graph[node] {
        if nextNode == 1 {
            let curRootNode = answer[node]
            answer[node] = 1
            answer[curRootNode] = node
        }
        
        if !visited[nextNode] {
            if answer[nextNode] != 1 { answer[nextNode] = node }
            answer[nextNode] = node
            dfs(nextNode)
        }
    }
}

for i in 1...n {
    if !visited[i] {
        dfs(i)
    }
}

for i in 2...n {
    print(answer[i])
}
