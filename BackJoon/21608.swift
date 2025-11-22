
import Foundation

//  학생의 만족도는 0: 0, 1: 1, 2: 10, 3: 100, 4: 1000
// 자리 규칙:
// 1. 비어있는 칸 중에서 좋아하는 학생이 인접한 칸에 가장 많은 칸으로 자리를 정한다.
// 2. 1을 만족하는 칸이 여러 개이면, 인접한 칸 중에서 비어있는 칸이 가장 많은 칸으로 자리를 정한다.
// 3. 2를 만족하는 칸도 여러 개인 경우에는 행의 번호가 가장 작은 칸으로, 그러한 칸도 여러 개이면 열의 번호가 가장 작은 칸으로 자리를 정한다.

struct Room: Comparable {
    let x: Int
    let y: Int
    var likeCount: Int
    var emptyCount: Int
    
    static func <(lhs: Self, rhs: Self) -> Bool {
        if lhs.likeCount != rhs.likeCount {
            return lhs.likeCount < rhs.likeCount // 기준1: 인접칸에 좋아하는 학생 존재 수
        }
        
        if lhs.emptyCount != rhs.emptyCount {
            return lhs.emptyCount < rhs.emptyCount // 기준2: 비어있는 인접칸 개수
        }
        
        if lhs.y != rhs.y {
            return lhs.y < rhs.y // 기준3: 행의 번호 크기순
        }
        
        return lhs.x < rhs.x // 기준4: 열의 번호 크기순
    }
}

struct Heap<T: Comparable> {
    private var elements: [T?] = [nil]
    private var size = 0
    
    var isEmpty: Bool {
        return size == 0
    }
    
    mutating func insert(_ element: T) {
        elements.append(element)
        size += 1
        var index = size
        while index > 1 {
            let parent = index / 2
            if elements[parent]! >= elements[index]! { break }
            elements.swapAt(parent, index)
            index = parent
        }
    }
    
    mutating func delete() -> T? {
        if self.isEmpty { return nil }
        
        let popItem = elements[1]
        elements[1] = elements[size]
        size -= 1
        var index = 1
        
        while index * 2 <= size {
            let left = index * 2
            let right = index * 2 + 1
            let child: Int
            
            if right <= size && elements[right]! > elements[left]! {
                child = right
            } else {
                child = left
            }
            
            if elements[index]! >= elements[child]! { break }
            
            elements.swapAt(index, child)
            index = child
        }
        
        return popItem
    }
}


let n = Int(readLine()!)!
var board: [[Int]] = .init(repeating: .init(repeating: 0, count: n), count: n)
var likeDict: [Int: [Int]] = [:]
var order: [Int] = []

for _ in 1...n*n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (student, likes) = (input[0], Array(input[1...4]))
    order.append(student)
    likeDict[student] = likes
}

let dx: [Int] = [0, 0, -1, 1]
let dy: [Int] = [-1, 1, 0, 0]

for student in order {
    var maxHeap: Heap<Room> = .init()
    
    // 모든 칸에 접근해서, 현재 학생을 배치할 수 있는 자리 정보 뽑아오기
    for y in 0..<n {
        for x in 0..<n {
            if board[y][x] != 0 { continue }
            
            var room = Room(x: x, y: y, likeCount: 0, emptyCount: 0)
            
            for i in 0...3 {
                let nx = dx[i] + x
                let ny = dy[i] + y
                
                if nx < 0 || nx >= n || ny < 0 || ny >= n { continue }
                
                if board[ny][nx] == 0 {
                    room.emptyCount += 1
                }
                
                else if likeDict[student]!.contains(board[ny][nx]) {
                    room.likeCount += 1
                }
            }
            
            maxHeap.insert(room)
        }
    }
    
    // best 자리 배치 처리
    if !maxHeap.isEmpty {
        let bestRoom = maxHeap.delete()!
        board[bestRoom.y][bestRoom.x] = student
    }
}

// 만족도 총합 구하기
var answer = 0

for y in 0..<n {
    for x in 0..<n {
        let student = board[y][x]
        var count = 0
        
        for i in 0...3 {
            let nx = dx[i] + x
            let ny = dy[i] + y
            
            if nx < 0 || nx >= n || ny < 0 || ny >= n { continue }
            
            if likeDict[student]!.contains(board[ny][nx]) {
                count += 1
            }
        }
        
        switch count {
        case 1:
            answer += 1
        case 2:
            answer += 10
        case 3:
            answer += 100
        case 4:
            answer += 1000
        default: break
        }
    }
}

print(answer)
