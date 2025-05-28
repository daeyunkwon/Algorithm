
let n = Int(readLine()!)!
var graph = [[Int]](repeating: [], count: n + 1)

for _ in 0..<n - 1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}

let logN = 17  // 2^17 = 131072 > 100000
var depth = [Int](repeating: 0, count: n + 1)
var parent = [[Int]](repeating: [Int](repeating: 0, count: logN + 1), count: n + 1)

func dfs(_ node: Int, _ par: Int) {
    depth[node] = depth[par] + 1
    parent[node][0] = par
    for i in 1...logN {
        parent[node][i] = parent[parent[node][i - 1]][i - 1]
    }
    for next in graph[node] {
        if next != par {
            dfs(next, node)
        }
    }
}

dfs(1, 0)

func lca(_ u: Int, _ v: Int) -> Int {
    var u = u
    var v = v

    if depth[u] < depth[v] {
        swap(&u, &v)
    }

    // 깊이를 맞추기
    for i in stride(from: logN, through: 0, by: -1) {
        if depth[u] - (1 << i) >= depth[v] {
            u = parent[u][i]
        }
    }

    if u == v { return u }

    // 동시에 올라가다가 공통 부모 찾기
    for i in stride(from: logN, through: 0, by: -1) {
        if parent[u][i] != parent[v][i] {
            u = parent[u][i]
            v = parent[v][i]
        }
    }

    return parent[u][0]
}

let m = Int(readLine()!)!
var result = ""
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    result += "\(lca(input[0], input[1]))\n"
}
print(result)
