


var cache: [[Int]] = Array(repeating: Array(repeating: 0, count: 15), count: 15)

for i in 1...14 {
    cache[0][i] = i //0층
    cache[i][1] = 1 //각층 1호
}

for i in 1...14 {
    for j in 2...14 {
        cache[i][j] = cache[i][j-1] + cache[i-1][j]
    }
}

let tc = Int(readLine()!)!

for _ in 1...tc {
    let k = Int(readLine()!)! //층
    let n = Int(readLine()!)! //호
    print(cache[k][n])
}
