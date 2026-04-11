
import Foundation

struct Heap<T: Comparable> {
    private(set) var elements: [T?] = [nil]
    private(set) var size = 0
    
    var isEmpty: Bool {
        return size < 1
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
    
    mutating func pop() -> T? {
        if isEmpty { return nil }
        let popItem = elements[1]
        
        elements[1] = elements[size]
        size -= 1
        var index = 1
        
        while index <= size {
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

let N = Int(readLine()!)!

var adjList: [[Int]] = .init(repeating: [], count: N + 1)

for i in 1...N {
    let num = Int(readLine()!)!
    adjList[num].append(i)
}

func dfs(_ start: Int, _ visited: inout [Bool]) {
    for next in adjList[start] {
        if !visited[next] {
            visited[next] = true
            dfs(next, &visited)
        }
    }
}

for n in 1...N {
    var visited: [Bool] = Array(repeating: false, count: N + 1)
    dfs(n, &visited)
    
    if visited[n] { // 양방향 사이클이 형성된 경우
        minHeap.insert(n)
    }
}

print(minHeap.size)

for num in minHeap.elements {
    if let safeNum = num {
        print(safeNum)
    }
}


