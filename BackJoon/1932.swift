



let n = Int(readLine()!)!
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n+1)
var arr: [[Int]] = Array(repeating: [], count: n+1)

for i in 1...n {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    arr[i] = input
}

dp[1][0] = arr[1][0]

if n == 1 {
    print(dp[1][0])
} else {
    for i in 2...n {
        for j in 0...arr[i].count-1 {
            
            if j == 0 {
                dp[i][j] = dp[i-1][j] + arr[i][j]
                continue
            }
            
            if j == i {
                dp[i][j] = dp[i-1][j-1] + arr[i][j]
                continue
            }
            
            dp[i][j] = max(dp[i-1][j-1], dp[i-1][j]) + arr[i][j]
        }
    }

    print(dp[n].max()!)
}


