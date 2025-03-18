

let xy = readLine()!.split(separator: " ").map { Int($0)! }
let x = xy[0] // 총 게임 횟수
let y = xy[1] // 이긴 게임 횟수
let z = y * 100 / x

var start = 0
var end = x
var answer = -1
while start <= end {
    let mid = (start + end) / 2 // 더 진행할 게임 횟수
    
    let newX = x + mid
    let newY = y + mid
    let newZ = newY * 100 / newX
    
    if newZ <= z {
        
        start = mid + 1
        
    } else {
        answer = mid
        end = mid - 1
    }
}

print(answer)
