

let n = Int(readLine()!)!
let k = Int(readLine()!)!
var answer = 0

var start = 1
var end = k

while start <= end {
    let mid = (start + end) / 2
    var count = 0
    
    for i in 1...n {
        count += min(mid / i, n)
    }
    
    if count >= k {
        end = mid - 1
        answer = mid
    } else {
        start = mid + 1
    }
}

print(answer)

