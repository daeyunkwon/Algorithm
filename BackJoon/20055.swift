import Foundation

class Room {
    var durability: Int = 0
    var robot: Robot?
    
    init() { }
    
    init(value: Int) {
        self.durability = value
    }
    
    var hasRobot: Bool {
        return self.robot != nil
    }
}

class Robot {
    
}

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (line[0], line[1]) // 내구도가 0인 칸의 개수가 K개 이상이라면 과정을 종료
var answer = 0
var zeroCount = 0

// 벨트가 각 칸 위에 있는 로봇과 함께 한 칸 회전한다.
// 1번 칸은 로봇을 올리는 위치, n번 칸은 로봇을 내리는 위치
// 올리는 위치의 내구도가 0이 아닐 때만 올릴 수 있음

var belt: [Room] = .init(repeating: Room(), count: n*2)
belt = readLine()!.split(separator: " ").map { value in
    let room = Room(value: Int(value)!)
    return room
}

func rotate() {
    let lastItem = belt.popLast()!
    belt.insert(lastItem, at: 0)
    
    if belt[n-1].hasRobot { // 내리는 칸에 로봇 내리기
        belt[n-1].robot = nil
    }
}

func move() {
    for curIndex in stride(from: n-2, through: 0, by: -1) {
        let curBelt = belt[curIndex]
        let nextBelt = belt[curIndex + 1]
        
        if nextBelt.hasRobot || nextBelt.durability < 1 { continue }
        if !curBelt.hasRobot { continue }
        
        nextBelt.robot = curBelt.robot
        nextBelt.durability -= 1
        if nextBelt.durability == 0 { zeroCount += 1 }
        curBelt.robot = nil
    }
    
    if belt[n-1].hasRobot { // 로봇 내리기
        belt[n-1].robot = nil
    }
    
    if !belt[0].hasRobot && belt[0].durability > 0 { // 로봇 올리기
        belt[0].robot = Robot()
        belt[0].durability -= 1
        if belt[0].durability == 0 { zeroCount += 1 }
    }
}

//func checkDurability() {
//    var count = 0
//    belt.forEach {
//        if $0.durability < 1 {
//            count += 1
//            if count >= k {
//                print(answer)
//                exit(0)
//            }
//        }
//    }
//}

while true {
    answer += 1
    rotate()
    move()
    if zeroCount >= k {
        print(answer)
        exit(0)
    }
}
