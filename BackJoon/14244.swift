
// 0-1-2 로 연결되어 있다면 0도 리프노드로 취급 가능하고, 2도 리프노드로 취급 가능하다.

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var leaf = 0
if m == 2 {
    leaf = 1  // 중심 노드를 리프로 포함
}

var lastLeaf = 0

for i in 1..<n {
    if m > leaf {
        print("0 \(i)")
        leaf += 1
    } else {
        print("\(lastLeaf) \(i)")
    }
    lastLeaf = i
}
