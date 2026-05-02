import Foundation

func solution(_ intStrs:[String], _ k:Int, _ s:Int, _ l:Int) -> [Int] {
    var answer: [Int] = []
    
    for str in intStrs {
        let chars = str.map { String($0) }
        var temp = ""
        
        for i in s..<s+l {
            temp += chars[i]
        }
        
        let num = Int(temp)!
        
        if num > k {
            answer.append(num)
        }
    }
    
    return answer
}

print(
    solution(["0123456789","9876543210","9999999999999"], 50000, 5, 5)
)
