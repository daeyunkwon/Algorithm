

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0] // 총 개수
let m = nm[1] // M개의 블루레이에 모든 기타 강의 동영상을 녹화

var arr = readLine()!.split(separator: " ").map { Int($0)! } // 기타 강의 분 단위 길이

var start = arr.max()!
var end = arr.reduce(0, +)
var answer = 0

while start <= end {
    let mid = (start + end) / 2 // 블루레이 크기
    var size = 0
    var count = 1
    
    for bluRay in arr {
        if (size + bluRay) > mid {
            size = 0
            count += 1
        }
        size += bluRay
    }
    
    if count <= m {
        end = mid - 1
        answer = mid
    } else {
        start = mid + 1
    }
}

print(answer)
