
import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (line[0], line[1]) // 물품 수, 버틸 수 있는 무게

struct Item {
    let weight: Int
    let value: Int
}

var items: [Item] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let item: Item = .init(weight: input[0], value: input[1])
    items.append(item)
}

// dp[i][w] = i번째 물건까지 고려했을 때, 배낭 무게가 w일 때 얻을 수 있는 최대 가치
var dp: [[Int]] = .init(repeating: .init(repeating: 0, count: k + 1), count: n + 1)

for i in 1...n {
    let itemWeight = items[i-1].weight
    let itemValue = items[i-1].value
    
    for backpackWeight in 0...k {
        
        if backpackWeight < itemWeight {
            dp[i][backpackWeight] = dp[i-1][backpackWeight]
        }
        
        if backpackWeight >= itemWeight {
            dp[i][backpackWeight] = max(dp[i-1][backpackWeight], dp[i-1][backpackWeight-itemWeight] + itemValue)
        }
    }
}

print(dp[n][k])
