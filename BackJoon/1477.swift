
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M, L) = (line[0], line[1], line[2]) // 휴게소 개수, 추가 건설 개수, 고속도로 길이

var restList: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
restList.append(0)
restList.append(L)
restList.sort()

func canBuild(max: Int) -> Bool {
    var needCount: Int = 0 // 최대 거리값(max)을 기준으로 지어야 할 휴게소 개수
    
    for i in 1..<restList.count {
        let distance = restList[i] - restList[i - 1]
        
        needCount += distance / max
        
        if distance % max == 0 { needCount -= 1 } // 정확히 나누어 떨어지는 경우 불필요하게 하나 더 세워진 셈
    }
    
    return needCount <= M
}

var left = 1
var right = L
var answer = 0

while left <= right {
    let mid = (left + right) / 2 // 시도하는 최대 거리값
    
    if canBuild(max: mid) {
        // 최대 거리값을 더 줄여보는 것
        right = mid - 1
        answer = mid
    } else {
        // 더 이상 최대 거리값을 줄일 수 없는 경우
        left = mid + 1
    }
}

print(answer)


