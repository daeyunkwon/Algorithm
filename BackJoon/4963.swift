
while true {
    let wh = readLine()!.split(separator: " ").map { Int($0)! }
    if wh[0] == 0 && wh[1] == 0 { break }
    
    let w = wh[0]
    let h = wh[1]
    var myMap: [[Int]] = []
    var count: Int = 0

    func dfs(x: Int, y: Int) {
        if x < 0 || y < 0 || x >= w || y >= h || myMap[y][x] == 0 { return }
        myMap[y][x] = 0
        
        dfs(x: x - 1, y: y)
        dfs(x: x + 1, y: y)
        dfs(x: x, y: y - 1)
        dfs(x: x, y: y + 1)
        
        dfs(x: x + 1, y: y + 1)
        dfs(x: x + 1, y: y - 1)
        dfs(x: x - 1, y: y + 1)
        dfs(x: x - 1, y: y - 1)
    }
    
    for _ in 0..<h {
        let xy = readLine()!.split(separator: " ").map{ Int($0)! }
        myMap.append(xy)
    }
    
    for y in 0...h-1 {
        for x in 0...w-1 {
            if myMap[y][x] == 1 {
                dfs(x: x, y: y)
                count += 1
            }
        }
    }
    
    print(count)
}
