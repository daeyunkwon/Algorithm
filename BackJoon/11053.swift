

let n = Int(readLine()!)!
let nums: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var dp: [Int] = .init(repeating: 1, count: n)

for i in 0...n-1 {
    for j in 0..<i {
        if nums[j] < nums[i] {
            dp[i] = max(dp[j] + 1, dp[i])
        }
    }
}

print(dp.max()!)
