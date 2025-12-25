
import Foundation

/*
 1. 청소년 상어는 (0, 0)에 있는 물고기를 먹고, (0, 0)에 들어가게 된다. 상어의 방향은 (0, 0)에 있던 물고기의 방향과 같다. 이후 물고기가 이동한다.
 2. 물고기는 한 칸을 이동할 수 있고, 이동할 수 있는 칸은 빈 칸과 다른 물고기가 있는 칸, 이동할 수 없는 칸은 상어가 있거나, 공간의 경계를 넘는 칸 (각 물고기는 방향이 이동할 수 있는 칸을 향할 때까지 방향을 45도 반시계 회전)
 3. 물고기는 번호가 작은 물고기부터 순서대로 이동
 4. 상어는 물고기 방향을 가지고 여러 칸을 이동 가능 (이동 중에 지나간 물고기는 먹지 않음)
 5. 상어는 물고기가 있는 칸에만 이동 가능하며, 이동할 수 있는 물고기 칸이 없으면 집으로 향함
 */

struct Room {
    var x: Int
    var y: Int
    var num: Int // 상어: -1, 빈 칸: 0, 그 외 물고기 번호
    var direction: Int
    
    init(_ x: Int, _ y: Int, _ num: Int, _ direction: Int) {
        self.x = x
        self.y = y
        self.num = num
        self.direction = direction
    }
}

/// (x, y)
let directionList: [(Int, Int)] = [
    (0, 0), // empty,
    (0, -1),
    (-1, -1),
    (-1, 0),
    (-1, 1),
    (0, 1),
    (1, 1),
    (1, 0),
    (1, -1)
]

var board: [[Room]] = .init(repeating: .init(repeating: Room(0, 0, 0, 0), count: 4), count: 4)
for y in 0...3 {
    for x in 0...3 {
        let room = Room(x, y, 0, 0)
        board[y][x] = room
    }
}

// x, y
var sharkOrigin: (Int, Int) = (0, 0)
var fishOrigin: [(Int, Int)?] = .init(repeating: nil, count: 17)

for y in 0..<4 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    var fishList: [(Int, Int)] = []
    
    for i in 0...input.count - 2 {
        if i % 2 != 0 { continue }
        let fishNum = input[i]
        let direction = input[i + 1]
        fishList.append((fishNum, direction))
    }
    
    for i in 0...3 {
        board[y][i].num = fishList[i].0
        board[y][i].direction = fishList[i].1
        
        fishOrigin[fishList[i].0] = (i, y)
    }
}

var answer = 0

func dfs(x: Int, y: Int, board: [[Room]], fishOrigin: [(Int, Int)?], eatCount: Int) {
    
    var copyBoard = board
    var copyFishOrigin = fishOrigin
    var copyEatCount = eatCount
    
    // 1. 현재 위치 물고기 먹음 처리
    copyEatCount += copyBoard[y][x].num
    copyFishOrigin[copyBoard[y][x].num] = nil
    copyBoard[y][x].num = -1
    
    let dir = copyBoard[y][x].direction
    
    // 2. 물고기 이동 처리
    moveFish(fishOrigin: &copyFishOrigin, board: &copyBoard)
    
    copyBoard[y][x].num = 0 // 상어 이동할거니깐 현재 위치 미리 빈 칸 처리
    
    // 3. 상어 이동
    /// 바라보는 방향으로 1, 2, 3까지 이동 가능
    /// 각 방향으로 이동할 경우에 대해서 각각 시뮬레이션을 돌림
    var canMove = false
    for i in 1...3 {
        let nx = x + directionList[dir].0 * i
        let ny = y + directionList[dir].1 * i
        
        if nx >= 0 && nx < 4 && ny >= 0 && ny < 4 {
            if copyBoard[ny][nx].num > 0 {
                canMove = true
                dfs(x: nx, y: ny, board: copyBoard, fishOrigin: copyFishOrigin, eatCount: copyEatCount)
            }
        }
    }
    
    // 4. 이동 가능한 물고기 칸이 없는 경우 현재까지 먹은 값 업데이트
    if !canMove {
        answer = max(answer, copyEatCount)
    }
}

private func moveFish(fishOrigin: inout [(Int, Int)?], board: inout [[Room]]) {
    for i in 1...16 {
        guard let (x, y) = fishOrigin[i] else { continue }
        
        let now = board[y][x]
        var dirIndex = now.direction
        
        while true {
            let nx = now.x + directionList[dirIndex].0
            let ny = now.y + directionList[dirIndex].1
            
            if nx >= 0 && nx < 4 && ny >= 0 && ny < 4 && board[ny][nx].num != -1 {
                let otherFish = board[ny][nx]
                
                board[y][x].num = otherFish.num
                board[y][x].direction = otherFish.direction
                
                board[ny][nx].num = now.num
                board[ny][nx].direction = dirIndex
                
                fishOrigin[i]?.0 = nx
                fishOrigin[i]?.1 = ny
                
                // otherFish 자리가 빈 칸인 경우 고려
                if otherFish.num > 0 {
                    fishOrigin[otherFish.num]?.0 = now.x
                    fishOrigin[otherFish.num]?.1 = now.y
                }
                break
            }
            
            dirIndex += 1
            if dirIndex == 9 { dirIndex = 1 }
        }
    }
}

dfs(x: 0, y: 0, board: board, fishOrigin: fishOrigin, eatCount: answer)
print(answer)
