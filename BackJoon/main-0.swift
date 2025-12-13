//import Foundation

// 1. 모든 파이어볼이 자신의 방향 di로 속력 si칸 만큼 이동한다./
// 2. 이동이 모두 끝난 뒤, 2개 이상의 파이어볼이 있는 칸에서는 다음과 같은 일이 일어난다.
/// 1. 같은 칸에 있는 파이어볼은 모두 하나로 합쳐진다.
/// 2. 파이어볼은 4개의 파이어볼로 나누어진다.
/// 3. 나누어진 파이어볼의 질량, 속력, 방향은 다음과 같다.
///  질량은 ⌊(합쳐진 파이어볼 질량의 합)/5⌋이다.
///  속력은 ⌊(합쳐진 파이어볼 속력의 합)/(합쳐진 파이어볼의 개수)⌋이다.
///  합쳐지는 파이어볼의 방향이 모두 홀수이거나 모두 짝수이면, 방향은 0, 2, 4, 6이 되고, 그렇지 않으면 1, 3, 5, 7이 된다.
/// 4. 질량이 0인 파이어볼은 소멸되어 없어진다.
///


//struct Position {
//    var x: Int
//    var y: Int
//    var fireballDict: [String: Fireball] = [:]
//}
//
//struct Fireball {
//    var id: String = UUID().uuidString
//    var x: Int
//    var y: Int
//    var m: Int // 질량
//    var s: Int // 속력
//    var d: Int // 방향
//}
//
//let dx: [Int] = [0, 1, 1, 1, 0, -1, -1, -1]
//let dy: [Int] = [-1, -1, 0, 1, 1, 1, 0, -1]
//
//let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
//let (n, m, k) = (firstLine[0], firstLine[1], firstLine[2])
//
//var board: [[Position]] = .init(repeating: .init(repeating: .init(x: 0, y: 0), count: n), count: n)
//
//for y in 0..<n {
//    for x in 0..<n {
//        board[y][x] = Position(x: x, y: y)
//    }
//}
//
//var fireballs: [Fireball] = []
//
//for _ in 1...m {
//    let input = readLine()!.split(separator: " ").map { Int($0)! } // 파이어볼의 정보는 다섯 정수 r, c, m, s, d
//    let (r, c, m, s, d) = (input[0], input[1], input[2], input[3], input[4])
//    let item: Fireball = .init(x: c - 1, y: r - 1, m: m, s: s, d: d)
//    fireballs.append(item)
//    board[r - 1][c - 1].fireballDict[item.id] = item
//}
//
//
//func move(_ fireball: Fireball) {
//    var fireball = fireball
//    let x = fireball.x
//    let y = fireball.y
//    let d = fireball.d
//    let s = fireball.s
//    
//    let nx = wrap(x + dx[d] * s)
//    let ny = wrap(y + dy[d] * s)
//    
//    fireball.x = nx
//    fireball.y = ny
//    
//    board[y][x].fireballDict.removeValue(forKey: fireball.id)
//    
//    board[ny][nx].fireballDict[fireball.id] = fireball
//}
//
//private func wrap(_ value: Int) -> Int {
//    var value = value
//    while value < 0 { value += n }
//    while value >= n { value -= n }
//    return value
//}
//
//func sumAndDivide() {
//    for y in 0..<n {
//        for x in 0..<n {
//            if board[y][x].fireballDict.count < 2 {
//                if let item = board[y][x].fireballDict.first {
//                    fireballs.append(item.value)
//                }
//                continue
//            }
//            
//            var isFirst: Bool = true
//            var isUniformParity: Bool = true
//            var isOdd: Bool = false
//            var isEven: Bool = false
//            var sumM: Int = 0
//            var sumS: Int = 0
//            var count: Int = board[y][x].fireballDict.count
//            
//            for (key, value) in board[y][x].fireballDict {
//                
//                if isFirst {
//                    if value.d % 2 == 0 {
//                        isEven = true
//                    } else {
//                        isOdd = true
//                    }
//                    isFirst = false
//                }
//                
//                else {
//                    if value.d % 2 == 0 && isOdd { isUniformParity = false }
//                    if value.d % 2 != 0 && isEven { isUniformParity = false }
//                }
//                
//                sumM += value.m
//                sumS += value.s
//            }
//            
//            var dividedFireballs: [String: Fireball] = [:]
//            
//            var d = isUniformParity ? [0, 2, 4, 6] : [1, 3, 5, 7]
//            for i in 0...3 {
//                let newM = sumM / 5
//                let newS = sumS / count
//                
//                if newM == 0 { continue }
//                
//                let new = Fireball(x: x, y: y, m: newM, s: newS, d: d[i])
//                dividedFireballs[new.id] = new
//                
//                fireballs.append(new)
//            }
//            
//            board[y][x].fireballDict = dividedFireballs
//        }
//    }
//}
//
//
//for _ in 0..<k {
//    while !fireballs.isEmpty {
//        let fireball = fireballs.popLast()!
//        move(fireball)
//    }
//    sumAndDivide()
//}
//
//print(
//    fireballs.map { $0.m }.reduce(0, +)
//)

