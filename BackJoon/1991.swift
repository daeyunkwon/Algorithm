
final class Node {
    var parent: Node?
    var leftChild: Node?
    var rightChild: Node?
    
    var data: String
    
    init(data: String) {
        self.data = data
    }
}

final class Tree {
    var root: Node?
    
    func preorder(_ node: Node?, _ value: String = "") -> String {
        guard let node = node else { return value }
        
        let updatedValue = value + node.data
        let left = preorder(node.leftChild, updatedValue)
        let right = preorder(node.rightChild, left)
        
        return right
    }
    
    func inorder(_ node: Node?, _ value: String = "") -> String {
        guard let node = node else { return value }
        
        let left = inorder(node.leftChild, value)
        let updatedValue = left + node.data
        let right = inorder(node.rightChild, updatedValue)
        
        return right
    }
    
    func postorder(_ node: Node?, _ value: String = "") -> String {
        guard let node = node else { return value }

        let left = postorder(node.leftChild, value)
        let right = postorder(node.rightChild, left)
        let updatedValue = right + node.data

        return updatedValue
    }

}

var tree: Tree = .init()
var nodeMap: [String: Node] = [:]

let n = Int(readLine()!)!
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let parentValue = input[0]
    let leftValue = input[1]
    let rightValue = input[2]
    
    let parentNode = nodeMap[parentValue, default: Node(data: parentValue)]
    nodeMap[parentValue] = parentNode
    
    if leftValue != "." {
        let leftNode = nodeMap[leftValue, default: Node(data: leftValue)]
        parentNode.leftChild = leftNode
        leftNode.parent = parentNode
        nodeMap[leftValue] = leftNode
    }
    
    if rightValue != "." {
        let rightNode = nodeMap[rightValue, default: Node(data: rightValue)]
        parentNode.rightChild = rightNode
        rightNode.parent = parentNode
        nodeMap[rightValue] = rightNode
    }
    
    if tree.root == nil {
        tree.root = parentNode
    }
}

let resultPreorder = tree.preorder(tree.root)
print(resultPreorder)

let resultInorder = tree.inorder(tree.root)
print(resultInorder)

let resultPostorder = tree.postorder(tree.root)
print(resultPostorder)
