
struct Edge {
    let node: Int
    let cost: Int
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var graph: [[Edge]] = .init(repeating: [], count: n + 1)

for _ in 0..<n-1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (firstNode, secondNode, cost) = (input[0], input[1], input[2])
    graph[firstNode].append(Edge(node: secondNode, cost: cost))
    graph[secondNode].append(Edge(node: firstNode, cost: cost))
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (start, end) = (input[0], input[1])
    var visited: [Bool] = .init(repeating: false, count: n + 1)
    
//    dfs(start: start, end: end, cost: 0)
//    
//    func dfs(start: Int, end: Int, cost: Int) {
//        visited[start] = true
//        
//        if start == end {
//            print(cost)
//            return
//        }
//        
//        for nextEdge in graph[start] {
//            if !visited[nextEdge.node] {
//                dfs(start: nextEdge.node, end: end, cost: nextEdge.cost + cost)
//            }
//        }
//    }
    
    bfs(start: start, end: end)
    
    func bfs(start: Int, end: Int) {
        var queue: [Edge] = [Edge(node: start, cost: 0)]
        var index: Int = 0
        visited[start] = true
        
        while index < queue.count {
            let now = queue[index]
            
            for nextEdge in graph[now.node] {
                if !visited[nextEdge.node] {
                    visited[nextEdge.node] = true
                    queue.append(Edge(node: nextEdge.node, cost: now.cost + nextEdge.cost))
                    
                    if nextEdge.node == end {
                        print(now.cost + nextEdge.cost)
                        return
                    }
                }
            }
            
            index += 1
        }
    }
}

