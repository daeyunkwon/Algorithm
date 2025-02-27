

let n = Int(readLine()!)!
var gride: [[String]] = []
for _ in 1...n {
    let input = readLine()!.map{String($0)}
    gride.append(input)
}

var visited1: [[Bool]] = .init(repeating: Array(repeating: false, count: n), count: n) // 적록색약 아닌 경우
var visited2: [[Bool]] = .init(repeating: Array(repeating: false, count: n), count: n) // 적록색약인 경우
var dx = [0, 0, -1, 1]
var dy = [-1, 1, 0, 0]
var answer1 = 0 // 적록색약 아닌 경우
var answer2 = 0 // 적록색약인 경우

func dfs(_ x: Int, _ y: Int, _ color: String, _ isDistinguishable: Bool) {
    if isDistinguishable {
        visited1[y][x] = true
    } else {
        visited2[y][x] = true
    }
    
    for i in 0...3 {
        let nx = dx[i] + x
        let ny = dy[i] + y
        if nx >= 0 && nx < n && ny >= 0 && ny < n {
            if isDistinguishable {
                if !visited1[ny][nx] && gride[ny][nx] == color {
                    dfs(nx, ny, color, true)
                }
            } else {
                if color != "B" {
                    if !visited2[ny][nx] && (gride[ny][nx] == "R" || gride[ny][nx] == "G") {
                        dfs(nx, ny, color, false)
                    }
                } else {
                    if !visited2[ny][nx] && gride[ny][nx] == "B" {
                        dfs(nx, ny, color, false)
                    }
                }
            }
        }
    }
}


for y in 0...n-1 {
    for x in 0...n-1 {
        if !visited1[y][x] {
            dfs(x, y, gride[y][x], true)
            answer1 += 1
        }
        if !visited2[y][x] {
            dfs(x, y, gride[y][x], false)
            answer2 += 1
        }
    }
}

print(answer1, answer2)
