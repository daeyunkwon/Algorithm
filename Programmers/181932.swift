
import Foundation

/*
 mode가 0일 때
 code[idx]가 "1"이 아니면 idx가 짝수일 때만 ret의 맨 뒤에 code[idx]를 추가합니다.
 code[idx]가 "1"이면 mode를 0에서 1로 바꿉니다.
 
 mode가 1일 때
 code[idx]가 "1"이 아니면 idx가 홀수일 때만 ret의 맨 뒤에 code[idx]를 추가합니다.
 code[idx]가 "1"이면 mode를 1에서 0으로 바꿉니다.
 */

enum Mode {
    case zero
    case one
}
var currentMode: Mode = .zero

func solution(_ code:String) -> String {
    var answer: String = ""
    
    let arr = code.map { String($0) }
    
    for i in 0..<arr.count {
        let element = arr[i]
    
        if isModeChanged(value: element) {
            continue
        }
        
        switch currentMode {
        case .zero:
            if i % 2 != 0 { continue }
            answer.append(element)
            
        case .one:
            if i % 2 == 0 { continue }
            answer.append(element)
        }
    }
    
    return answer == "" ? "EMPTY" : answer
}

func isModeChanged(value: String) -> Bool {
    if value == "1" {
        if currentMode == .zero {
            currentMode = .one
        } else {
            currentMode = .zero
        }
        return true
    }
    
    return false
}

print(
    solution("abc1abc1abc")
)
