
let n = Int(readLine()!)!
var graph: [[Int]] = .init(repeating: [], count: n)
var rootNode: Int!
let arr: [Int] = readLine()!.split(separator: " ").map { Int($0)! }

for i in 0..<arr.count {
    if arr[i] == -1 {
        rootNode = i
        continue
    }
    
    graph[arr[i]].append(i)
}

let removeNode = Int(readLine()!)!
var visited: [Bool] = .init(repeating: false, count: n)
visited[removeNode] = true

var answer = 0

func dfs(start: Int) {
    var stack: [Int] = []
    visited[start] = true
    stack.append(start)
    
    while !stack.isEmpty {
        let currentNode = stack.popLast()!
        var isLeafNode = true
        
        for next in graph[currentNode] {
            if next != removeNode { isLeafNode = false } // 연결된 자식 노드가 있는 경우
            
            if !visited[next] {
                visited[next] = true
                stack.append(next)
            }
        }
        
        if isLeafNode { answer += 1 }  // for문이 수행되지 않은 경우 연결된 자식 노드가 없는 것으로 판단
    }
}

if removeNode != rootNode { // 루트 노드를 제거할 경우 남아있는 노드가 없기 때문에 dfs 미실행
    dfs(start: rootNode)
}

print(answer)
