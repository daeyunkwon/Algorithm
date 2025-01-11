
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
    
    func fetch() -> [T] {
        var arr: [T] = []
        
        var cur = head
        
        while cur != nil {
            arr.append(cur!.value)
            cur = cur?.next
        }
        
        return arr
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
let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }
var card = 1 // 카드 번호는 1부터 시작

// 기술을 역순으로 수행
for item in input.reversed() {
    switch item {
    case 1:
        linkedList.push(card) // 맨 앞에 추가
    case 2:
        if let temp = linkedList.removeHead()?.value {
            linkedList.push(card) // 새 카드 추가
            linkedList.push(temp) // 기존 헤드 복원
        } else {
            linkedList.push(card)
        }
    case 3:
        linkedList.append(card) // 맨 뒤에 추가
    default:
        break
    }
    card += 1
}

// 결과 출력
print(linkedList.fetch().map { String($0) }.joined(separator: " "))
