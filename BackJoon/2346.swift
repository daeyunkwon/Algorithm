

struct Deque<T> {
    private var front: [T] = []
    private var back: [T] = []
    
    init(arr: [T]) {
        self.back = arr
    }
    
    var isEmpty: Bool {
        return front.isEmpty && back.isEmpty
    }
    
    var count: Int {
        return front.count + back.count
    }
    
    var peekRight: T? {
        return back.last ?? front.first
    }
    
    var peekLeft: T? {
        return front.last ?? back.first
    }
    
    mutating func pushRight(_ value: T) {
        back.append(value)
    }
    
    mutating func pushLeft(_ value: T) {
        front.append(value)
    }
    
    mutating func popRight() -> T? {
        if back.isEmpty {
            back = front.reversed()
            front.removeAll()
        }
        return back.popLast()
    }
    
    mutating func popLeft() -> T? {
        if front.isEmpty {
            front = back.reversed()
            back.removeAll()
        }
        return front.popLast()
    }
}


let n = Int(readLine()!)!
var answer: [Int] = []

let input = readLine()!.split(separator: " ").map { Int($0)! }

var deque = Deque(arr: zip(Array(1...n), input).map { ($0, $1) })


let first = deque.popLeft()
answer.append(first!.0)
var offset = first!.1

while !deque.isEmpty {
    
    if offset > 0 {
        for j in 1...offset {
            if let num = deque.popLeft() {
                if j == offset {
                    answer.append(num.0)
                    offset = num.1
                    continue
                }
                deque.pushRight(num)
            }
        }
    } else {
        for j in 1...(offset * -1) {
            if let num = deque.popRight() {
                if j == (offset * -1) {
                    answer.append(num.0)
                    offset = num.1
                    continue
                }
                deque.pushLeft(num)
            }
        }
    }
}

print(answer)


