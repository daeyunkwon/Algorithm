
struct Heap<T: Comparable> {
    private var elements: [T?] = [nil]
    private var size = 0
    
    var top: T? {
        size == 0 ? nil : elements[1]
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
        let _ = elements.popLast()
        
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
            
            if elements[index]! <= elements[child]! { break }
            elements.swapAt(index, child)
            index = child
        }
        
        return popItem
    }
}

var minHeap: Heap<Int> = .init()

let n = Int(readLine()!)!
for _ in 1...n {
    let input = Int(readLine()!)!
    
    if input == 0 {
        let item = minHeap.delete() ?? 0
        print(item)
    } else {
        minHeap.insert(input)
    }
}
