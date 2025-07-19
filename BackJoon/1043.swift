import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1]) // 사람 수, 파티 수

let input = readLine()!.split(separator: " ").map { Int($0)! }
let truthKnowerCount: Int = input[0]

if truthKnowerCount == 0 {
    print(m)
    exit(0)
}

var truthKnowers: Set<Int> = .init(input[1...])

var graph: [[Int]] = .init(repeating: [], count: n + 1)
var visited: [Bool] = .init(repeating: false, count: n + 1)
var parties: [[Int]] = []

for _ in 1...m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let count = input[0]
    let people = Array(input[1...])
    parties.append(people)
    
    for i in 0..<count - 1 {
        for j in i+1..<count {
            graph[people[i]].append(people[j])
            graph[people[j]].append(people[i])
        }
    }
}

func dfs(_ startNode: Int) {
    truthKnowers.insert(startNode) // 진실을 알게된 사람
    visited[startNode] = true
    
    for next in graph[startNode] {
        if !visited[next] {
            dfs(next)
        }
    }
}

for knower in truthKnowers {
    if visited[knower] { continue }
    dfs(knower)
}

var answer: Int = 0
for party in parties { // 각 파티에서 진실을 알고 있는 사람이 없는지 확인하기
    var isSucceed: Bool = true
    
    for knower in truthKnowers {
        if party.contains(knower) {
            isSucceed = false
            break
        }
    }
    
    if isSucceed {
        answer += 1
    }
}

print(answer)
