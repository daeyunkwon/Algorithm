

let n = Int(readLine()!)!
var parent: [Int] = .init(repeating: 0, count: n + 1)
var graph: [[Int]] = .init(repeating: [], count: n + 1)

for _ in 0..<n-1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (nodeA, nodeB) = (input[0], input[1])
    graph[nodeA].append(nodeB)
    graph[nodeB].append(nodeA)
}

dfs(1, 0)

func dfs(_ node: Int, _ parentNode: Int) {
    parent[node] = parentNode
    for next in graph[node] {
        if next != parentNode {
            dfs(next, node)
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
    var visited: Set<Int> = .init()
    var a = nodeA
    while a != 0 {
        visited.insert(a)
        a = parent[a]
    }
    
    var b = nodeB
    while b != 0 {
        if visited.contains(b) {
            print(b)
            return
        }
        b = parent[b]
    }
}
