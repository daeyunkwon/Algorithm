

let input = readLine()!.split(separator: " ").map { Int($0)! }

let m = input[0] // x
let n = input[1] // y
let k = input[2] // k개의 좌표 수

var paper: [[Int]] = .init(repeating: Array(repeating: 0, count: m), count: n)

for _ in 1...k {
    let draw = readLine()!.split(separator: " ").map { Int($0)! }
    for x in draw[1]..<draw[3] {
        for y in draw[0]..<draw[2] {
            paper[y][x] = 1
        }
    }
}

var area: [Int] = []
var areaValue = 0

func dfs(_ x: Int, _ y: Int) {
    if x < 0 || y < 0 || x >= m || y >= n || paper[y][x] == 1 { return }
    
    paper[y][x] = 1
    areaValue += 1
    
    dfs(x - 1, y)
    dfs(x + 1, y)
    dfs(x, y - 1)
    dfs(x, y + 1)
}

for y in 0..<n {
    for x in 0..<m {
        if paper[y][x] == 0 {
            areaValue = 0
            dfs(x, y)
            area.append(areaValue)
        }
    }
}

print(area.count)
for item in area.sorted() {
    print(item, terminator: " ")
}
