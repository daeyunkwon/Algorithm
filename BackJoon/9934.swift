

let k = Int(readLine()!)! // 트리 깊이
let input = readLine()!.split(separator: " ").map { Int($0)! } // 중위 순회로 방문한 노드 정보

var answer: [[Int]] = .init(repeating: [], count: k)

func inorder(_ left: Int, _ right: Int, _ depth: Int) {
    if left > right { return }
    
    let mid = (left + right) / 2
    let rootNode = input[mid]
    
    answer[depth].append(rootNode) // 각 깊이에 따른 부모 노드 저장
    
    inorder(left, mid - 1, depth + 1)
    inorder(mid + 1, right, depth + 1)
}

inorder(0, input.count - 1, 0)

answer.forEach {
    $0.forEach { print($0, terminator: " ") }
    print()
}
