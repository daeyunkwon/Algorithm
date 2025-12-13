import Foundation

// 맞닿은 극이 같으면 회전 X
// 맞닿은 극이 다르다면 서로 반대 방향으로 회전 처리
// 최종 톱니바퀴의 상태 구하기
// N극: 0, S극: 1
// 방향이 1인 경우는 시계 방향이고, -1인 경우는 반시계 방향

//struct Wheel {
//    private(set) var front: [Int] = []
//    private(set) var back: [Int] = []
//    
//    private(set) var num: Int
//    
//    init(_ value: [Int], _ num: Int) {
//        self.front = value
//        self.num = num
//    }
//    
//    var isEmpty: Bool {
//        return front.isEmpty && back.isEmpty
//    }
//    
//    var topItem: Int {
//        if front.isEmpty {
//            return back.first!
//        }
//        return front.last!
//    }
//    
//    var leftItem: Int {
//        if back.count >= 2 {
//            return back[back.count - 2]
//        }
//        
//        if back.count == 1 {
//            return front.first!
//        }
//        
//        return front[1]
//    }
//    
//    var rightItem: Int {
//        if front.count >= 3 {
//            return front[front.count - 3]
//        }
//        
//        if front.count == 2 {
//            return back.first!
//        }
//        
//        if front.count == 1 {
//            return back[1]
//        }
//    
//        return back[2]
//    }
//    
//    mutating private func insertFront(_ element: Int) {
//        front.append(element)
//    }
//    
//    mutating private func insertBack(_ element: Int) {
//        back.append(element)
//    }
//    
//    mutating private func popFront() -> Int? {
//        if front.isEmpty {
//            front = back.reversed()
//            back.removeAll()
//        }
//        return front.popLast()
//    }
//    
//    mutating private func popBack() -> Int? {
//        if back.isEmpty {
//            back = front.reversed()
//            front.removeAll()
//        }
//        return back.popLast()
//    }
//    
//    mutating func rotateRight() {
//        let item = popBack()!
//        insertFront(item)
//    }
//    
//    mutating func rotateLeft() {
//        let item = popFront()!
//        insertBack(item)
//    }
//}



struct Wheel {
    private(set) var gear: [Int]
    let num: Int

    init(_ value: [Int], _ num: Int) {
        self.gear = value
        self.num = num
    }

    var topItem: Int {
        gear[0]
    }

    var rightItem: Int {
        gear[2]
    }

    var leftItem: Int {
        gear[6]
    }

    mutating func rotateRight() {
        let last = gear.removeLast()
        gear.insert(last, at: 0)
    }

    mutating func rotateLeft() {
        let first = gear.removeFirst()
        gear.append(first)
    }
}

var wheels: [Wheel] = [.init([], 0)]

for i in 1...4 {
    let input = readLine()!.map { Int(String($0))! }
    let wheel = Wheel(input, i)
    wheels.append(wheel)
}

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (wheelNum, direction) = (input[0], input[1])
    rotate(wheelNum, direction)
}

calculate()

func calculate() {
    var answer = 0
    
    if wheels[1].topItem == 1 {
        answer += 1
    }
    
    if wheels[2].topItem == 1 {
        answer += 2
    }
    
    if wheels[3].topItem == 1 {
        answer += 4
    }
    
    if wheels[4].topItem == 1 {
        answer += 8
    }
    
    print(answer)
}

func rotate(_ wheelNum: Int, _ direction: Int) {
    let (order, one) = createOrder(wheelNum: wheelNum)
    
    var isRotate: [Bool] = .init(repeating: false, count: 5)
    var directions: [Int] = .init(repeating: 0, count: 5)
    
    isRotate[wheelNum] = true
    directions[wheelNum] = direction

    // 1. 회전 여부, 방향 준비
    for i in 0..<order.count - 1 {
        let now = order[i]
        let next = order[i + 1]
        
        if !isRotate[now.num] { break }
        let nowDirection = directions[now.num]
        
        let (result, directionNum) = checkState(nowDirection, now.num, next.num)
        
        isRotate[next.num] = result
        directions[next.num] = directionNum
    }
    
    // 하나 체크
    if let one {
        if wheelNum == 2 {
            if one.rightItem != wheels[2].leftItem {
                isRotate[one.num] = true
                
                if direction == 1 {
                    directions[one.num] = -1
                } else {
                    directions[one.num] = 1
                }
            }
        }
        
        if wheelNum == 3 {
            if one.leftItem != wheels[3].rightItem {
                isRotate[one.num] = true
                
                if direction == 1 {
                    directions[one.num] = -1
                } else {
                    directions[one.num] = 1
                }
            }
        }
    }
    
    // 2. 회전 처리
    for i in 1...4 {
        if !isRotate[i] { continue }
        
        if directions[i] == 1 {
            wheels[i].rotateRight()
        }
        
        if directions[i] == -1 {
            wheels[i].rotateLeft()
        }
    }
}

private func createOrder(wheelNum: Int) -> ([Wheel], Wheel?) {
    var order: [Wheel] = []
    var one: Wheel?
    
    if wheelNum == 1 {
        order.append(wheels[1])
        order.append(wheels[2])
        order.append(wheels[3])
        order.append(wheels[4])
    }
    
    else if wheelNum == 2 {
        order.append(wheels[2])
        order.append(wheels[3])
        order.append(wheels[4])
        one = wheels[1]
    }
    
    else if wheelNum == 3 {
        order.append(wheels[3])
        order.append(wheels[2])
        order.append(wheels[1])
        one = wheels[4]
    }
    
    else {
        order.append(wheels[4])
        order.append(wheels[3])
        order.append(wheels[2])
        order.append(wheels[1])
    }
    
    return (order, one)
}

private func checkState(_ nowDirection: Int, _ nowNum: Int, _ nextNum: Int) -> (Bool, Int) {
    var nextDirection: Int = 0
    
    if nowDirection == 1 {
        nextDirection = -1
    }
    else if nowDirection == -1 {
        nextDirection = 1
    }
    
    switch nowNum {
    case 1:
        if nextNum == 2 {
            return (wheels[nowNum].rightItem != wheels[nextNum].leftItem, nextDirection)
        }
        
    case 2:
        if nextNum == 1 {
            return (wheels[nowNum].leftItem != wheels[nextNum].rightItem, nextDirection)
        }
        
        if nextNum == 3 {
            return (wheels[nowNum].rightItem != wheels[nextNum].leftItem, nextDirection)
        }
        
    case 3:
        if nextNum == 2 {
            return (wheels[nowNum].leftItem != wheels[nextNum].rightItem, nextDirection)
        }
        
        if nextNum == 4 {
            return (wheels[nowNum].rightItem != wheels[nextNum].leftItem, nextDirection)
        }
        
    case 4:
        if nextNum == 3 {
            return (wheels[nowNum].leftItem != wheels[nextNum].rightItem, nextDirection)
        }
        
    default: break
    }
    return (false, 0)
}
