
let tc = Int(readLine()!)!
var dx = [0, 0, -1, 1]
var dy = [1, -1, 0, 0]

for _ in 0..<tc {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let m = input[0] // 가로
    let n = input[1] // 세로
    let k = input[2] // 배추 개수
    
    var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
    
    for _ in 1...k {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let x = input[0]
        let y = input[1]
        arr[y][x] = 1
    }
    
    func dfs(_ x: Int, _ y: Int) {
        visited[y][x] = true
        
        for i in 0...3 {
            let nx = dx[i] + x
            let ny = dy[i] + y
            if nx >= 0 && nx < m && ny >= 0 && ny < n {
                if !visited[ny][nx] && arr[ny][nx] == 1 {
                    dfs(nx, ny)
                }
            }
        }
    }
    
    var answer = 0
    for y in 0...n-1 {
        for x in 0...m-1 {
            if !visited[y][x] && arr[y][x] == 1 {
                answer += 1
                dfs(x, y)
            }
        }
    }
    print(answer)
}
