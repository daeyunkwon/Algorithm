

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M, L) = (line[0], line[1], line[2]) // 진행 횟수, 자를 수 있는 지점 개수, 케이크 총 길이
var cutPoint: [Int] = []

for _ in 1...M {
    cutPoint.append(Int(readLine()!)!)
}

for _ in 1...N {
    let count = Int(readLine()!)! // 만족해야 하는 자르는 횟수
    
    var answer = 0 // 가장 작은 조각의 최대 길이
    var left = 1
    var right = L
    
    /// 1~70 에서 binarySearch 진행
    while left <= right {
        let mid = (left + right) / 2
        
        if canCut(minLength: mid) {
            left = mid + 1
            answer = mid
        } else {
            right = mid - 1
        }
    }
    
    print(answer)
    
    
    func canCut(minLength: Int) -> Bool {
        var cutCount = 0
        var last = 0 // 마지막으로 자른 지점
        
        for cut in cutPoint {
            if (cut - last) >= minLength { // minLength 이상의 길이가 되면, 구간 자르기 허용
                cutCount += 1
                last = cut
            }
        }
        
        if (L - last) >= minLength { // 제일 마지막 포인트를 자르고 남은 길이도 체크
            cutCount += 1
        }
        
        return cutCount > count
    }
}



