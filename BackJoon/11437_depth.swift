

let n = Int(readLine()!)!
var parent: [Int] = .init(repeating: 0, count: n + 1)
var graph: [[Int]] = .init(repeating: [], count: n + 1)
var depth: [Int] = .init(repeating: 0, count: n + 1)

for _ in 0..<n-1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (nodeA, nodeB) = (input[0], input[1])
    graph[nodeA].append(nodeB)
    graph[nodeB].append(nodeA)
}

dfs(1, 0, 0)

func dfs(_ node: Int, _ parentNode: Int, _ nodeDepth: Int) {
    parent[node] = parentNode
    depth[node] = nodeDepth
    for next in graph[node] {
        if next != parentNode {
            dfs(next, node, nodeDepth + 1)
        }
    }
}

let m = Int(readLine()!)!
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (firstNode, secondNode) = (input[0], input[1])
    findLCA(firstNode, secondNode)
}

func findLCA(_ nodeA: Int, _ nodeB: Int) {
    var a = nodeA
    var b = nodeB
    
    while depth[a] != depth[b] { // 깊이 맞추기
        if depth[a] > depth[b] {
            a = parent[a]
        } else {
            b = parent[b]
        }
    }
    
    while a != b { // 동시에 1단계씩 부모 노드로 올라가기
        a = parent[a]
        b = parent[b]
    }
    
    print(a)
}
