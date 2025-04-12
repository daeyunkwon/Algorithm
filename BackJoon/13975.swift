
struct Heap<T: Comparable> {
    private(set) var elements: [T?] = [nil]
    private(set) var size = 0
    
    var isEmpty: Bool {
        size == 0 ? true : false
    }
    
    var top: T? {
        if isEmpty {
            return nil
        } else {
            return elements[1]
        }
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
            
            if rc <= size && elements[rc]! < elements[lc]! {
                child = rc
            } else {
                child = lc
            }
            
            if elements[child]! >= elements[index]! { break }
            elements.swapAt(child, index)
            index = child
        }
        
        return popItem
    }
}

for _ in 1...Int(readLine()!)! {
    let k = Int(readLine()!)!
    let chapters: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    var answer = 0
    var minHeap: Heap<Int> = .init()
    
    chapters.forEach { minHeap.insert($0) }
    
    while minHeap.size > 1 {
        let firstItem = minHeap.delete() ?? 0
        let secondItem = minHeap.delete() ?? 0
        
        let sum = firstItem + secondItem
        answer += sum
        minHeap.insert(sum)
    }
    
    print(answer)
}
