





let n = Int(readLine()!)!

var starCount = 1

for i in 1...n*2-1 {
    let emptyCount = (n*2-1) - starCount
    
    print(
        String(repeating: " ", count: emptyCount/2) + String(repeating: "*", count: starCount)
    )
    
    if i >= n {
        starCount -= 2
    } else {
        starCount += 2
    }
}
