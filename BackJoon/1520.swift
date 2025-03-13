
let mn = readLine()!.split(separator: " ").map { Int($0)! }
let m = mn[0] // 세로
let n = mn[1] // 가로

var graph: [[Int]] = .init(repeating: [], count: m)
for i in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    graph[i] = input
}

var dp: [[Int]] = .init(repeating: Array(repeating: -1, count: n), count: m)

var answer = 0
func dfs(_ x: Int, _ y: Int, _ height: Int) -> Int {
    if x < 0 || y < 0 || x >= n || y >= m || height <= graph[y][x] {
        return 0
    }
    
    if x == n - 1 && y == m - 1 {
        return 1
    }
    
    let currentHeight = graph[y][x]
    
    if dp[y][x] == -1 {
        dp[y][x] = 0
        dp[y][x] += dfs(x - 1, y, currentHeight)
        dp[y][x] += dfs(x + 1, y, currentHeight)
        dp[y][x] += dfs(x, y - 1, currentHeight)
        dp[y][x] += dfs(x, y + 1, currentHeight)
    }
    
    return dp[y][x]
}

let value = dfs(0, 0, Int.max)
print(value)
