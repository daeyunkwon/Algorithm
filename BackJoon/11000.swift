
struct Heap<T: Comparable> {
    private var elements: [T?] = [nil]
    private(set) var size = 0
    
    var top: T? {
        size == 0 ? nil : elements[1]
    }
    
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
        if size == 0 { return nil }
        
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
            
            if elements[index]! <= elements[child]! { break }
            elements.swapAt(index, child)
            index = child
        }
        
        return popItem
    }
}


var minHeap: Heap<Int> = .init()
let n = Int(readLine()!)!
var classTimes: [(Int, Int)] = []
for _ in 0..<n {
    let classTime = readLine()!.split(separator: " ").map { Int($0)! }
    classTimes.append((classTime[0], classTime[1]))
}

classTimes.sort { $0.0 < $1.0 } // 수업 시작 시간 기준으로 오름차순 정렬

minHeap.insert(classTimes[0].1) // 제일 첫 수업의 종료 시간 넣어두기

for i in 1..<n {
    let (start, end) = classTimes[i]
    
    if !minHeap.isEmpty {
        if minHeap.top! <= start { _ = minHeap.delete() }
    }
    
    minHeap.insert(end)
}

print(minHeap.size)
