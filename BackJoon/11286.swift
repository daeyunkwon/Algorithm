import Foundation
struct Heap<T: Comparable> {
    var elements: [T?] = [nil]
    private var size = 0
    
    var top: T? {
        size == 0 ? nil : elements[1]
    }
    
    mutating func insert(_ value: T) {
        elements.append(value)
        size += 1
        
        var index = size
        while index > 1 {
            let parent = index / 2
            if elements[parent]! < elements[index]! { break }
            elements.swapAt(parent, index)
            index = parent
        }
    }
    
    mutating func delete() -> T? {
        if size == 0 { return nil }
        
        let popItem = elements[1]
        elements[1] = elements[size]
        let _ = elements.popLast()
        size -= 1
        
        var index = 1
        while index * 2 <= size {
            let leftChild = index * 2
            let rightChild = index * 2 + 1
            
            var child: Int
            if rightChild <= size && elements[leftChild]! > elements[rightChild]! {
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

struct AbsoluteInt: Comparable {
    let value: Int
    
    static func < (lhs: AbsoluteInt, rhs: AbsoluteInt) -> Bool {
        let la = abs(lhs.value)
        let ra = abs(rhs.value)
        if la == ra { // 절대값이 값으면 본래 값 크기로 비교
            return lhs.value < rhs.value
        }
        return la < ra
    }
}


var minHeap: Heap<AbsoluteInt> = .init()
let n = Int(readLine()!)!
for _ in 0..<n {
    let input = Int(readLine()!)!
    
    if input != 0 {
        minHeap.insert(AbsoluteInt(value: input))
    } else {
        let item = minHeap.delete()?.value ?? 0
        print(item)
    }
}
