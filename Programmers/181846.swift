import Foundation

func solution(_ a:String, _ b:String) -> String {
    var answer = ""
    
    let aArray = Array(a)
    let bArray = Array(b)
    
    var i = aArray.count - 1
    var j = bArray.count - 1
    
    var carry = 0
    
    while i >= 0 || j >= 0 || carry > 0 { // 맨 뒤부터 1자리씩 왼쪽으로 올라가면서 덧셈 계산 처리 (Int64 범위를 초과하기 떄문에 다음 방식 사용)
        // 자릿수가 안맞을 경우 0
        let aNum = i >= 0 ? Int(String(aArray[i]))! : 0
        let bNum = j >= 0 ? Int(String(bArray[j]))! : 0
        
        let sum = aNum + bNum + carry
        
        let digit = sum % 10
        answer = String(digit) + answer
        
        carry = sum / 10
        
        // 왼쪽으로 한 자리 이동 처리
        i -= 1
        j -= 1
    }
    
    return answer
}

print(
    
)
