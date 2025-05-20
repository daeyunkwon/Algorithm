
class Node {
    var child: [String: Node] = [:]
    var isEnd: Bool = false
}

class Trie {
    let root: Node = Node()
    
    func insert(_ list: [String]) {
        var node = root
        
        for next in list {
            if node.child[next] == nil {
                node.child[next] = Node()
            }
            node = node.child[next]!
        }
        
        node.isEnd = true
    }
    
    func searchAll() {
        dfs(node: root, key: nil, depth: 0)
    }
    
    private func dfs(node: Node, key: String?, depth: Int) {
        if let key = key {
            var dash = ""
            for _ in 1..<depth {
                dash += "--"
            }
            print(dash + key)
        }
        
        guard !node.isEnd else { return }
        
        for (key, nextNode) in node.child.sorted(by: { $0.key < $1.key }) {
            dfs(node: nextNode, key: key, depth: depth + 1)
        }
    }
}

let n = Int(readLine()!)!
let trie: Trie = .init()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    trie.insert(Array(input[1..<input.count]))
}

trie.searchAll()
