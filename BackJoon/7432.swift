
final class Node {
    var child: [String: Node] = [:]
    var isEnd: Bool = false
}

final class Trie {
    let root: Node = .init()
    
    func insert(_ path: [String]) {
        var node = root
        
        for filename in path {
            if node.child[filename] == nil {
                node.child[filename] = Node()
            }
            
            node = node.child[filename]!
        }
        
        node.isEnd = true
    }
    
    func searchAll() {
        dfs(nextNode: root, filename: nil, depth: 0)
    }
    
    private func dfs(nextNode: Node, filename: String?, depth: Int) {
        if let filename = filename {
            var space: String = ""
            for _ in 1..<depth {
                space += " "
            }
            print(space + filename)
        }
        
        guard !nextNode.child.isEmpty else { return }
        
        for (filename, nextNode) in nextNode.child.sorted(by: { $0.key < $1.key }) {
            dfs(nextNode: nextNode, filename: filename, depth: depth + 1)
        }
    }
}

let n = Int(readLine()!)!
var trie: Trie = .init()
for _ in 0..<n {
    let path = readLine()!.split(separator: "\\").map { String($0) }
    trie.insert(path)
}

trie.searchAll()
