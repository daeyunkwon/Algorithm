

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0] // y
let m = nm[1] // x

var graph: [[Int]] = .init(repeating: [], count: n)
for i in 0..<n {
    graph[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

var visitedBackUp: [[Bool]] = .init(repeating: Array(repeating: false, count: m), count: n)
var dx: [Int] = [0, 0, -1, 1]
var dy: [Int] = [-1, 1, 0, 0]

var year = 0
while true {
    var count = 0 // 빙산 개수
    var visited = visitedBackUp
    
    func dfs(_ x: Int, _ y: Int) {
        visited[y][x] = true
        
        for i in 0...3 {
            let nx = dx[i] + x
            let ny = dy[i] + y
            if nx >= 0 && ny >= 0 && nx < m && ny < n && !visited[ny][nx] && graph[ny][nx] != 0 {
                dfs(nx, ny)
            }
        }
    }
    
    for y in 0..<n {
        for x in 0..<m {
            if graph[y][x] > 0 {
                if !visited[y][x] {
                    dfs(x, y)
                    count += 1
                }
            }
        }
    }
    
    if count == 0 {
        print(0)
        break
    }
    
    if count >= 2 {
        print(year)
        break
    }
    
    year += 1
    var temp: [(Int, Int, Int)] = [] // 좌표, 0 개수
    for y in 0..<n { // 좌표와 0 개수 파악만 해두기
        for x in 0..<m {
            if graph[y][x] > 0 {
                var zeroCount = 0
                
                for i in 0...3 {
                    let nx = dx[i] + x
                    let ny = dy[i] + y
                    if nx >= 0 && ny >= 0 && nx < m && ny < n && graph[ny][nx] == 0 {
                        zeroCount += 1
                    }
                }
                
                let value = (y, x, zeroCount)
                temp.append(value)
            }
        }
    }
    
    for item in temp { // 해당 좌표에 0 개수만큼 감소 반영하기
        let x = item.1
        let y = item.0
        let zeroCount = item.2
        
        graph[y][x] -= zeroCount
        if graph[y][x] < 0 {
            graph[y][x] = 0
        }
    }
}
