
import Foundation


/*
 1. a와 b가 모두 홀수라면 a2 + b2 점을 얻습니다.
 2. a와 b 중 하나만 홀수라면 2 × (a + b) 점을 얻습니다.
 3. a와 b 모두 홀수가 아니라면 |a - b| 점을 얻습니다.
 */

func solution(_ a:Int, _ b:Int) -> Int {
    var answer: Int = 0
    
    let calculationCase = checkCase(a, b)
    
    switch calculationCase {
    case .allOdd:
        answer = Int(pow(Double(a), 2.0) + pow(Double(b), 2.0))
        
    case .oneOdd:
        answer = 2 * (a + b)
        
    case .allEven:
        answer = abs(a - b)
    }
    
    return answer
}

enum DiceCase {
    case allOdd
    case oneOdd
    case allEven
}

func checkCase(_ a: Int, _ b: Int) -> DiceCase {
    if (a % 2 != 0) && (b % 2 != 0) {
        return .allOdd
    }
    
    else if (a % 2 == 0) && (b % 2 == 0) {
        return .allEven
    }
    
    else { return .oneOdd }
}

print(
    solution(2, 4)
)
