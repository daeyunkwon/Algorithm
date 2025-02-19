import Foundation

let n = Int(readLine()!)!
var colors = Array(repeating: Array(repeating: 0, count: 3), count: n+1)
var dp = Array(repeating: Array(repeating: 0,count: 3), count: n+1)

for i in 1...n {
    colors[i] = readLine()!.split(separator: " ").map{Int($0)!}
}

var result = 1000000
for j in 0..<2 {
    let a = (j+1)%3
    let b = (j+2)%3
    
    dp[1][j] = colors[1][j]
    dp[1][a] = 1000000
    dp[1][b] = 1000000
    
    for i in 2...n {
        dp[i][0] = colors[i][0] + min(dp[i-1][1], dp[i-1][2])
        dp[i][1] = colors[i][1] + min(dp[i-1][0], dp[i-1][2])
        dp[i][2] = colors[i][2] + min(dp[i-1][0], dp[i-1][1])
    }
    
    result = min(result, dp[n][a], dp[n][b])

}

print(result)
