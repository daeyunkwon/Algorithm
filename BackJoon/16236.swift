import Foundation

struct Point {
    let x: Int
    let y: Int
}

struct Fish: Comparable {
    let x: Int
    let y: Int
    let distance: Int
    
    /// 1.거리, 2. y 좌표, 3. x 좌표 순
    static func <(lhs: Self, rhs: Self) -> Bool {
        if lhs.distance == rhs.distance {
            if lhs.y == rhs.y {
                return lhs.x < rhs.x
            }
            return lhs.y < rhs.y
        }
        return lhs.distance < rhs.distance
    }
}

let n = Int(readLine()!)!

var room: [[Int]] = .init(repeating: .init(repeating: 0, count: n), count: n)
var current: Point = .init(x: 0, y: 0)
var isEmpty: Bool = true

var level = 2
var eatCount = 0
var time = 0

for y in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    for x in 0..<n {
        room[y][x] = line[x]
        if line[x] == 9 {
            current = Point(x: x, y: y)
            room[y][x] = 0 // 상어 위치한 곳 0값 처리
        }
        if line[x] != 9 && line[x] > 0 { isEmpty = false }
    }
}

if isEmpty {
    print(time)
    exit(0)
}

/// 레벨 기준 다음 먹어야 하는 물고기
func nextFish(start: Point, level: Int) -> Fish? {
    /// 상, 좌, 우, 하
    let dx = [0, -1, 1, 0]
    let dy = [-1, 0, 0, 1]
    var visited: [[Bool]] = .init(repeating: .init(repeating: false, count: n), count: n)
    var distance: [[Int]] = .init(repeating: .init(repeating: 0, count: n), count: n)
    var fishList: [Fish] = []
    
    visited[start.y][start.x] = true
    var index = 0
    var queue: [Point] = [start]
    
    while index < queue.count {
        let current: Point = queue[index]
        
        for i in 0...3 {
            let nx = dx[i] + current.x
            let ny = dy[i] + current.y
            
            guard nx >= 0 && nx < n && ny >= 0 && ny < n else { continue }
            guard !visited[ny][nx] else { continue }
            guard room[ny][nx] <= level else { continue }
            
            visited[ny][nx] = true
            distance[ny][nx] = distance[current.y][current.x] + 1
            queue.append(Point(x: nx, y: ny))
            
            if room[ny][nx] != 0 && room[ny][nx] < level {
                let value = Fish(x: nx, y: ny, distance: distance[ny][nx])
                fishList.append(value)
            }
        }
        
        index += 1
    }
    
    if fishList.isEmpty {
        return nil
    } else {
        return fishList.sorted().first
    }
}

while true {
    if let nextFish = nextFish(start: current, level: level) {
        time += nextFish.distance
        
        // 먹음 처리
        room[nextFish.y][nextFish.x] = 0
        eatCount += 1
        
        // 성장업
        if eatCount == level {
            eatCount = 0
            level += 1
        }
        
        // 상어 현재 위치 업데이트
        current = Point(x: nextFish.x, y: nextFish.y)
        
    } else {
        break
    }
}

print(time)
