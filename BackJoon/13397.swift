

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0] // 배열의 크기
let m = nm[1] // 나눌 구간 수
let arr = readLine()!.split(separator: " ").map { Int($0)! }

func isPossible(_ maxRange: Int) -> Bool {
    var count = 1
    var minValue = arr[0]
    var maxValue = arr[0]
    
    for i in 1..<n {
        minValue = min(minValue, arr[i])
        maxValue = max(maxValue, arr[i])
        
        if maxValue - minValue > maxRange {
            // 기준값을 넘어가면 새로운 구간 추가
            count += 1
            maxValue = arr[i]
            minValue = arr[i]
        }
    }
    
    return count <= m
}

var start = 0
var end = arr.max()!
var answer = 0
while start <= end {
    let mid = (start + end) / 2
    
    if isPossible(mid) {
        answer = mid
        end = mid - 1
    } else {
        start = mid + 1
    }
}

print(answer)
