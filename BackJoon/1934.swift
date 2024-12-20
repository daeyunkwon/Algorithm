

func gcd(a: Int, b: Int) -> Int {
    if b == 0 {
        return a
    }
    
    return gcd(a: b, b: a % b)
}


let t = Int(readLine()!)!

for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0], b = input[1]
    
    print(a * b / gcd(a: a, b: b))
}


