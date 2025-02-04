



var cache: [Int] = Array(repeating: 0, count: 10+1)

cache[1] = 1
cache[2] = 2
cache[3] = 4

for i in 4...10 {
    cache[i] = cache[i-1] + cache[i-2] + cache[i-3]
}

for _ in 1...Int(readLine()!)! {
    let n = Int(readLine()!)!
    print(cache[n])
}



