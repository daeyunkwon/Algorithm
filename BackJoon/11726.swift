

let n = Int(readLine()!)!

if n == 1 {
    print(1)
} else if n == 2 {
    print(2)
} else {
    var cache: [Int] = Array(repeating: 0, count: n + 1)
    
    cache[1] = 1
    cache[2] = 2
    
    for i in 3...n {
        cache[i] = (cache[i-1] + cache[i-2]) % 10007
    }
    
    print(cache[n])
}


