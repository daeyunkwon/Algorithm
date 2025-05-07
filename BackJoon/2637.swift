struct Queue {
    private var elements: [Int] = []
    private var index = 0
    
    var isEmpty: Bool {
        index >= elements.count ? true : false
    }
    
    mutating func enqueue(_ element: Int) {
        elements.append(element)
    }
    
    mutating func dequeue() -> Int? {
        if isEmpty { return nil }
        defer { index += 1 }
        return elements[index]
    }
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var inDegree: [Int] = Array(repeating: 0, count: n+1)
var need: [[(Int, Int)]] = Array(repeating: [], count: n+1)
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
var queue = Queue()

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (x, y, k) = (input[0], input[1], input[2]) // 제품 X를 만드는데 중간 부품 혹은 기본 부품 Y가 K개 필요하다
    need[y].append((x, k))
    inDegree[x] += 1
}

for i in 1...n {
    if inDegree[i] == 0 {
        queue.enqueue(i)
    }
}

while !queue.isEmpty {
    let now = queue.dequeue()!
    
    for (next, count) in need[now] {
        if dp[now].allSatisfy({ $0 == 0 }) { // 필요한 부품이 없는 경우로 기본 부품으로 취급
            // now가 기본 부품인 경우
            dp[next][now] += count // next 부품에 기본부품 now가 몇개 필요한지 카운팅
        } else {
            // 기본 부품이 아닌 경우
            for i in 1...n {
                dp[next][i] += dp[now][i] * count // next 부품을 만들기 위해 필요한 n 개의 now 부품 카운팅
            }
        }
        inDegree[next] -= 1
        if inDegree[next] == 0 {
            queue.enqueue(next)
        }
    }
}

for i in 1..<n {
    // dp[n]에는 n 제품을 만들기 위한 부품들의 필요한 개수가 기록되어 있음
    if dp[n][i] > 0 {
        print("\(i) \(dp[n][i])")
    }
}
