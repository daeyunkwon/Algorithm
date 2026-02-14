
/*
 가능한 2가지 연산:
 - 문자열의 뒤에 A를 추가한다.
 - 문자열의 뒤에 B를 추가하고 문자열을 뒤집는다.
 */

import Foundation

let s = readLine()!
let t = readLine()!

// t에서 문자를 하나씩 계속 제거하여 s로 만들 수 있는지 판별
func isAvailable(_ target: String) -> Bool {
    if target.count == s.count { // 종료 조건
        return target == s
    }
    
    var result = false
    
    if target.last! == "A" {
        let new = target.dropLast()
        result = result || isAvailable(String(new))
    }
    
    if target.first! == "B" {
        let removed = target.dropFirst()
        let new = String(removed.reversed())
        result = result || isAvailable(new)
    }
    
    return result
}

let answer = isAvailable(t) ? 1 : 0
print(answer)
