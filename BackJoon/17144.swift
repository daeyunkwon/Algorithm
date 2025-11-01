import Foundation

// 순서:
// 1. 미세먼지가 확산된다. (확산은 모든 칸에서 동시에 실행됨)
// 2. 공기청정기가 작동된다.

let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let (R, C, T) = (firstLine[0], firstLine[1], firstLine[2]) // 행, 열, 초

var room: [[Int]] = .init(repeating: .init(repeating: 0, count: C), count: R)
var airCleaner: [(Int, Int)] = []

for y in 0..<R {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    
    for x in 0..<C {
        room[y][x] = line[x]
        if line[x] == -1 { airCleaner.append((x, y))}
    }
}


func spreadDust() {
    var temp: [[Int]] = .init(repeating: .init(repeating: 0, count: C), count: R)
    
    let dx = [0, 0, -1, 1]
    let dy = [-1, 1, 0, 0]
    
    for y in 0..<R {
        for x in 0..<C {
            if room[y][x] == -1 { // 먼지가 아닌 공기청정기
                temp[y][x] = -1
                continue
            }
            
            if room[y][x] < 5 { // 먼지양이 적어서 확산 x
                temp[y][x] += room[y][x]
                continue
            }
            
            var spreadCount = 0
            let nowDustValue = room[y][x]
            for i in 0...3 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if nx < 0 || nx >= C || ny < 0 || ny >= R || room[ny][nx] == -1 { continue }
                
                spreadCount += 1
                temp[ny][nx] += nowDustValue / 5
            }
            temp[y][x] += nowDustValue - (nowDustValue / 5 * spreadCount)
        }
    }
    
    room = temp
}

func executeAirCleaning() {
    let top = airCleaner[0].1
    let bottom = airCleaner[1].1
    
    // 위쪽 (반시계 방향)
    for y in stride(from: top - 1, through: 1, by: -1) {
        room[y][0] = room[y - 1][0]
    }
    for x in 0..<C - 1 {
        room[0][x] = room[0][x + 1]
    }
    for y in 0..<top {
        room[y][C - 1] = room[y + 1][C - 1]
    }
    for x in stride(from: C - 1, through: 2, by: -1) {
        room[top][x] = room[top][x - 1]
    }
    room[top][1] = 0 // 공기청정기 바로 오른쪽은 깨끗한 공기

    // 아래쪽 (시계 방향)
    for y in stride(from: bottom + 1, to: R - 1, by: 1) {
        room[y][0] = room[y + 1][0]
    }
    for x in 0..<C - 1 {
        room[R - 1][x] = room[R - 1][x + 1]
    }
    for y in stride(from: R - 1, through: bottom, by: -1) {
        room[y][C - 1] = room[y - 1][C - 1]
    }
    for x in stride(from: C - 1, through: 2, by: -1) {
        room[bottom][x] = room[bottom][x - 1]
    }
    room[bottom][1] = 0 // 공기청정기 바로 오른쪽은 깨끗한 공기
}

for _ in 1...T {
    spreadDust()
    executeAirCleaning()
}

var total = room.flatMap { $0 }.reduce(0, +)
total += 2 // 공기청정기 값을 제외하기
print(total)
