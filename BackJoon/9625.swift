
// 모든 B는 BA로 바뀌고, A는 B로 바뀐다는 사실을 알게되었다.
// 1 B  0 1
// 2 BA 1 1
// 3 BAB    1 2
// 4 BABBA  2 3
// 5 BABBABAB   3 5
// 6 BABBABABBABBA  5 8
// 7 BABBABABBABBABABBABAB 8 13
// - 다음 A는 이전 B의 개수가 된다?
// - 다음 B는 이전 B와 이전이전 B 개수 합이 된다?

let n = Int(readLine()!)!
var dpA: [Int] = Array(repeating: 0, count: n+1)
var dpB: [Int] = Array(repeating: 0, count: n+1)

dpB[1] = 1

if n > 1 {
    for i in 2...n {
        dpA[i] = dpB[i-1]
        dpB[i] = dpB[i-2] + dpB[i-1]
    }
}

print(dpA[n], dpB[n])
