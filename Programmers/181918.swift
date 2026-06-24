import Foundation

func solution(_ arr:[Int]) -> [Int] {
    var answer: [Int] = []
    var i: Int = 0
    
    while i < arr.count {
        if answer.isEmpty {
            answer.append(arr[i])
            i += 1
            continue
        }
        
        if answer.last! < arr[i] {
            answer.append(arr[i])
            i += 1
        } else {
            _ = answer.popLast()
        }
    }
    
    return answer
}

print(
    solution([1, 4, 2, 5, 3])
)
