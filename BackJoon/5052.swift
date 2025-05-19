
class TrieNode {
    var child: [Character: TrieNode] = [:]
    var isEnd: Bool = false
}

class Trie {
    let root = TrieNode()
    
    func insert(_ word: String) -> Bool {
        var node = root
        
        for char in word {
            if node.isEnd { return false } // 다른 번호가 현재 추가중인 번호의 접두어인 경우
            
            if node.child[char] == nil {
                node.child[char] = TrieNode()
            }
            node = node.child[char]!
        }
        
        if !node.child.isEmpty { return false } // 현재 번호가 다른 번호의 접두어인 경우
        
        node.isEnd = true
        return true
    }
}

let tc = Int(readLine()!)!
for _ in 0..<tc {
    let n = Int(readLine()!)!
    let trie = Trie()
    var answer = "YES"
    var numbers: [String] = []
    
    for _ in 0..<n {
        let number = readLine()!
        numbers.append(number)
    }
    
    for number in numbers {
        if !trie.insert(number) { // 삽입하면서 접두어 검사
            answer = "NO"
            break
        }
    }
    
    print(answer)
}
