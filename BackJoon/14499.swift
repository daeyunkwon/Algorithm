
final class Dice {
    private(set) var top: Int
    private var left: Int
    private var right: Int
    private var front: Int
    private var back: Int
    private(set) var bottom: Int
    
    private var x: Int
    private var y: Int
    
    init() {
        top = 0
        left = 0
        right = 0
        front = 0
        back = 0
        bottom = 0
        x = 0
        y = 0
    }
    
    var currentX: Int {
        return self.x
    }
    
    var currentY: Int {
        return self.y
    }
    
    func updatePosition(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
    
    func updateToBottom(newValue: Int) {
        self.bottom = newValue
    }
    
    func rollToWest() {
        let temp: [Int] = [top, left, right, front, back, bottom]
        
        top = temp[2]
        left = temp[0]
        right = temp[5]
        bottom = temp[1]
    }
    
    func rollToEast() {
        let temp: [Int] = [top, left, right, front, back, bottom]
        
        top = temp[1]
        left = temp[5]
        right = temp[0]
        bottom = temp[2]
    }
    
    func rollToNorth() {
        let temp: [Int] = [top, left, right, front, back, bottom]
        
        top = temp[3]
        front = temp[5]
        back = temp[0]
        bottom = temp[4]
    }
    
    func rollToSouth() {
        let temp: [Int] = [top, left, right, front, back, bottom]
        
        top = temp[4]
        front = temp[0]
        back = temp[5]
        bottom = temp[3]
    }
}

let firstLine = readLine()!.split(separator: " ").map { Int($0)! }

let (n, m) = (firstLine[0], firstLine[1]) // 세로, 가로
let (x, y) = (firstLine[3], firstLine[2]) // 좌표 (문제에서는 y가 가로 좌표, x가 세로 좌표이지만 나는 y를 세로, x를 가로로 취급하기 위해 바꿈)
let k = firstLine[4] // 명령 개수

var map: [[Int]] = .init(repeating: [], count: n)

for y in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    map[y] = line
}

let commands: [Int] = readLine()!.split(separator: " ").map { Int($0)! } // 동쪽은 1, 서쪽은 2, 북쪽은 3, 남쪽은 4

let dice: Dice = .init()
dice.updatePosition(x, y)

for command in commands {
    
    var newPosition: (Int, Int) = (0, 0) // 주사위가 이동하는 새로운 x, y 좌표
    switch command {
    case 1:
        newPosition = (dice.currentX + 1, dice.currentY)
    case 2:
        newPosition = (dice.currentX - 1, dice.currentY)
    case 3:
        newPosition = (dice.currentX, dice.currentY - 1)
    case 4:
        newPosition = (dice.currentX, dice.currentY + 1)
    default: break
    }
    
    if newPosition.0 >= m || newPosition.0 < 0 || newPosition.1 >= n || newPosition.1 < 0 { continue } // 새 좌표가 지도 범위 내인지 유효성 검사
    
    dice.updatePosition(newPosition.0, newPosition.1) // 주사위 위치 업데이트
    
    // 주사위 굴리기
    switch command {
    case 1:
        dice.rollToEast()
    case 2:
        dice.rollToWest()
    case 3:
        dice.rollToNorth()
    case 4:
        dice.rollToSouth()
    default: break
    }
    
    let newPositionValue = map[newPosition.1][newPosition.0]
    
    // 바닥면 값 업데이트 처리
    if newPositionValue == 0 {
        map[newPosition.1][newPosition.0] = dice.bottom
    } else {
        dice.updateToBottom(newValue: map[newPosition.1][newPosition.0])
        map[newPosition.1][newPosition.0] = 0
    }
    
    print(dice.top)
}
