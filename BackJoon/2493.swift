
struct Stack<T> {
    private var elements: [T] = []
    
    var isEmpty: Bool {
        elements.isEmpty
    }
    
    var peek: T? {
        elements.last
    }
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        return elements.popLast()
    }
}

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var stack: Stack<(Int, Int)> = .init()

var answer: [Int] = []

for i in 0..<n {
    let currentTop = arr[i]
    
    var receiveTopIndex: Int?
    
    while !stack.isEmpty {
        if stack.peek!.0 > currentTop { // 수신해줄 탑이 있는 경우
            receiveTopIndex = stack.peek!.1
            break
        }
        _ = stack.pop()
    }
    
    if let index = receiveTopIndex {
        answer.append(index)
    } else {
        answer.append(0)
    }
    
    stack.push((currentTop, i + 1))
}

print(
    answer.map { String($0) }.joined(separator: " ")
)
