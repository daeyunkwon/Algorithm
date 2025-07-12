
struct Gem: Comparable {
    let weight: Int
    let price: Int
    
    static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.price < rhs.price
    }
}

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
        while index > 1 {
            let parent = index / 2
            if elements[parent]! >= elements[index]! { break }
            elements.swapAt(parent, index)
            index = parent
        }
    }
    
    mutating func delete() -> T? {
        if size == 0 { return nil }
        
        let popItem = elements[1]
        elements[1] = elements[size]
        _ = elements.popLast()
        size -= 1
        
        var index = 1
        while index * 2 <= size {
            let lc = index * 2
            let rc = index * 2 + 1
            var child: Int
            if rc <= size && elements[rc]! > elements[lc]! {
                child = rc
            } else {
                child = lc
            }
            if elements[index]! >= elements[child]! { break }
            elements.swapAt(index, child)
            index = child
        }
        
        return popItem
    }
}

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nk[0] // 보석 개수
let k = nk[1] // 가방 개수

var gems: [Gem] = []
for _ in 1...n {
    let mv = readLine()!.split(separator: " ").map { Int($0)! }
    let (m, v) = (mv[0], mv[1]) // 보석 무게, 가격
    let gem = Gem(weight: m, price: v)
    gems.append(gem)
}

var bags: [Int] = []
for _ in 1...k {
    let c = Int(readLine()!)! // 각 가방의 최대 무게, 최대 무게 미만의 무게를 가진 보석만 담을 수 있음
    bags.append(c)
}

// 가방과 보석 무게를 오름차순 정렬
gems = gems.sorted { $0.weight < $1.weight }
bags = bags.sorted { $0 < $1 }
var gemIndex: Int = 0
var answer: Int = 0
var maxHeap: Heap<Gem> = .init()

for bagWeight in bags {
    
    while gemIndex < gems.count && gems[gemIndex].weight <= bagWeight {
        // 현재 가방 무게보다 작거나 같은 무게를 가진 보석들을 최대힙에 넣어두기
        maxHeap.insert(gems[gemIndex])
        gemIndex += 1
    }
    
    if !maxHeap.isEmpty {
        let bestGem = maxHeap.delete()! // 최대힙 첫번째 아이템은 최고의 가격을 가진 보석!
        answer += bestGem.price
    }
}

print(answer)
