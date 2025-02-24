


let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
let v = input[2]

var graph: [[Int]] = .init(repeating: [], count: n+1)
var visited: [Bool] = .init(repeating: false, count: n+1)
var visited2: [Bool] = .init(repeating: false, count: n+1)

for _ in 1...m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0]
    let b = input[1]
    graph[a].append(b)
    graph[b].append(a)
}

for i in 1...n {
    graph[i].sort()
}

var answer1: [Int] = []
func dfs(node: Int) {
    visited[node] = true
    answer1.append(node)
    
    for nextNode in graph[node] {
        if !visited[nextNode] {
            dfs(node: nextNode)
        }
    }
}

var answer2: [Int] = []
func bfs(node: Int) {
    visited2[node] = true
    var queue: [Int] = [node]
    var index = 0
    
    while queue.count > index {
        let cur = queue[index]
        answer2.append(cur)
        for nextNode in graph[cur] {
            if !visited2[nextNode] {
                visited2[nextNode] = true
                queue.append(nextNode)
            }
        }
        
        index += 1
    }
}

dfs(node: v)
bfs(node: v)


print(answer1.map{String($0)}.joined(separator: " "))
print(answer2.map{String($0)}.joined(separator: " "))
