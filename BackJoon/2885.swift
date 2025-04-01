

var k = Int(readLine()!)!
var size = 1
for i in 1... {
    size *= 2
    
    if size >= k {
        break
    }
}

let answer: (Int, Int)
answer.0 = size

var count = 0

while k > 0 {
    // 반쪽은 상근이 주고, 반쪽은 다시 자르는 과정을 진행
    if k >= size {
        k -= size
    } else {
        size /= 2
        count += 1
    }
}

answer.1 = count

print(answer.0, answer.1)
