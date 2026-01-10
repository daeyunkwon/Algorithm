
// 1 -> 상근
// 2 -> 창영
// 3 -> 상근
// 4 -> 창영
// 5 -> 상근


let n = Int(readLine()!)!

// 돌이 n개일 때 true -> 상근 승
var dp: [Bool] = .init(repeating: false, count: n + 1)

if n >= 1 {
    dp[1] = true
}

if n >= 2 {
    dp[2] = false
}

if n >= 3 {
    dp[3] = true
}

if n >= 4 {
    for n in 4...n {
        dp[n] = !dp[n - 1] || !dp[n - 3] // 상근이가 1개 또는 3개를 기져가고, 창영이 턴으로 넘어간 것을 고려
    }
}

dp[n] == true ? print("SK") : print("CY")
