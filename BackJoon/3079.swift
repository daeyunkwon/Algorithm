import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1]) // 심사대 개수, 친구 수

var times: [Int64] = .init(repeating: 0, count: n) // 심사대의 심사 시간들

for i in 0..<n {
    let seconds: Int64 = Int64(readLine()!)!
    times[i] = seconds
}

func isProcessable(seconds: Int64) -> Bool {
    var count: Int64 = 0
    
    for i in 0..<times.count {
        count += seconds / times[i]
        if count >= m { return true } // 처리 가능 확인 시 미리 종료
    }
    
    return false
}

var answer: Int64 = 0
var left: Int64 = 1
var right: Int64 = times.max()! * Int64(m) // 제일 오래걸리는 심사대에서 모든 인원이 심사를 받았을 경우를 최대로 가정
while left <= right {
    let mid = (left + right) / 2
    
    if isProcessable(seconds: mid) { // 해당 시간으로 모든인원수 심사가 가능한지 판별 (가능할 경우 시간을 좀 더 줄여보기)
        right = mid - 1
        answer = mid
    } else {
        left = mid + 1
    }
}

print(answer)
