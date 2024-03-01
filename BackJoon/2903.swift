




var xDotCount = 2
var totalCount = 0

for _ in 1...Int(readLine()!)! {
    let add = xDotCount - 1
    xDotCount += add
    
    let yDotCount = xDotCount //정사각형이니깐 가로 세로 점 갯수는 일치하다.
    
    totalCount = xDotCount * yDotCount
}

print(totalCount)
