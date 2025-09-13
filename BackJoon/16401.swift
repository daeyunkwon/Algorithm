
let mn = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n) = (mn[0], mn[1]) //조카 수, 과자 수
var lengths: [Int] = readLine()!.split(separator: " ").map { Int($0)! } // 과자 길이
lengths.sort()

func isAvailable(length: Int) -> Bool {
    var coverCount = 0 // 해당 length로 나누어 줄 수 있는 조카 수

    for item in lengths {
        var remainingLength = item
        
        while remainingLength >= length {
            remainingLength -= length
            coverCount += 1
        }
    }
    
    return coverCount >= m
}

var answer: Int = 0
var left = 1
var right = lengths.max()! // 제일 긴 과자 막대기의 길이를 rigth로 잡기

while left <= right {
    let mid = (left + right) / 2
    
    if isAvailable(length: mid) {
        answer = mid
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(answer)
