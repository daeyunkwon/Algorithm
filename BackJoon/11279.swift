

struct Heap<T: Comparable> {
    private var elements: [T?] = [nil]
    private var size: Int = 0
    
    var isEmpty: Bool {
        size == 0 ? true : false
    }
    
    mutating func insert(_ element: T) {
        elements.append(element)
        size += 1
        
        var index = size
        while index >= 2 {
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
        let _ = elements.popLast()
        
        var index = 1
        while index * 2 <= size {
            let leftChild = index * 2
            let rightChild = index * 2 + 1
            var child: Int
            
            if rightChild <= size && elements[leftChild]! < elements[rightChild]! {
                child = rightChild
            } else {
                child = leftChild
            }
            
            if elements[child]! <= elements[index]! { break }
            
            elements.swapAt(child, index)
            index = child
        }
        
        return popItem
    }
}


var maxHeap: Heap<Int> = .init()
let n = Int(readLine()!)!
for _ in 1...n {
    let input = Int(readLine()!)!
    
    if input != 0 {
        maxHeap.insert(input)
    } else {
        let item = maxHeap.delete() ?? 0
        print(item)
    }
}
