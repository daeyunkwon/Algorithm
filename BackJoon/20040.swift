
struct UnionFind {
    private var parent: [Int]
    
    init(n: Int) {
        parent = Array(0..<n)
    }
    
    mutating func find(_ x: Int) -> Int {
        if x != parent[x] {
            parent[x] = find(parent[x])
        }
        
        return parent[x]
    }
    
    mutating func union(_ a: Int, _ b: Int) {
        let rootA = find(a)
        let rootB = find(b)
        
        if rootA != rootB {
            parent[rootB] = rootA
        }
    }
}


let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var unionFind: UnionFind = .init(n: n)
var answer: Int = 0

for i in 1...m {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (first, second) = (line[0], line[1])
    
    // 부모노드가 같은 2개의 노드를 연결하면 사이클이 발생하는 것
    // 연결을 하기 전에 같은 두 노드가 같은 부모노드인지 확인
    if unionFind.find(first) == unionFind.find(second) && answer == 0 { answer = i }
    
    unionFind.union(first, second)
}

print(answer)
