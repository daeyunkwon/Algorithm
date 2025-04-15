

// 데드라인이 최소면서, 컵라면 수가 많은 것
// 동일한 데드라인이 있다면 컵라면 수가 많은 것을
// 동일한 데드라인 중에서는 오직 하나만 풀 수 있음

struct Heap<T: Comparable> {
    private(set) var elements: [T?] = [nil]
    private(set) var size = 0
    
    var isEmpty: Bool {
        size == 0 ? true : false
    }
    
    mutating func insert(_ element: T) {
        elements.append(element)
        size += 1
        
        var index = size
        while index > 1 {
            let parent = index / 2
            if elements[parent]! <= elements[index]! { break }
            elements.swapAt(parent, index)
            index = parent
        }
    }
    
    mutating func delete() -> T? {
        if isEmpty {
            return nil
        }
        
        let popItem = elements[1]
        elements[1] = elements[size]
        size -= 1
        _ = elements.popLast()
        
        var index = 1
        while index * 2 <= size {
            let left = index * 2
            let right = index * 2 + 1
            var child: Int
            
            if right <= size && elements[right]! < elements[left]! {
                child = right
            } else {
                child = left
            }
            
            if elements[child]! >= elements[index]! { break }
            
            elements.swapAt(child, index)
            index = child
        }
        
        return popItem
    }
}

struct Assignment: Comparable {
    var deadline: Int
    var cupramen: Int
    
    static func < (lhs: Assignment, rhs: Assignment) -> Bool {
        if lhs.deadline != rhs.deadline {
            return lhs.deadline < rhs.deadline
        } else {
            return lhs.cupramen < rhs.cupramen
        }
    }
    
    static func == (lhs: Assignment, rhs: Assignment) -> Bool {
        return lhs.deadline == rhs.deadline && lhs.cupramen == rhs.cupramen
    }
}

var minHeap: Heap<Int> = .init()
var problems: [Assignment] = []
var answer = 0

let n = Int(readLine()!)!
for _ in 1...n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let assign = Assignment(deadline: input[0], cupramen: input[1])
    problems.append(assign)
}

problems.sort()

for problem in problems {
    minHeap.insert(problem.cupramen)
    
    // 데드라인보다 문제 수가 많아지면
    // 현재까지 선택된 문제들 중 가장 작은 컵라면 수를 제거하는 것
    if minHeap.size > problem.deadline {
        _ = minHeap.delete()
    }
}

while !minHeap.isEmpty {
    answer += minHeap.delete()!
}
print(answer)
