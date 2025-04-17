
// 바이러스는 상하좌우로 퍼짐
// 벽은 3개만 세울 수 있음
// 안전영역 == 0

// 벽을 어디다가 세우는게 좋을지는 벽 3개 세우는 모든 경우의 수를 구하기

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0] // 세로
let m = nm[1] // 가로
var graph: [[Int]] = []

let dx: [Int] = [0, 0, -1, 1]
let dy: [Int] = [-1, 1, 0, 0]

for _ in 1...n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(input)
}

var virusPositions: [(Int, Int)] = []
var zeroPositions: [(Int, Int)] = []

for y in 0..<n {
    for x in 0..<m {
        if graph[y][x] == 2 { virusPositions.append((y, x)) }
        if graph[y][x] == 0 { zeroPositions.append((y, x)) }
    }
}

var answer = 0
func wallSetting(index: Int, depth: Int) {
    if depth == 3 {
        answer = max(answer, bfs())
        return
    }
    
    for i in index..<zeroPositions.count {
        let y = zeroPositions[i].0
        let x = zeroPositions[i].1
        graph[y][x] = 1
        wallSetting(index: i + 1, depth: depth + 1)
        graph[y][x] = 0
    }
}

wallSetting(index: 0, depth: 0)
print(answer)

func bfs() -> Int {
    var queue = virusPositions
    var index = 0
    var visited: [[Bool]] = .init(repeating: Array(repeating: false, count: m), count: n)
    var graph = graph
    
    while index < queue.count {
        let y = queue[index].0
        let x = queue[index].1
        visited[y][x] = true
        
        for i in 0...3 {
            let ny = dy[i] + y
            let nx = dx[i] + x
            
            if ny >= 0 && ny < n && nx >= 0 && nx < m && !visited[ny][nx] && graph[ny][nx] == 0 {
                queue.append((ny, nx))
                graph[ny][nx] = 2
                visited[ny][nx] = true
            }
        }
        
        index += 1
    }
    return graph.flatMap { $0 }.filter { $0 == 0 }.count
}


