
//MARK: - 시간 미초과 방법

import Foundation

let S = readLine()!.map { String($0) }
let N = S.count
let dna = ["A", "C", "G", "T"]
var existing = Set<String>()

// 1. 모든 부분 문자열 저장 (최대 길이 5까지만 해도 충분)
for i in 0..<N {
    var temp = ""
    for j in i..<min(N, i + 5) {
        temp += S[j]
        existing.insert(temp)
    }
}

print(existing)

// 2. BFS로 존재하지 않는 가장 짧은 문자열 찾기
var queue = [""]
while !queue.isEmpty {
    let now = queue.removeFirst()
    
    for ch in dna {
        let next = now + ch
        if !existing.contains(next) {
            print(next)
            exit(0)
        }
        queue.append(next)
    }
}



//MARK: - 시간 초과난 방법

final class Node {
    var child: [Character: Node] = [:]
    var isEnd: Bool = false
}

final class Trie {
    private let root: Node = .init()
    
    private func combine(data: [String], current: String, depth: Int, maxDepth: Int) {
        if depth == maxDepth {
            self.insert(current)
            return
        }
        
        for char in data {
            combine(data: data, current: current + char, depth: depth + 1, maxDepth: maxDepth)
        }
    }
    
    func insert(_ word: String) {
        var node = root
        for char in word {
            if node.child[char] == nil {
                node.child[char] = Node()
            }
            node = node.child[char]!
        }
        node.isEnd = true
    }
    
    private func hasDNA(_ word: String) -> Bool {
        var node = root
        for char in word {
            if node.child[char] == nil {
                return false
            }
            node = node.child[char]!
        }
        return node.isEnd
    }
    
    func findMinDNA() {
        let chars: [String] = ["A", "C", "G", "T"]
        var queue: [String] = [""]
        var index = 0
        
        while index < queue.count {
            let current: String = queue[index]
            
            for char in chars {
                let word = current + char
                if !self.hasDNA(word) {
                    print(word)
                    return
                }
                
                queue.append(word)
            }
            
            index += 1
        }
    }
}

// 입력 처리
let input = readLine()!.map { String($0) }
let trie = Trie()

// 모든 부분 문자열을 Trie에 삽입
for i in 0..<input.count {
    for j in i+1...input.count {
        let substring = input[i..<j].joined()
        trie.insert(substring)
    }
}

trie.findMinDNA()
