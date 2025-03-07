


let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0] // 나무 수
let m = nm[1] // 집에 가져가는 나무 길이
let trees: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var answer = 0

var start = 0
var end = trees.max()!

while start <= end {
    var sum = 0 // 가져갈 수 있는 잘라진 나무 길이
    let mid = (start + end) / 2 // 절단기 높이
    
    for item in trees {
        if item <= mid { continue }
        sum += item - mid
    }
    
    if sum < m {
        end = mid - 1 // 잘라진 나무 길이를 늘리기 위해 절단기 높이를 낮춤
    } else {
        start = mid + 1
        answer = mid
    }
}

print(answer)
