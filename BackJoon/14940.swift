
import Foundation



let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (firstLine[0], firstLine[1]) // 세로 가로

var board: [[Int]] = .init(repeating: .init(repeating: 0, count: m), count: n)
var targetPosition: (Int, Int) = (0, 0) // x y
var answer: [[Int]] = .init(repeating: .init(repeating: 0, count: m), count: n)
var visited: [[Bool]] = .init(repeating: .init(repeating: false, count: m), count: n)

for y in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    for x in 0..<m {
        board[y][x] = input[x]
        
        switch input[x] { // 도달할 수 없는 점을 고려해 미리 값 세팅 작업
        case 0:
            answer[y][x] = 0
            
        case 1:
            answer[y][x] = -1
            
        case 2:
            targetPosition = (x, y)
            answer[y][x] = 0
        default: break
        }
    }
}

let dx: [Int] = [0, 0, -1, 1]
let dy: [Int] = [-1, 1, 0, 0]

func bfs(_ x: Int, _ y: Int) {
    var queue: [(Int, Int, Int)] = [(x, y, 0)]
    var index: Int = 0
    visited[y][x] = true
    
    while index < queue.count {
        let now = queue[index]
        
        for i in 0...3 {
            let nx = dx[i] + now.0
            let ny = dy[i] + now.1
            
            if nx < 0 || nx >= m || ny < 0 || ny >= n { continue }
            
            if !visited[ny][nx] && board[ny][nx] == 1 {
                visited[ny][nx] = true
                answer[ny][nx] = now.2 + 1
                queue.append((nx, ny, now.2 + 1))
            }
        }
        
        index += 1
    }
}


bfs(targetPosition.0, targetPosition.1)

for y in 0..<n {
    print(
        answer[y].map { String($0) }.joined(separator: " ")
    )
}
