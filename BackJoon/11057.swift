/*
 
n/digit
    0 1 2 3 4 5 6 7 8 9
 0  1 1 1 1 1 1 1 1 1 1
 1 10 9 8 7 6 5 4 3 2 1
 2 55 45 36 28 21 15 10 6 3 1
 3 220 165 ...
 
 - 1자리 숫자인 경우 오르막수 10개
 - 2자리 숫자인 경우 오르막수 55개
 - 3자리 숫자인 경우 오르막수 220개
 
 - 1자리 숫자에서 0으로 시작할 떄 오르막수 개수는 10개
 - 1자리 숫자에서 1으로 시작할 떄 오르막수 개수는 9개
 - 1자리 숫자에서 2으로 시작할 떄 오르막수 개수는 8개
 */

let n = Int(readLine()!)!

var cache: [[Int]] = Array(repeating: Array(repeating: 0, count: 10), count: n + 1)

for i in 0...9 {
    cache[0][i] = 1
}

for i in 1...n {
    
    for j in 0...9 {
        
        for k in j...9 {
            cache[i][j] += cache[i-1][k]
            cache[i][j] %= 10007
        }
    }
}

print(cache[n][0])
