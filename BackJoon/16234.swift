
let firstLine = readLine()!.split(separator: " ").map { Int($0)! }

let (n, l, r) = (firstLine[0], firstLine[1], firstLine[2]) // 국경선을 공유하는 두 나라의 인구 차이가 L명 이상, R명 이하라면 -> 각 칸의 인구수는 (연합의 인구수) / (연합을 이루고 있는 칸의 개수)

var graph: [[Int]] = .init(repeating: [], count: n)

for y in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    graph[y] = line
}

// 1. 탐색으로 연합 개수
// 2. 탐색으로 연합 인구수
// 3. 인구 업데이트할 룸 xy 좌표
// 4. 123 반복

var answer: Int = 0 // 인구 이동 발생일

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

func bfs(x: Int, y: Int, visited: inout [[Bool]]) -> [(Int, Int)] {
    var index = 0
    var queue: [(Int, Int)] = [(y, x)]
    visited[y][x] = true
    var updatePoint: [(Int, Int)] = [(y, x)]
    
    while index < queue.count {
        let now = queue[index]
        
        // 상하좌우
        for i in 0...3 {
            let nx = dx[i] + now.1
            let ny = dy[i] + now.0
            
            if nx >= 0 && nx < n && ny >= 0 && ny < n {
                if !visited[ny][nx] {
                    let value = graph[now.0][now.1] - graph[ny][nx]
                    if abs(value) >= l && abs(value) <= r {
                        updatePoint.append((ny, nx))
                        queue.append((ny, nx))
                        visited[ny][nx] = true
                    }
                }
            }
        }
        index += 1
    }
    
    return updatePoint
}

while true {
    var visited: [[Bool]] = .init(repeating: .init(repeating: false, count: n), count: n)
    var moved = false
    
    for y in 0..<n {
        for x in 0..<n {
            if !visited[y][x] {
                let result = bfs(x: x, y: y, visited: &visited)
                
                if result.count > 1 {
                    let total = result.reduce(into: 0) { $0 += graph[$1.0][$1.1] }
                    let newValue = total / result.count
                    
                    for (y, x) in result {
                        graph[y][x] = newValue
                    }
                    
                    moved = true
                }
            }
        }
    }
    
    if !moved { break }
    answer += 1
}

print(answer)
