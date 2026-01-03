import Foundation


let N = Int(readLine()!)!
var answer = 0
var board: [[Int]] = .init(repeating: [], count: N)

for i in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    board[i] = input
}

/// x, y, persent
/// 왼쪽 방향  기준으로 구성 처리
let spreadLeft: [(Int, Int, Int)] = [
    (-2, 0, 5), // 5%
    (-1, -1, 10), // 10%
    (-1, 1, 10), // 10%
    (0, -2, 2), // 2%
    (0, 2, 2), // 2%
    (0, -1, 7), // 7%
    (0, 1, 7), // 7%
    (1, -1, 1), // 1%
    (1, 1, 1) // 1%
]

func rotate(dx: Int, dy: Int, dir: Int) -> (Int, Int) {
    switch dir {
    case 0:
        // 좌
        return (dx, dy)
    case 1:
        // 하
        return (dy, -dx)
    case 2:
        // 우
        return (-dx, -dy)
    case 3:
        // 상
        return (-dy, dx)
    default: return (0, 0)
    }
}

func spread(x: Int, y: Int, sand: Int, dir: Int) {
    var amount = 0
    
    // 1. 비율 적힌 칸으로 모래 이동
    for (dx, dy, persent) in spreadLeft {
        let (rdx, rdy) = rotate(dx: dx, dy: dy, dir: dir)
        
        let nx = x + rdx
        let ny = y + rdy
        
        let value = sand * persent / 100
        amount += value
        
        if nx >= 0 && nx < N && ny >= 0 && ny < N {
            board[ny][nx] += value
        } else {
            answer += value
        }
    }
    
    // 2. a칸으로 남은 모래 이동
    var ax = x
    var ay = y
    let value = sand - amount
    
    switch dir {
    case 0:
        ax -= 1
    case 1:
        ay += 1
    case 2:
        ax += 1
    case 3:
        ay -= 1
    default: break
    }
    
    if ax >= 0 && ax < N && ay >= 0 && ay < N {
        board[ay][ax] += value
    } else {
        answer += value
    }
}


// 좌 -> 하 -> 우 -> 상
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]
var dir = 0
var length = 1
var tornadoX = N / 2
var tornadoY = N / 2

while true {
    for _ in 1...2 {
        for _ in 0..<length {
            tornadoX += dx[dir]
            tornadoY += dy[dir]
            
            if tornadoX < 0 || tornadoX >= N || tornadoY < 0 || tornadoY >= N {
                print(answer)
                exit(0)
            }
            
            spread(x: tornadoX, y: tornadoY, sand: board[tornadoY][tornadoX], dir: dir)
            
            board[tornadoY][tornadoX] = 0
        }
        
        // 방향 전환
        dir = (dir + 1) % 4
    }
    
    length += 1
}
