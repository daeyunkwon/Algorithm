
import Foundation

// 각 기능은 진도가 100%일 때 서비스
// 뒤에 있는 기능이 앞에 있는 기능보다 먼저 개발될 수 있고, 이때 뒤에 있는 기능은 앞에 있는 기능이 배포될 때 함께 배포
// 각 배포마다 몇 개의 기능이 배포되는지를 return

struct Queue<T: Comparable> {
    private var elements: [T] = []
    private var index = 0
    
    var isEmpty: Bool {
        return index >= elements.count
    }
    
    var peek: T? {
        if isEmpty { return nil }
        else { return elements[index] }
    }
    
    mutating func insert(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        if isEmpty { return nil }
        defer { index += 1 }
        return elements[index]
    }
}

func solution(_ progresses: [Int], _ speeds: [Int]) -> [Int] {
    var queue: Queue<Int> = .init()
    
    // 배포일 계산
    for i in 0..<progresses.count {
        let remain = 100 - progresses[i]
        
        let day = Int(ceil(Double(remain) / Double(speeds[i])))
        
        queue.insert(day)
    }
        
    
    var result: [Int] = []
    
    while !queue.isEmpty {
        let now = queue.pop()!
        var count = 1
        
        // 다음 순서 작업들도 완료 상태이면 함께 배포 처리
        while !queue.isEmpty && queue.peek! <= now {
            _ = queue.pop()!
            count += 1
        }
        
        result.append(count)
    }
    
    return result
}




