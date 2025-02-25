

let n = Int(readLine()!)!
var square: [[Int]] = []
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n + 1), count: n + 1)
for _ in 1...n {
    square.append(readLine()!.map{ Int(String($0))!})
}

var count = 0
func dfs(_ x: Int, _ y: Int) {
    visited[x][y] = true
    count += 1
    
    for i in 0...3 { // 위, 아래, 왼쪽, 오른쪽 탐색
        let nx = x + dx[i]
        let ny = y + dy[i]
        if nx >= 0 && nx < n && ny >= 0 && ny < n {
            if !visited[nx][ny] && square[nx][ny] == 1 {
                dfs(nx, ny)
            }
        }
    }
}

var answer: [Int] = []
for y in 0...n-1 {
    for x in 0...n-1 {
        if !visited[x][y] && square[x][y] == 1 {
            count = 0
            dfs(x, y)
            answer.append(count)
        }
    }
}

print(answer.count)
answer.sorted().forEach {
    print($0)
}