import Foundation

struct Fireball {
    var x: Int
    var y: Int
    var m: Int // 질량
    var s: Int // 속력
    var d: Int // 방향
}

let dx: [Int] = [0, 1, 1, 1, 0, -1, -1, -1]
let dy: [Int] = [-1, -1, 0, 1, 1, 1, 0, -1]

let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k) = (firstLine[0], firstLine[1], firstLine[2])


var fireballs: [Fireball] = []

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! } // 파이어볼의 정보는 다섯 정수 r, c, m, s, d
    let (r, c, m, s, d) = (input[0], input[1], input[2], input[3], input[4])
    let item: Fireball = .init(x: c - 1, y: r - 1, m: m, s: s, d: d)
    fireballs.append(item)
}

private func wrap(_ value: Int) -> Int {
    var value = value
    while value < 0 { value += n }
    while value >= n { value -= n }
    return value
}

for _ in 0..<k {
    var board: [[[Int]]] = .init(repeating: .init(repeating: [Int](), count: n), count: n) // 인덱스 정보를 저장
    
    // 1. 이동
    for i in 0..<fireballs.count {
        let f = fireballs[i]
        let ny = wrap(f.y + dy[f.d] * f.s)
        let nx = wrap(f.x + dx[f.d] * f.s)
        fireballs[i].x = nx
        fireballs[i].y = ny
        board[ny][nx].append(i)
    }
    
    // 2. 합치기
    var newFireballs: [Fireball] = []
    
    for y in 0..<n {
        for x in 0..<n {
            let list = board[y][x]
            
            if list.isEmpty { continue }
            
            if list.count == 1 {
                let index = list[0]
                newFireballs.append(fireballs[index])
                continue
            }
            
            var sumM = 0
            var sumS = 0
            var odd = 0
            var even = 0
            
            for index in list {
                let fireball = fireballs[index]
                
                sumM += fireball.m
                sumS += fireball.s
                if fireball.d % 2 == 0 {
                    even += 1
                } else {
                    odd += 1
                }
            }
            
            // 개수로 모두 짝수 혹은 모두 홀수 인지 판별
            let newD = (odd == 0 || even == 0) ? [0, 2, 4, 6] : [1, 3, 5, 7]
            
            if sumM / 5 == 0 { continue }
            
            // 3. 4개의 파이아볼로 나누기
            
            for i in 0...3 {
                let newM = sumM / 5
                let newS = sumS / list.count
                
                let new = Fireball(x: x, y: y, m: newM, s: newS, d: newD[i])
                newFireballs.append(new)
            }
        }
    }
    
    fireballs = newFireballs // 현재 파이어볼 목록 업데이트
}

print(
    fireballs.map { $0.m }.reduce(0, +)
)
