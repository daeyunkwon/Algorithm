




var paper = Array(repeating: Array(repeating: false, count: 100), count: 100)

for _ in 1...Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let x = input[0]
    let y = input[1]
    
    for x in x..<x+10 {
        for y in y..<y+10 {
            paper[y][x] = true
        }
    }
}

let blackArea = paper.flatMap{$0}.filter { element in
    if element == true {
        return true
    } else {
        return false
    }
}.count

print(blackArea)
