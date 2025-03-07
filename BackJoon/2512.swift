

let n = Int(readLine()!)! // 지방 수
let budgets = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)! // 총 예산


var start = 1
var end = budgets.max()!
var answer = 0

while start <= end {
    var sum = 0
    let mid = (start + end) / 2
    
    for item in budgets {
        if item <= mid {
            sum += item
        } else {
            sum += mid
        }
    }
    
    if sum <= m {
        start = mid + 1
        answer = mid
    } else {
        end = mid - 1
    }
}

print(answer)
