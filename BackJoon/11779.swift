
import Foundation

struct Edge: Comparable {
    let destination: Int
    let cost: Int
    
    init(_ destination: Int, _ cost: Int) {
        self.destination = destination
        self.cost = cost
    }
    
    static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.cost < rhs.cost
    }
}

struct Heap<T: Comparable> {
    private var elements: [T?] = [nil]
    private var size = 0
    
    var isEmpty: Bool {
       return size <= 0
    }
    
    mutating func insert(_ element: T) {
        self.elements.append(element)
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
        
        while index * 2 <= size {
            let lc = index * 2
            let rc = index * 2 + 1
            var child: Int
            if rc <= size && elements[rc]! < elements[lc]! {
                child = rc
            } else {
                child = lc
            }
            if elements[index]! <= elements[child]! { break }
            elements.swapAt(index, child)
            index = child
        }
        
        return popItem
    }
}


let n = Int(readLine()!)! // 도시의 개수
let m = Int(readLine()!)! // 버스 개수

var minHeap: Heap<Edge> = .init()

var adjList: [[Edge]] = .init(repeating: [], count: n + 1)
var distance: [Int] = .init(repeating: Int.max, count: n + 1)

for _ in 1...m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (start, end, cost) = (input[0], input[1], input[2])
    let edge: Edge = .init(end, cost)
    adjList[start].append(edge)
}

let lastLine = readLine()!.split(separator: " ").map { Int($0)! }
let (startCityNum, endCityNum) = (lastLine[0], lastLine[1])

var parent = [Int](repeating: 0, count: n + 1)

distance[startCityNum] = 0

minHeap.insert(Edge(startCityNum, 0))

while !minHeap.isEmpty {
    let now = minHeap.pop()!
    
    if now.cost > distance[now.destination] { continue }
    
    for edge in adjList[now.destination] {
        let nextNode = edge.destination
        let newCost = now.cost + edge.cost
        
        if newCost <= distance[nextNode] {
            distance[nextNode] = newCost
            parent[nextNode] = now.destination
            minHeap.insert(Edge(nextNode, newCost))
        }
    }
}

var path: [Int] = []
var current = endCityNum

while current != 0 {
    path.append(current)
    current = parent[current]
}

print(distance[endCityNum])
print(path.count)
print(path.reversed().map { String($0) }.joined(separator: " "))
