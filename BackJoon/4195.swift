
struct UnionFind {
    private var parent: [Int]
    private var size: [Int]
    
    init(n: Int) {
        parent = Array(0..<n)
        size = Array(repeating: 1, count: n)
    }
    
    /// x가 속한 집합의 최상위 루트 노드를 찾기
    mutating private func find(_ x: Int) -> Int {
        if parent[x] != x {
            parent[x] = find(parent[x])
        }
        return parent[x]
    }
    
    mutating func union(a: Int, b: Int) {
        let rootA = find(a)
        let rootB = find(b)
        
        if rootA != rootB { // 최상위 루트 B인 집합을 A에 합치기
            parent[rootB] = rootA
            size[rootA] += size[rootB]
        }
    }
    
    /// node가 속한 집합 안에 총 노드 개수 반환하기
    mutating func size(_ node: Int) -> Int {
        let root = find(node)
        return size[root]
    }
}

let tc = Int(readLine()!)!
for _ in 1...tc {
    let f = Int(readLine()!)! // 친구 관계 수
    var uf: UnionFind = .init(n: f * 2)
    var nameToIndex: [String: Int] = [:] // 친구 이름을 인덱스로 관리하기
    var index = 0
    
    for _ in 1...f {
        let friendNames = readLine()!.split(separator: " ").map { String($0) }
        let (parentName, childName) = (friendNames[0], friendNames[1])
        
        if nameToIndex[parentName] == nil {
            nameToIndex[parentName] = index
            index += 1
        }
        
        if nameToIndex[childName] == nil {
            nameToIndex[childName] = index
            index += 1
        }
        
        uf.union(a: nameToIndex[parentName]!, b: nameToIndex[childName]!)
        
        let answer = uf.size(nameToIndex[parentName]!)
        print(answer)
    }
}
