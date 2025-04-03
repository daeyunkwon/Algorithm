

let input = readLine()!.split(separator: " ").map { Int($0)! }
let x = input[0]
let y = input[1]
let w = input[2] // 한블록 시간
let s = input[3] // 대각선 시간

var answer = 0

if (w * 2) < s {
    // 평행 이동만
    let time = (x * w) + (y * w)
    answer = time
} else {
    // 대각선 이동 + 평행 이동
    let min = min(x, y)
    let diagonalTime = min * s
    
    if w < s {
        // 대각선 이동 이후에 평행 이동만
        let rest = max(x, y) - min
        let oneStepTime = rest * w
        answer = diagonalTime + oneStepTime
    } else {
        // 대각선 이동 이후에 또 대각선 이동
        let max = max(x, y)
        let rest = max - min
        
        var moreDiagonalTime = 0
        var oneStepTime = 0
        
        if (max % 2 == 0 && min % 2 != 0) || (max % 2 != 0 && min % 2 == 0) { // 대각선 이동만으로 목적지에 도착하지 못하는 경우 1번의 평행 이동이 필요
            moreDiagonalTime = rest - 1
            oneStepTime = 1
        } else {
            moreDiagonalTime = rest
        }
        
        
        var addTime = moreDiagonalTime * s
        addTime += oneStepTime * w
        
        answer = diagonalTime + addTime
    }
}

print(answer)
