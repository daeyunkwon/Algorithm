
let tc = Int(readLine()!)!

for _ in 0..<tc {
    let n = Int(readLine()!)!
    var parent: [Int] = .init(repeating: 0, count: n + 1)
    
    for _ in 0..<n-1 {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (a, b) = (input[0], input[1])
        parent[b] = a
    }
    
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let target: (Int, Int) = (input[0], input[1])
    
    
    findLCA(a: target.0, b: target.1)
    
    func findLCA(a: Int, b: Int) {
        var visited: Set<Int> = .init() // 첫번째 노드가 최상위 루트 노드까지 가면서 방문했던 모든 부모 노드를 저장
        var x = a
        while x != 0 {
            visited.insert(x)
            x = parent[x]
        }
        
        var y = b
        while y != 0 {
            if visited.contains(y) { // 두번째 노드도 최상위 루트 노드까지 가는데, 첫번째 노드랑 공통된 부모 노드 확인
                print(y)
                return
            }
            
            y = parent[y]
        }
    }
}
