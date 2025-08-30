import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, T) = (line[0], line[1]) // 참가자 수, 술의 총량

var members: [(Int, Int)] = .init(repeating: (0, 0), count: N)

for i in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (L, R) = (line[0], line[1]) // 최소 마셔야되는 술 양, 최대 술 양
    
    members[i] = (L, R)
}


var left = 0
var right = T

while left <= right {
    let mid = (left + right) / 2
    
    if canAccept(alcoholAmount: mid) {
        // 가장 작은 값을 찾기 위해 가능한 경우 더 줄여보기
        right = mid - 1
    } else {
        left = mid + 1
    }
}

left > T ? print(-1) : print(left)


func canAccept(alcoholAmount value: Int) -> Bool {
    var minSum = 0
    var maxSum = 0
    
    for member in members {
        let (minAmount, maxAmount) = (member.0, member.1)
        
        if value < minAmount { return false }
        
        minSum += minAmount
        maxSum += min(maxAmount, value)
    }
    
    return minSum...maxSum ~= T
}
