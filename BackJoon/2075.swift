import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}


struct Heap<T: Comparable> {
    private(set) var elements: [T?] = [nil]
    private(set) var size = 0
    
    var isEmpty: Bool {
        size == 0 ? true : false
    }
    
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

var file = FileIO()
let n = file.readInt()
var heap = Heap<Int>()

for _ in 0..<n {
    for _ in 0..<n {
        let number = file.readInt()
        if heap.size < n {
            heap.insert(number)
        } else if let min = heap.top, number > min {
            heap.delete()
            heap.insert(number)
        }
    }
}
print(heap.top!)
