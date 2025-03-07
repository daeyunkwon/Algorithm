
let kn = readLine()!.split(separator: " ").map { Int($0)! }
let k = kn[0] // 랜선 개수
let n = kn[1] // 필요한 랜선 개수
var lengths: [Int] = []
for _ in 0..<k {
    lengths.append(Int(readLine()!)!)
}

var answer = 0 // N개를 만들 수 있는 랜선의 최대 길이

var start = 1
var end = lengths.max()!

while start <= end {
    var count = 0
    let mid = (start + end) / 2 // 랜선 길이
    
    for item in lengths {
//        if item <= mid { continue }
        count += item / mid
    }
    
    if count < n {
        end = mid - 1
    } else {
        start = mid + 1
        answer = mid
    }
}

print(answer)
