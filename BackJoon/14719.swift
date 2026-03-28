import Foundation

let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let (y, x) = (firstLine[0], firstLine[1])

let blocks = readLine()!.split(separator: " ").map { Int($0)! }

struct Item {
    let index: Int
    let height: Int
}

var stack: [Item] = []
var answer: Int = 0

for i in 0..<blocks.count {
    
    let now: Item = .init(index: i, height: blocks[i])
    
    while !stack.isEmpty && now.height > stack.last!.height { // now는 오른쪽 벽이 되고, stack.last는 왼쪽 벽과 오른쪽 벽 사이의 웅덩이
        
        let previous = stack.popLast()!
        
        if stack.isEmpty { break } // 왼쪽 벽이 없는 경우
        
        let leftBlock = stack.last!
        
        let height = min(leftBlock.height, now.height) - previous.height
        
        let distance = now.index - leftBlock.index - 1
        
        answer += distance * height
    }
    
    stack.append(now)
}

print(answer)



//struct Queue<T> {
//    private var elements: [T] = []
//    private var index = 0
//    
//    var isEmpty: Bool {
//        return index >= elements.count
//    }
//    
//    var peek: T {
//        return elements[index]
//    }
//    
//    mutating func insert(_ element: T) {
//        elements.append(element)
//    }
//    
//    mutating func pop() -> T? {
//        if isEmpty { return nil }
//        defer { index += 1 }
//        return elements[index]
//    }
//}
//
//struct Item {
//    let index: Int
//    let height: Int
//}
//
//var queue: Queue<Item> = .init()
//
//var answer: Int = 0
//
//for i in 0..<blocks.count {
//    
//    let now = blocks[i]
//    
//    if now == 0 { continue }
//    
//    if queue.isEmpty {
//        let item: Item = .init(index: i, height: now)
//        queue.insert(item)
//        continue
//    }
//        
//    let previous = queue.peek
//    
//    if now >= previous.height {
//        _ = queue.pop()
//        
//        if i - previous.index <= 1 {
//            queue.insert(.init(index: i, height: now))
//            continue
//        }
//        
//        // 여기까지 빗물 계산
//        for j in previous.index+1...i-1 {
//            let h = blocks[j]
//            answer += previous.height - h
//        }
//        
//        // 그리고 now를 새로운 기준점으로
//        queue.insert(.init(index: i, height: now))
//    }
//    
//    if isLastIndex(i) && !queue.isEmpty {
//        let referenceHeight = min(queue.peek.height, now)
//        
//        if i - previous.index <= 1 {
//            continue
//        }
//        
//        for j in previous.index+1...i-1 {
//            let h = referenceHeight - blocks[j]
//            answer += h
//        }
//    }
//}
//
//private func isLastIndex(_ index: Int) -> Bool {
//    return index == blocks.count - 1
//}
//
//print(answer)
