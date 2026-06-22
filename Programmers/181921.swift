
import Foundation

func solution(_ l:Int, _ r:Int) -> [Int] {
    var answer: [Int] = []
    
    func dfs(_ current: Int) {
        guard current <= r else { return }
        
        if current >= l {
            answer.append(current)
        }
        
        dfs(current * 10)
        dfs(current * 10 + 5)
    }
    
    dfs(5)
    
    
    return answer.isEmpty ? [-1] : answer.sorted()
}

print(
    solution(10, 20)
)
