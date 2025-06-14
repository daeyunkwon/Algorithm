

struct Assignment: Comparable {
    let deadline: Int
    let score: Int
    
    static func <(lhs: Self, rhs: Self) -> Bool { // 비교를 실행할 땐 점수 크기가 큰 순으로
        return lhs.score < rhs.score
    }
}

struct Heap<T: Comparable> {
    private var elements: [T?] = [nil]
    private var size: Int = 0
    
    var isEmpty: Bool {
        size <= 0
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
        if isEmpty { return nil }
        
        let popItem = elements[1]
        elements[1] = elements[size]
        size -= 1
        _ = elements.popLast()
        
        var index = 1
        while index * 2 <= size {
            let lc = index * 2
            let rc = index * 2 + 1
            var child: Int
            if rc <= size && elements[rc]! > elements[lc]! {
                child = rc
            } else {
                child = lc
            }
            
            if elements[index]! >= elements[child]! { break }
            elements.swapAt(index, child)
            index = child
        }
        
        return popItem
    }
}

let n = Int(readLine()!)!
var assignments: [Assignment] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (d, w) = (input[0], input[1]) // 마감일까지 남은 일수, 과제 점수
    let assignment: Assignment = .init(deadline: d, score: w)
    assignments.append(assignment)
}

assignments.sort { $0.deadline > $1.deadline } // 마감일이 많이 남은 순으로 정렬

var maxHeap: Heap<Assignment> = .init()
var index: Int = 0 // assignments 배열을 탐색할 때 진행한 인덱스를 기억
var maxDay: Int = assignments.map { $0.deadline }.max()!
var answer: Int = 0

for day in stride(from: maxDay, through: 1, by: -1) {
    // day 이상의 마감일을 가진 과제들을 모두 최대힙에 넣고, 그 중에서 점수가 가장 높은 과제를 선별
    while index < assignments.count && assignments[index].deadline >= day {
        maxHeap.insert(assignments[index])
        index += 1
    }
    
    if let assignment = maxHeap.delete() {
        answer += assignment.score
    }
}

print(answer)
