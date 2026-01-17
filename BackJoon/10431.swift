

import Foundation

// 키 순서대로 번호를 부여한다. 번호를 부여할 땐 키가 가장 작은 아이가 1번, 그 다음이 2번, ... , 가장 큰 아이가 20번이 된다
// 1. 자기 앞에 자기보다 키가 큰 학생이 없다면 그냥 그 자리에 서고 차례가 끝난다.
// 2. 자기 앞에 자기보다 키가 큰 학생이 한 명 이상 있다면 그중 가장 앞에 있는 학생(A)의 바로 앞에 선다. 이때, A부터 그 뒤의 모든 학생들은 공간을 만들기 위해 한 발씩 뒤로 물러서게 된다.

struct Queue {
    private var elements: [Int]
    private var index: Int = 0
    
    var isEmpty: Bool {
        return index >= elements.count
    }
    
    init(_ array: [Int]) {
        self.elements = array
    }
    
    mutating func pop() -> Int? {
        if isEmpty { return nil }
        let item = elements[index]
        index += 1
        return item
    }
}

let p = Int(readLine()!)!

for i in 1...p {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    var queue: Queue = .init(Array(input[1...]))
    var count: Int = 0
    var arr: [Int] = []
    
    while !queue.isEmpty {
        let student = queue.pop()!
        
        arr.append(student)
        
        if arr.count == 1 { continue }
        
        sort(&arr, &count)
    }
    
    print(i, count)
}

func sort(_ arr: inout [Int], _ count: inout Int) {
    guard arr[arr.count - 1] < arr[arr.count - 2] else { return }
    
    for i in stride(from: arr.count - 1, through: 1, by: -1) {
        let now = arr[i]
        let next = arr[i - 1]
        
        if next < now { return }
        
        arr.swapAt(i, i - 1)
        count += 1
    }
}
