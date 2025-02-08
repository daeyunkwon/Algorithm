


let n = Int(readLine()!)!

var cache: [[Int]] = Array(repeating: [0, 0, 0], count: n+1)
var rgb: [[Int]] = Array(repeating: [0, 0, 0], count: n+1)

for i in 1...n {
    rgb[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

for i in 1...n {
    cache[i][0] = min(cache[i-1][1], cache[i-1][2]) + rgb[i][0]
    cache[i][1] = min(cache[i-1][0], cache[i-1][2]) + rgb[i][1]
    cache[i][2] = min(cache[i-1][0], cache[i-1][1]) + rgb[i][2]
}

print(cache[n].min()!)
