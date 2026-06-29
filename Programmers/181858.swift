import Foundation

func solution(_ arr:[Int], _ k:Int) -> [Int] {
    var answer: [Int] = []
    
    for item in arr {
        if answer.count >= k { break }
        
        if !answer.contains(item) {
            answer.append(item)
        }
    }
    
    if answer.count < k {
        for _ in answer.count..<k {
            answer.append(-1)
        }
    }
    
    return answer
}

print(
    solution([0, 1, 1, 1, 1], 4)
)
