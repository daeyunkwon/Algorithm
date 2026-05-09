import Foundation

func solution(_ a:Int, _ b:Int, _ flag:Bool) -> Int {
    var answer = 0
    
    
    switch flag {
    case true:
        answer = a + b
        
    case false:
        answer = a - b
    }
    
    return answer
}

print(
    
)
