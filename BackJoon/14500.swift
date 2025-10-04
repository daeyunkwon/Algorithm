

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1]) // 세로, 가로

var paper: [[Int]] = .init(repeating: [], count: n)
for y in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    paper[y] = line
}

let tetrominos: [[(Int, Int)]] = [ // (x, y)
    // ㅁ 모양
    [(0, 0), (0, 1), (1, 0), (1, 1)],
    
    // | 모양
    [(0, 0), (0, 1), (0, 2), (0, 3)],
    [(0, 0), (1, 0), (2, 0), (3, 0)],
    
    // L 모양
    [(0, 0), (1, 0), (2, 0), (2, 1)],
    [(0, 1), (1, 1), (2, 1), (2, 0)],
    [(1, 0), (1, 1), (1, 2), (0, 2)],
    [(0, 0), (0, 1), (0, 2), (1, 2)],
    [(0, 0), (0, 1), (1, 1), (2, 1)],
    [(0, 0), (0, 1), (1, 0), (2, 0)],
    [(0, 0), (0, 1), (0, 2), (1, 0)],
    [(0, 0), (1, 0), (1, 1), (1, 2)],
    
    // Z 모양
    [(0, 0), (1, 0), (1, 1), (2, 1)],
    [(0, 1), (1, 1), (1, 0), (2, 0)],
    [(0, 1), (0, 2), (1, 0), (1, 1)],
    [(0, 0), (0, 1), (1, 1), (1, 2)],
    
    // ㅜ 모양
    [(0, 0), (0, 1), (0, 2), (1, 1)],
    [(1, 0), (1, 1), (1, 2), (0, 1)],
    [(0, 0), (1, 0), (2, 0), (1, 1)],
    [(0, 1), (1, 1), (2, 1), (1, 0)]
]

var answer: Int = 0

for y in 0..<n {
    for x in 0..<m {
        // 현재 xy 좌표에 대해서 모든 테트로미노 모양 대입해보기
        for shape in tetrominos {
            var sum = 0
            var isValid = true
            
            for (dx, dy) in shape {
                let x = dx + x
                let y = dy + y
                
                if x < 0 || x >= m || y < 0 || y >= n {
                    isValid = false
                    break
                }
                
                sum += paper[y][x]
            }
            
            if isValid {
                answer = max(answer, sum) // 현재 xy 좌표에 대해서 가장 값이 큰 테트로미노 사용
            }
        }
    }
}

print(answer)
