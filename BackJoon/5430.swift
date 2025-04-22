
struct Deque<T> {
    private(set) var front: [T] = []
    private(set) var back: [T] = []
    private(set) var isReversed: Bool = false
    
    init(_ elements: [T]) {
        self.front = elements
    }
    
    var count: Int {
        front.count + back.count
    }
    
    var isEmpty: Bool {
        front.isEmpty && back.isEmpty
    }
    
    mutating func reverse() {
        isReversed.toggle()
    }
    
    mutating func insertFront(_ element: T) {
        front.append(element)
    }
    
    mutating func insertBack(_ element: T) {
        back.append(element)
    }
    
    mutating func pop() -> T? {
        if isEmpty { return nil }
        let popItem: T?
        if !isReversed {
            popItem = self.popFront()
        } else {
            popItem = self.popBack()
        }
        return popItem
    }
    
    mutating private func popFront() -> T? {
        if front.isEmpty {
            front = back.reversed()
        }
        
        return front.removeFirst()
    }
    
    mutating private func popBack() -> T? {
        if back.isEmpty {
            back = front.reversed()
        }
        
        return back.removeFirst()
    }
}

let tc = Int(readLine()!)!
for _ in 0..<tc {
    let p = readLine()!.map { Character(String($0)) }
    let n = Int(readLine()!)!
    let arr = readLine()!.filter { if String($0) != "[" && String($0) != "]" { return true }; return false }.split(separator: ",").map { Int($0)! }
    var deque = Deque(arr)
    var isErrorOccurred: Bool = false
    
    for command in p {
        if command == "R" {
            deque.reverse()
        }
        
        if command == "D" {
            if deque.pop() == nil {
                isErrorOccurred = true
                break
            }
        }
    }
    
    if !isErrorOccurred {
        if !deque.isReversed {
            print(String(describing: deque.front).replacing(" ", with: ""))
        } else {
            print(String(describing: deque.back).replacing(" ", with: ""))
        }
    } else {
        print("error")
    }
}
