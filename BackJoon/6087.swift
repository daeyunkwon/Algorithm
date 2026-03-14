
import Foundation

struct Heap<T: Comparable> {
    private var elements: [T?] = [nil]
    private var size = 0
    
    var isEmpty: Bool {
        return size == 0 ? true : false
    }
    
    mutating func insert(_ element: T) {
        elements.append(element)
        size += 1
        var index = size
        
        while index > 1 {
            let parent = index / 2
            if elements[parent]! < elements[index]! { break }
            elements.swapAt(parent, index)
            index = parent
        }
    }
    
    mutating func pop() -> T? {
        if isEmpty { return nil }
        let popItem = elements[1]
        elements[1] = elements[size]
        size -= 1
        _ = elements.popLast()
        
        var index = 1
        while index * 2 <= size {
            let leftChild = index * 2
            let rightChild = index * 2 + 1
            var child: Int
            
            if rightChild <= size && elements[rightChild]! < elements[leftChild]! {
                child = rightChild
            } else {
                child = leftChild
            }
            
            if elements[index]! < elements[child]! { break }
            elements.swapAt(index, child)
            index = child
        }
                
        return popItem
    }
}

struct Node: Comparable {
    let x: Int
    let y: Int
    let cost: Int
    let dir: Int // 0, 1, 2, 3
    
    static func <(lhs: Self, rhs: Self) -> Bool {
        return lhs.cost < rhs.cost
    }
    
    init(_ x: Int, _ y: Int, _ cost: Int, _ dir: Int) {
        self.x = x
        self.y = y
        self.cost = cost
        self.dir = dir
    }
}

let line = readLine()!.split(separator: " ").map { Int($0)! }

let (W, H) = (line[0], line[1])

var board: [[String]] = .init(repeating: .init(repeating: "", count: W), count: H)

var startOrigin: (Int, Int)? = nil
var endOrigin: (Int, Int)? = nil

for y in 0..<H {
    let line = readLine()!.map { String($0) }
    
    for x in 0..<W {
        board[y][x] = line[x]
        
        if line[x] == "C" {
            if startOrigin == nil {
                startOrigin = (x, y)
            } else {
                endOrigin = (x, y)
            }
        }
    }
}

// 상 하 좌 우
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]
// 상하좌우 방향에 따른 거리값 고려하여 3차원 배열
var distance: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: Int.max, count: 4), count: W), count: H)

var minHeap: Heap<Node> = .init()

// 첫 시작 4방향 초기화 작업
let (sx, sy) = startOrigin!
for i in 0...3 {
    distance[sy][sx][i] = 0
    minHeap.insert(Node(sx, sy, 0, i))
}

while !minHeap.isEmpty {
    let now = minHeap.pop()!
    
    if distance[now.y][now.x][now.dir] < now.cost { continue }
    
    // 4방향 확인
    for nextDirection in 0...3 {
        let nx = now.x + dx[nextDirection]
        let ny = now.y + dy[nextDirection]
        
        if nx < 0 || nx >= W || ny < 0 || ny >= H { continue } // 맵 범위 안에 있는지 유효성 검사
        if board[ny][nx] == "*" { continue } // 벽이면 접근 X
        
        var newCost = now.cost
        
        if nextDirection != now.dir { // 방향이 같지 않으면 거울을 사용한 것으로 판단하고 비용 늘리기
            newCost += 1
        }
        
        if newCost < distance[ny][nx][nextDirection] { // 최적 경로 발견 처리
            distance[ny][nx][nextDirection] = newCost
            minHeap.insert(Node(nx, ny, newCost, nextDirection))
        }
    }
}

var answer = Int.max
let (ex, ey) = endOrigin!
for i in 0...3 {
    answer = min(answer, distance[ey][ex][i])
}
print(answer)
