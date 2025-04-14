
struct Heap {
    private(set) var elements: [Int?] = [nil]
    private(set) var size = 0
    
    enum HeapType {
        case min
        case max
    }
    private let type: HeapType
    
    init(type: HeapType) {
        self.type = type
    }
    
    var isEmpty: Bool {
        size == 0 ? true : false
    }
    
    var top: Int? {
        isEmpty ? nil : elements[1]
    }
    
    mutating func insert(_ element: Int) {
        elements.append(element)
        size += 1
        
        var index = size
        while index > 1 {
            let parent = index / 2
            
            if type == .max {
                if elements[parent]! >= elements[index]! { break }
            } else if type == .min {
                if elements[parent]! <= elements[index]! { break }
            }
            
            elements.swapAt(parent, index)
            index = parent
        }
    }
    
    mutating func delete() -> Int? {
        if isEmpty { return nil }
        
        let popItem = elements[1]
        elements[1] = elements[size]
        size -= 1
        _ = elements.popLast()
        
        var index = 1
        while index * 2 <= size {
            let left = index * 2
            let right = index * 2 + 1
            var child: Int
            
            switch type {
            case .max:
                if right <= size && elements[right]! > elements[left]! {
                    child = right
                } else {
                    child = left
                }
                
                if elements[index]! >= elements[child]! { break }
                
            case .min:
                if right <= size && elements[right]! < elements[left]! {
                    child = right
                } else {
                    child = left
                }
                
                if elements[index]! <= elements[child]! { break }
            }
            
            elements.swapAt(index, child)
            index = child
        }
        
        return popItem
    }
}


// 매 입력마다 정렬된 상태 기준으로 중간값을 출력해야함
let n = Int(readLine()!)!

var maxHeap: Heap = .init(type: .max)
var minHeap: Heap = .init(type: .min)
var answer: String = ""
for i in 1...n {
    let num = Int(readLine()!)!
    
    if maxHeap.size == minHeap.size {
        maxHeap.insert(num)
    } else {
        minHeap.insert(num)
    }
    
    if !minHeap.isEmpty && maxHeap.top! > minHeap.top! {
        let minTop = minHeap.delete()!
        let maxTop = maxHeap.delete()!
        minHeap.insert(maxTop)
        maxHeap.insert(minTop)
    }
    
    answer += "\(maxHeap.top!)\n"
}

print(answer)
