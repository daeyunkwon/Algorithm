



//let n = Int(readLine()!)!
//var nums: [Int] = [0]
//nums.append(contentsOf: readLine()!.split(separator: " ").map { Int($0)! })
//var dp: [Int] = Array(repeating: 0, count: n+1)
//
//dp[1] = nums[1]
//
//
//    for i in 2...n {
//        for j in 1...i {
//            if nums[j] < nums[i] {
//                dp[i] = max(dp[i], dp[j] + nums[i])
//            }
//        }
//    }
//
//
//print(dp.max()!)



let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var dp = nums // dp 배열을 nums로 초기화 (자기 자신을 포함해야 하므로)

for i in 1..<n {
    for j in 0..<i {
        if nums[j] < nums[i] {
            dp[i] = max(dp[i], dp[j] + nums[i])
        }
    }
}


print(dp.max()!)
