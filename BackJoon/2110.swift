
let nc = readLine()!.split(separator: " ").map { Int($0)! }
let n = nc[0]
let c = nc[1]
var home: [Int] = []
for _ in 1...n {
    home.append(Int(readLine()!)!)
}
home.sort()

var start = 1
var end = home[n-1] - home[0]
var answer = 0

while start <= end {
    var count = 1 // home[0]에 공유기 설치한 것으로 진행, 현재까지 설치한 공유기 개수
    var previousHome = home[0]
    let mid = (start + end) / 2 // 집 사이의 간격 역할
    
    for i in 1...n-1 {
        let currentHome = home[i]
        if currentHome - previousHome >= mid {
            count += 1
            previousHome = currentHome
        }
    }
    
    if count < c {
        end = mid - 1
    } else {
        answer = mid
        start = mid + 1
    }
}

print(answer)
