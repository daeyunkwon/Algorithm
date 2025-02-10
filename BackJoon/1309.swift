

//1: 111 -> 3
//2: 111 1111 -> 7
//3: 111 1111 11 11 11 11 -> 17
//4: -> 41

let n = Int(readLine()!)!

var cache: [Int] = Array(repeating: 0, count: n+1)

cache[0] = 1
cache[1] = 3

if n == 1 {
    print(cache[1])
} else {
    for i in 2...n {
        cache[i] = ((2*cache[i-1]) + cache[i-2]) % 9901
    }

    print(cache[n])
}


