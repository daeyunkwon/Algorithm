

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }
let start = input[0]
let end = input[1]
var graph: [[Int]] = .init(repeating: [], count: n + 1)
for _ in 0..<Int(readLine()!)! {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    graph[xy[0]].append(xy[1])
    graph[xy[1]].append(xy[0])
}


var visited: [Bool] = .init(repeating: false, count: n + 1)

func bfs(node: Int) -> Int {
    var queue: [(Int, Int)] = [(node, 0)]
    var index = 0
    visited[node] = true
    
    while queue.count > index {
        let currentNode = queue[index].0
        let depth = queue[index].1
        
        if currentNode == end {
            return depth
        }
        
        for nextNode in graph[currentNode] {
            if !visited[nextNode] {
                visited[nextNode] = true
                queue.append((nextNode, depth + 1))
            }
        }
        
        index += 1
    }
    
    
    return -1
}

print(bfs(node: start))
