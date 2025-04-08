
struct Heap<T: Comparable> {
    private var elements: [T?] = [nil]
    private var size = 0
    
    var top: T? { // (루트 노드가 가장 최소값)
        size > 0 ? elements[1] : nil
    }
    
    var isEmpty: Bool {
        size > 0 ? false : true
    }
    
    mutating func insert(with element: T) {
        elements.append(element)
        size += 1
        
        var index = size
        while index > 1 { // 노드가 2개 이상 들어있으면 정렬 시작
            let parent = index / 2
            if elements[parent]! <= elements[index]! { break }
            elements.swapAt(parent, index)
            index = parent
        }
    }
    
    mutating func delete() -> T? {
        if size == 0 {
            return nil
        }
        
        let popItem = elements[1]
        let lastItem = elements[size]
        elements[1] = lastItem
        size -= 1
        let _ = elements.popLast()
        
        var index = 1
        
        while index * 2 <= size { // 왼쪽 자식 노드가 있는 경우에만 진행
            let lc = index * 2
            let rc = index * 2 + 1
            var child: Int // 부모 노드로 옮길만한 자식 인덱스
            
            if rc <= size && elements[lc]! > elements[rc]! { // 둘중 더 작은거
                child = rc
            } else {
                child = lc
            }
            
            if elements[index]! <= elements[child]! { break } // 이미 작은면 옮기 필요 없음
            elements.swapAt(index, child)
            index = child
        }
        
        
        return popItem
    }
}

var minHeap: Heap<Int> = .init()

let n = Int(readLine()!)!
for _ in 0..<n {
    let c = Int(readLine()!)!
    minHeap.insert(with: c)
}

var answer = 0
for _ in 1..<n {
    let first = minHeap.delete() ?? 0
    let second = minHeap.delete() ?? 0
    let sum = first + second
    
    if sum != 0 {
        answer += sum
        minHeap.insert(with: sum)
    }
}

print(answer)
