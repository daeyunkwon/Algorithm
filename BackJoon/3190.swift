
import Foundation

struct Point: Hashable {
    var x: Int
    var y: Int
    var hasApple: Bool = false
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
    
    static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

struct Deque<T: Hashable> {
    private var front: [T] = []
    private var back: [T] = []
    
    var isEmpty: Bool {
        return front.isEmpty && back.isEmpty
    }
    
    var peekFront: T? {
        return front.last ?? back.first
    }
    
    var peekBack: T? {
        return back.last ?? front.first
    }
    
    func contains(_ element: T) -> Bool {
        let setFront = Set(front)
        let setBack = Set(back)
        
        if setFront.contains(element) {
            return true
        }
        
        else if setBack.contains(element) {
            return true
        }
        
        else {
            return false
        }
    }
    
    mutating func pushFront(_ element: T) {
        self.front.append(element)
    }
    
    mutating func pushBack(_ element: T) {
        self.back.append(element)
    }
    
    mutating func popFront() -> T? {
        if front.isEmpty {
            front = back.reversed()
            back.removeAll()
        }
        
        return front.popLast()
    }
    
    mutating func popBack() -> T? {
        if back.isEmpty {
            back = front.reversed()
            front.removeAll()
        }
        
        return back.popLast()
    }
}

enum MoveDirection {
    case top
    case bottom
    case left
    case right
}

// 게임이 시작할때 뱀은 맨위 맨좌측에 위치하고 뱀의 길이는 1
// 뱀은 처음에 오른쪽을 향함

let n = Int(readLine()!)!
let k = Int(readLine()!)! // 사과 개수
var commandDict: [Int: String] = [:]

var board: [[Point]] = .init(repeating: .init(repeating: Point(0, 0), count: n), count: n)
for y in 0..<n {
    for x in 0..<n {
        board[y][x].x = x
        board[y][x].y = y
    }
}

for _ in 1...k {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (y, x) = (input[0], input[1])
    board[y - 1][x - 1].hasApple = true
}

for _ in 1...Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let count = Int(input[0])!
    let direction = input[1]
    commandDict[count] = String(direction)
}

var snake: Deque<Point> = .init()
snake.pushFront(.init(0, 0))

var time = 0
var currentDirection: MoveDirection = .right

func move() {
    let head = snake.peekFront!
    let newPoint = nextHead(nowPoint: head, nowDirection: currentDirection)
    
    if newPoint.x < 0 || newPoint.x >= n || newPoint.y < 0 || newPoint.y >= n || snake.contains(newPoint) {
        print(time)
        exit(0)
    }
    
    snake.pushFront(newPoint)
    
    if !board[newPoint.y][newPoint.x].hasApple {
        _ = snake.popBack()
    } else {
        board[newPoint.y][newPoint.x].hasApple = false
    }
}

func nextHead(nowPoint: Point, nowDirection: MoveDirection) -> Point {
    let nx = nowPoint.x
    let ny = nowPoint.y
    let newPoint: Point
    
    switch nowDirection {
    case .top:
        newPoint = .init(nx, ny - 1)
    case .bottom:
        newPoint = .init(nx, ny + 1)
    case .left:
        newPoint = .init(nx - 1, ny)
    case .right:
        newPoint = .init(nx + 1, ny)
    }
    return newPoint
}

while true {
    // 방향 전환
    if let value = commandDict[time] {
        if value == "L" { // 왼쪽
            switch currentDirection {
            case .top:
                currentDirection = .left
            case .bottom:
                currentDirection = .right
            case .left:
                currentDirection = .bottom
            case .right:
                currentDirection = .top
                
            }
        }
        
        if value == "D" { // 오른쪽
            switch currentDirection {
            case .top:
                currentDirection = .right
            case .bottom:
                currentDirection = .left
            case .left:
                currentDirection = .top
            case .right:
                currentDirection = .bottom
                
            }
        }
    }
    
    time += 1
    move()
}
