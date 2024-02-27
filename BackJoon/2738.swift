



let nm = readLine()!.split(separator: " ").map{Int($0)!}

let n = nm[0]
let m = nm[1]

var a: [[Int]] = []
var b: [[Int]] = []

var sum: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)

for _ in 0...n - 1 {
    a.append(readLine()!.split(separator: " ").map{Int($0)!})
}

for _ in 0...n - 1 {
    b.append(readLine()!.split(separator: " ").map{Int($0)!})
}

for y in 0...n - 1 {
    for x in 0...m - 1 {
        sum[y][x] = a[y][x] + b[y][x]
    }
}

for y in 0..<n {
    sum[y].forEach { print($0, terminator: " ") }
    print()
}


