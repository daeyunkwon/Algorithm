

// 0: 북쪽, 1: 동쪽, 2: 남쪽, 3: 서쪽

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0] // 세로
let m = nm[1] // 가로
let rcd = readLine()!.split(separator: " ").map { Int($0)! }
let r = rcd[0] // 청소기 현재 세로 좌표
let c = rcd[1] // 청소기 현재 가로 좌표
var d = rcd[2] // 청소기 바라보고 있는 방향

// 0이면 청소되지 않은 구역, 1이면 벽
var area: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    area.append(input)
}

var answer: Int = 0 // 로봇 청소기가 작동을 시작한 후 작동을 멈출 때까지 청소하는 칸의 개수를 출력한다.
var y = r
var x = c

func getBackPosition(direction: Int, y: Int, x: Int) -> (Int, Int) {
    var yx: (Int, Int)
    switch direction {
    case 0: yx = (y + 1, x)
    case 1: yx = (y, x - 1)
    case 2: yx = (y - 1, x)
    case 3: yx = (y, x + 1)
    default: yx = (0, 0)
    }
    
    return yx
}

func getNextCleaningPosition(area: [[Int]], direction: Int, y: Int, x: Int) -> (Int, Int, Int)? {
    var yxd: (Int, Int, Int)?
    
    var nextDirection: Int = 0 // 현재 보는 방향의 다음 좌표를 확인하는 것이 아니라, 무조건 먼저 반시계 방향으로 돌리는 것
    switch direction {
    case 0: nextDirection = 3
    case 1: nextDirection = 0
    case 2: nextDirection = 1
    case 3: nextDirection = 2
    default: break
    }
    
    
    var isFind: Bool = false
    
    for _ in 1...4 {
        if isFind {
            break
        }
        
        switch nextDirection {
        case 0:
            if area[y - 1][x] == 0 {
                yxd = (y - 1, x, 0)
                isFind = true
            } else {
                nextDirection = 3
            }
            
        case 1:
            if area[y][x + 1] == 0 {
                yxd = (y, x + 1, 1)
                isFind = true
            } else {
                nextDirection = 0
            }
            
        case 2:
            if area[y + 1][x] == 0 {
                yxd = (y + 1, x, 2)
                isFind = true
            } else {
                nextDirection = 1
            }
            
        case 3:
            if area[y][x - 1] == 0 {
                yxd = (y, x - 1, 3)
                isFind = true
            } else {
                nextDirection = 2
            }
            
        default: break
        }
    }
    
    return yxd
}

while true {
    if area[y][x] == 0 {
        // 현재 칸 청소
        answer += 1
        area[y][x] = 2 // 청소한 건 임의로 2로 마킹
    }
    
    if area[y-1][x] != 0 && area[y+1][x] != 0 && area[y][x-1] != 0 && area[y][x+1] != 0 {
        // 주변 4칸중 청소되지 않은 빈 칸이 없는 경우
        let backYX = getBackPosition(direction: d, y: y, x: x)
        
        // 뒤쪽이 벽일 경우 종료
        if area[backYX.0][backYX.1] == 1 {
            break
        }
        // 다음 청소 구역으로 이동
        y = backYX.0
        x = backYX.1
    } else {
        // 주변 4칸 중 청소할 구역이 있는 경우
        if let nextYXD = getNextCleaningPosition(area: area, direction: d, y: y, x: x) {
            // 다음 청소 구역 및 이동 방향 업데이트
            y = nextYXD.0
            x = nextYXD.1
            d = nextYXD.2
        }
    }
}

print(answer)
