
struct Deque<T> {
    private var enqueue: [T] = []
    private var dequeue: [T] = []
    
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    mutating func peekLeft() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.last
    }
    
    mutating func peekRight() -> T? {
        if enqueue.isEmpty {
            enqueue = dequeue.reversed()
            dequeue.removeAll()
        }
        return enqueue.last
    }
    
    var count: Int {
        return enqueue.count + dequeue.count
    }
    
    mutating func pushLeft(_ value: T) {
        dequeue.append(value)
    }
    
    mutating func pushRight(_ value: T) {
        enqueue.append(value)
    }
    
    mutating func popLeft() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
    
    mutating func popRight() -> T? {
        if enqueue.isEmpty {
            enqueue = dequeue.reversed()
            dequeue.removeAll()
        }
        return enqueue.popLast()
    }
}

var deque = Deque<Int>()

let n = Int(readLine()!)!

for _ in 1...n {
    let command =  readLine()!.split(separator: " ").map { Int($0)! }
    
    switch command[0] {
    case 1:
        deque.pushLeft(command[1])
    case 2:
        deque.pushRight(command[1])
    case 3:
        print(deque.popLeft() ?? -1)
    case 4:
        print(deque.popRight() ?? -1)
    case 5:
        print(deque.count)
    case 6:
        deque.isEmpty ? print(1) : print(0)
    case 7:
        print(deque.peekLeft() ?? -1)
    case 8:
        print(deque.peekRight() ?? -1)
    default: break
    }
}
