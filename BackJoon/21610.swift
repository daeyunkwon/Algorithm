
import Foundation

// N번 행의 아래에는 1번 행이, 1번 행의 위에는 N번 행이 있고, 1번 열의 왼쪽에는 N번 열이, N번 열의 오른쪽에는 1번 열이 있다.
// 비바라기를 시전하면 (N, 1), (N, 2), (N-1, 1), (N-1, 2)에 비구름이 생긴다.

// 이동 명령:
/*
 1. 모든 구름이 di 방향으로 si칸 이동한다.
 2. 각 구름에서 비가 내려 구름이 있는 칸의 바구니에 저장된 물의 양이 1 증가한다.
 3. 구름이 모두 사라진다.
 4. 2에서 물이 증가한 칸 (r, c)에 물복사버그 마법을 시전한다. 물복사버그 마법을 사용하면, 대각선 방향으로 거리가 1인 칸에 물이 있는 바구니의 수만큼 (r, c)에 있는 바구니의 물이 양이 증가한다.
    이때는 이동과 다르게 경계를 넘어가는 칸은 대각선 방향으로 거리가 1인 칸이 아니다.
    예를 들어, (N, 2)에서 인접한 대각선 칸은 (N-1, 1), (N-1, 3)이고, (N, N)에서 인접한 대각선 칸은 (N-1, N-1)뿐이다.
 5. 바구니에 저장된 물의 양이 2 이상인 모든 칸에 구름이 생기고, 물의 양이 2 줄어든다. 이때 구름이 생기는 칸은 3에서 구름이 사라진 칸이 아니어야 한다.
 */

struct Position {
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
    
    mutating func update(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (firstLine[0], firstLine[1])

var board: [[Int]] = .init(repeating: [], count: n)
var clouds: [Position] = [
    .init(0, n - 1),
    .init(1, n - 1),
    .init(0, n - 2),
    .init(1, n - 2)
]

// 0: empty
let dx: [Int] = [0, -1, -1, 0, 1, 1, 1, 0, -1]
let dy: [Int] = [0, 0, -1, -1, -1, 0, 1, 1, 1]

for y in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    board[y] = line
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (d, s) = (input[0], input[1])
    
    move(d: d, s: s)
    rain()
    performMagic()
    updateClouds()
}

print(
    board.flatMap { $0 }.reduce(0, +)
)

func move(d: Int, s: Int) {
    for i in 0..<clouds.count {
        let x = clouds[i].x
        let y = clouds[i].y
        
        let nx = wrap(x + dx[d] * s, n)
        let ny = wrap(y + dy[d] * s, n)
        
        clouds[i].update(nx, ny)
    }
}

private func wrap(_ value: Int, _ n: Int) -> Int {
    var value = value
    while value < 0 { value += n }
    while value >= n { value -= n }
    return value
}

func rain() {
    for cloud in clouds {
        let x = cloud.x
        let y = cloud.y
        
        board[y][x] += 1
    }
}

func performMagic() {
    let dx: [Int] = [-1, 1, -1, 1]
    let dy: [Int] = [-1, -1, 1, 1]
    
    for cloud in clouds {
        let x = cloud.x
        let y = cloud.y
        
        var water = 0
        
        for i in 0...3 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || nx >= n || ny < 0 || ny >= n { continue }
            
            if board[ny][nx] > 0 { water += 1 }
        }
        
        board[y][x] += water
    }
}

func updateClouds() {
    var newClouds: [Position] = []
    
    for y in 0..<n {
        for x in 0..<n {
            
            var isTarget = true
            
            for cloud in clouds {
                if cloud.x == x && cloud.y == y {
                    isTarget = false
                    break
                }
            }
            
            if isTarget && board[y][x] >= 2 {
                newClouds.append(Position(x, y))
                board[y][x] -= 2
            }
        }
    }
    
    clouds = newClouds
}
