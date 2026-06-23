import Foundation

func solution(_ arr:[Int], _ query:[Int]) -> [Int] {
    var answer: [Int] = arr
    
    for (i, q) in query.enumerated() {
        if i % 2 == 0 {
            answer = Array(answer[0...q])
        } else {
            answer = Array(answer[q...answer.count-1])
        }
    }
    
    return answer
}

print(
    solution([0, 1, 2, 3, 4, 5], [4, 1, 2])
)


