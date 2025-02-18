


let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var dp: [[Int]] = [nums, nums]

//dp[0] -> 수를 1개도 제거하지 않은 경우
//dp[1] -> 수를 1개 제거한 경우
for i in 1..<n {
        dp[0][i] = max(dp[0][i - 1] + nums[i], dp[0][i])
        dp[1][i] = max(dp[0][i - 1], dp[1][i - 1] + nums[i])
}

print(
    max(dp[0].max()!, dp[1].max()!)
)

