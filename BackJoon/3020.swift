

let nh = readLine()!.split(separator: " ").map { Int($0)! }
let n = nh[0] // 동굴 길이
let h = nh[1] // 동굴 높이

var topObstruction: [Int] = [] // 종유석
var bottomObstruction: [Int] = [] // 석순
for i in 1...n {
    let height = Int(readLine()!)!
    if i % 2 != 0 {
        bottomObstruction.append(height)
    } else {
        topObstruction.append(height)
    }
}

topObstruction.sort()
bottomObstruction.sort()

func binarySearchLowerBound(_ arr: [Int], _ target: Int) -> Int {
    var start = 0
    var end = arr.count
    
    while start < end {
        let mid = (start + end) / 2
        if arr[mid] >= target {
            end = mid
        } else {
            start = mid + 1
        }
    }
    
    return start // 같거나 큰 값이 처음 나오는 인덱스
}

var minValue = Int.max
var minCount = 0
var dict: [Int: Int] = [:]

for i in 1...h {
    // 구간(i)에 대한 장애물 개수 구하기
    // i는 구간이자 높이 역할
    let bottomCount = bottomObstruction.count - binarySearchLowerBound(bottomObstruction, i)
    let topCount = topObstruction.count - binarySearchLowerBound(topObstruction, h - i + 1)
    
    let total = bottomCount + topCount // 해당 구간의 파괴 장애물 총 개수
    
    dict[total, default: 0] += 1
    
    if total < minValue {
        minValue = total
    }
}

print(minValue, dict[minValue]!)
