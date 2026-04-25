import Foundation

func solution(_ start_num:Int, _ end_num:Int) -> [Int] {
    var answer: [Int] = .init(repeating: 0, count: end_num - start_num + 1)
    
    var num = start_num
    
    for i in 0..<answer.count {
        answer[i] = num
        num += 1
    }
    
    return answer
}
