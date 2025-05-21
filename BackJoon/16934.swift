
class Node {
    var child: [Character: Node] = [:]
    var count: Int = 0
}

class Trie {
    let root: Node = Node()
    var dict: [String: Int] = [:]
    
    func insert(_ word: String) -> String {
        dict[word, default: 0] += 1
        
        if dict[word]! >= 2 {
            return word + "\(dict[word]!)"
        }
        
        var node = root
        var alias: String = ""
        var check: Bool = false
        
        for char in word {
            if !check { alias += String(char) }
            
            if node.child[char] == nil {
                node.child[char] = Node()
                check = true
            }
            
            node = node.child[char]!
            node.count += 1
        }
        
        return check ? alias : word
    }
}

let n = Int(readLine()!)!
let trie: Trie = .init()
for _ in 0..<n {
    let nickname = readLine()!
    let answer = trie.insert(nickname)
    print(answer)
}


