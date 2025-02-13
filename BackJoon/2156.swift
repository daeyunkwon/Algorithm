

let n = Int(readLine()!)!

var arr: [Int] = [0]
for _ in 1...n {
    let input = Int(readLine()!)!
    arr.append(input)
}

var cache: [Int] = Array(repeating: 0, count: n + 1)

if n == 1 {
    print(arr[1])
} else if n == 2 {
    print(arr[1] + arr[2])
} else {
    cache[1] = arr[1]
    cache[2] = arr[1] + arr[2]
    
    for i in 3...n {
        let case1 = cache[i-3] + arr[i-1] + arr[i] // X O O
        
        let case2 = cache[i-2] + arr[i] // O X O
        
        let case3 = cache[i-1] // O O X
        
        cache[i] = max(case1, case2, case3)
    }
    
    print(cache.last!)
}
