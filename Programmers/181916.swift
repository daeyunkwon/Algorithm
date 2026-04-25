import Foundation

/*
 1. 네 주사위에서 나온 숫자가 모두 p로 같다면 1111 × p점을 얻습니다.
 2. 세 주사위에서 나온 숫자가 p로 같고 나머지 다른 주사위에서 나온 숫자가 q(p ≠ q)라면 (10 × p + q)2 점을 얻습니다.
 3. 주사위가 두 개씩 같은 값이 나오고, 나온 숫자를 각각 p, q(p ≠ q)라고 한다면 (p + q) × |p - q|점을 얻습니다.
 4. 어느 두 주사위에서 나온 숫자가 p로 같고 나머지 두 주사위에서 나온 숫자가 각각 p와 다른 q, r(q ≠ r)이라면 q × r점을 얻습니다.
 5. 네 주사위에 적힌 숫자가 모두 다르다면 나온 숫자 중 가장 작은 숫자 만큼의 점수를 얻습니다.
 */




func solution(_ a:Int, _ b:Int, _ c:Int, _ d:Int) -> Int {
    
    var answer: Int = 0
    var dict: [Int: Int] = [:] // 숫자: 개수
    
    dict[a, default: 0] += 1
    dict[b, default: 0] += 1
    dict[c, default: 0] += 1
    dict[d, default: 0] += 1
    
    var sameNums: [Int] = []
    var sameNumCount = 0
    
    sameNumCount = dict.values.max()!
    
    for (key, value) in dict {
        if value == sameNumCount {
            if !sameNums.contains(key) {
                sameNums.append(key)
            }
        }
    }
    
    switch sameNumCount {
    case 4:
        answer = 1111 * a
        
    case 3:
        var sameNum: Int = 0
        var differentNum: Int = 0
        for (key, value) in dict {
            if value == 1 {
                differentNum = key
            } else {
                sameNum = key
            }
        }
        
        answer = Int(pow(Double(10*sameNum+differentNum), 2.0))
        
    case 2:
        
        if sameNums.count == 2 {
            var firstNum: Int = 0
            var secondNum: Int = 0
            for (key, value) in dict {
                if firstNum == 0 {
                    firstNum = key
                    continue
                }
                
                if firstNum != 0 && key != firstNum {
                    secondNum = key
                }
            }
            answer = (firstNum + secondNum) * abs(firstNum - secondNum)
        }
        
        if sameNums.count == 1 {
            var firstNum = 0
            var secondNum = 0
            
            for num in [a, b, c, d] {
                if firstNum == 0 && num != sameNums[0] {
                    firstNum = num
                    continue
                }
                
                if num != sameNums[0] {
                    secondNum = num
                }
            }
            
            answer = firstNum * secondNum
        }
        
    case 1:
        answer = [a, b, c, d].min()!
        
    default: break
    }
    
    return answer
}

print(
    solution(2, 5, 2, 6)
)


