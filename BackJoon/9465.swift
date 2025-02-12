


let t = Int(readLine()!)!

for _ in 1...t {
    let n = Int(readLine()!)!
    
    var stickers: [[Int]] = [[0], [0]]
    
    for i in 0...1 {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        stickers[i].append(contentsOf: input)
    }
    
    var cache: [[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: 2)
    
    cache[0][1] = stickers[0][1]
    cache[1][1] = stickers[1][1]
    
    if n > 1 {
        for i in 2...n {
            cache[0][i] = stickers[0][i] + max(cache[1][i-1], cache[1][i-2])
            cache[1][i] = stickers[1][i] + max(cache[0][i-1], cache[0][i-2])
        }
    }
    
    print(max(cache[0].max()!, cache[1].max()!))
}
