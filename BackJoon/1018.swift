




let nm = readLine()!.split(separator: " ").map{Int($0)!}

let n = nm[0]
let m = nm[1]

var board1 = [[Character]]()
for i in 1...8 {
    if i % 2 == 1 {
        board1.append(Array("WBWBWBWB"))
    } else {
        board1.append(Array("BWBWBWBW"))
    }
    
}

let board2: [[Character]] = [["B","W","B","W","B","W","B","W"],
                             ["W","B","W","B","W","B","W","B"],
                             ["B","W","B","W","B","W","B","W"],
                             ["W","B","W","B","W","B","W","B"],
                             ["B","W","B","W","B","W","B","W"],
                             ["W","B","W","B","W","B","W","B"],
                             ["B","W","B","W","B","W","B","W"],
                             ["W","B","W","B","W","B","W","B"]]

var inputBoard = [[Character]]()
for _ in 1...n {
    let arr = readLine()!
    inputBoard.append(Array(arr))
}

var answer = 8 * 8

for y in 0...n-8 {
    for x in 0...m-8 {
        var count1 = 0
        var count2 = 0
        
        for i in y..<y+8 {
            for j in x..<x+8 {
                if inputBoard[i][j] != board1[i-y][j-x] {
                    count1 += 1
                }
                if inputBoard[i][j] != board2[i-y][j-x] {
                    count2 += 1
                }
            }
        }
        
        answer = min(answer, count1, count2)
    }
}

print(answer)


