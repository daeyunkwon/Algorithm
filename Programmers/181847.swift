import Foundation

func solution(_ n_str:String) -> String {
    var answer: String = ""
    
    var isStop = false
    for char in n_str {
        let num = Int(String(char))!
        
        if !isStop {
            if num == 0 {
                continue
            } else {
                isStop = true
            }
        }
        
        answer.append(String(char))
    }
    
    return answer
}

print(
    solution("854020")
)
