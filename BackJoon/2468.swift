

let n = Int(readLine()!)!
var area: [[Int]] = []
var heights: [Int] = []

for _ in 1...n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    area.append(input)
    for i in 0...input.count-1 {
        if !heights.contains(input[i]) {
            heights.append(input[i])
        }
    }
}

heights.sort()

func dfs(x: Int, y: Int, height: Int) {
    if x < 0 || y < 0 || x >= n || y >= n || area[x][y] <= height {
        return
    }
    
    area[x][y] = height
    
    dfs(x: x - 1, y: y, height: height)
    dfs(x: x + 1, y: y, height: height)
    dfs(x: x, y: y - 1, height: height)
    dfs(x: x, y: y + 1, height: height)
}

let backupArea = area
var count = 0
var maxValue = 1

for height in heights {
    
    for x in 0...n-1 {
        for y in 0...n-1 {
            if area[x][y] > height {
                count += 1
                dfs(x: x, y: y, height: height)
            }
        }
    }
    
    maxValue = max(maxValue, count)
    area = backupArea
    count = 0
}

print(maxValue)
