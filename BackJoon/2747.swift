



var cache: [Int] = .init(repeating: 0, count: 46)

cache[1] = 1

///Bottom-Up

//cache[1] = 1
//
//for i in 2...45 {
//    cache[i] = cache[i-1] + cache[i-2]
//}

///Top-Down

func f(n: Int) -> Int {
    if n <= 0 {
        return 0
    }
    
    if cache[n] != 0 {
        return cache[n]
    }
    
    cache[n] = f(n: n-1) + f(n: n-2)
    return cache[n]
}


let n = Int(readLine()!)!

let _ = f(n: n)

print(cache[n])
