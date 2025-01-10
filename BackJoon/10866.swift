
class Node<T: Equatable> {
    var value: T
    var prev: Node?
    var next: Node?
    
    init(value: T, prev: Node? = nil , next: Node? = nil) {
        self.value = value
        self.prev = prev
        self.next = next
    }
}

extension Node: Equatable {
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        lhs.value == rhs.value && lhs.next == rhs.next && lhs.prev == rhs.prev
    }
}

struct DoublyLinkedList<T: Equatable> {
    var head: Node<T>?
    var tail: Node<T>?
    private var count = 0
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var size: Int {
        return count
    }
    
    func searchFromHead(_ findValue: T) -> Node<T>? {
        var cur = head
        while cur?.value != findValue && cur?.next != nil {
            cur = cur?.next
        }
        return cur //못찾으면 nil
    }
    
    func searchFromTail(_ findValue: T) -> Node<T>? {
        var cur = tail
        while cur?.value != findValue && cur?.prev != nil {
            cur = cur?.prev
        }
        return cur
    }
    
    func searchBefore(_ findValue: T) -> Node<T>? {
        var cur = head
        if cur?.value == findValue { return cur }
        while cur?.next?.value != findValue && cur?.next != nil {
            cur = cur?.next
        }
        return cur
    }
    
    //head에 데이터 추가
    mutating func push(_ value: T) {
        let newNode = Node(value: value, next: head)
        head?.prev = newNode
        head = newNode
        
        if tail == nil {
            tail = head
        }
        
        count += 1
    }
    //tail에 데이터 추가
    mutating func append(_ value: T) {
        if isEmpty {
            push(value)
        } else {
            tail?.next = Node(value: value, prev: tail)
            tail = tail?.next
            count += 1
        }
    }
    
    mutating func insert(_ value: T, at findValue: T) {
        if let destination = searchBefore(findValue) {
            if destination == head {
                push(value)
            } else {
                let newNode = Node(value: value, prev: destination, next: destination.next)
                destination.next?.prev = newNode
                destination.next = newNode
                count += 1
            }
        }
    }
    
    mutating func removeHead() -> Node<T>? {
        if !isEmpty {
            let cur = head
            if head == tail { tail = nil }
            head?.next?.prev = head?.prev
            head = head?.next
            count -= 1
            return cur
        } else {
            return nil
        }
    }
    
    mutating func removeTail() -> Node<T>? {
        if !isEmpty {
            let cur = tail
            if head == tail { head = nil }
            tail?.prev?.next = nil
            tail = tail?.prev
            count -= 1
            return cur
        } else {
            return nil
        }
    }
    
    mutating func remove(_ findValue: T) -> Node<T>? {
        if let cur = head {
            if cur.value == findValue {
                if head == tail { tail = nil }
                head = cur.next
                count -= 1
                return cur
            } else {
                if let destination = searchBefore(findValue) {
                    if destination.next == tail {
                        tail = destination
                    }
                    defer { 
                        destination.next = destination.next?.next
                        destination.next?.next?.prev = destination
                    }
                    count -= 1
                    return destination.next
                } else {
                    return nil
                }
            }
        } else {
            return nil
        }
    }
}


var linkedList = DoublyLinkedList<Int>()

for _ in 1...Int(readLine()!)! {
    let command = readLine()!.split(separator: " ").map { String($0) }
    
    switch command[0] {
    case "push_front":
        linkedList.push(Int(command[1])!)
    case "push_back":
        linkedList.append(Int(command[1])!)
        
    case "pop_front":
        if let value = linkedList.removeHead() {
            print(value.value)
        } else {
            print(-1)
        }
    case "pop_back":
        if let value = linkedList.removeTail() {
            print(value.value)
        } else {
            print(-1)
        }
        
    case "size":
        print(linkedList.size)
        
    case "empty":
        linkedList.isEmpty ? print(1) : print(0)
        
    case "front":
        if let value = linkedList.head?.value {
            print(value)
        } else {
            print(-1)
        }
        
    case "back":
        if let value = linkedList.tail?.value {
            print(value)
        } else {
            print(-1)
        }
    default: break
    }
}
