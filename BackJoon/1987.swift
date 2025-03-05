

let rc = readLine()!.split(separator: " ").map { Int($0)! }
let r = rc[0] // 세로
let c = rc[1] // 가로

var board: [[Int]] = []
var dx = [0, 0, -1, 1]
var dy = [1, -1, 0, 0]

for _ in 0..<r {
    let alphabet = readLine()!.map { Int($0.asciiValue!) - 65 }
    board.append(alphabet)
}

var answer = 0

func dfs(_ x: Int, _ y: Int, _ bit: Int, count: Int) {
    answer = answer > count ? answer : count
    
    for i in 0...3 {
        let nx = dx[i] + x
        let ny = dy[i] + y
        
        if nx >= 0 && ny >= 0 && nx < c && ny < r {
            let newBit = 1 << board[ny][nx]
            if bit & newBit == 0 {
                dfs(nx, ny, bit | newBit, count: count + 1)
            }
        }
    }
}

dfs(0, 0, 1 << board[0][0], count: 1)
print(answer)
