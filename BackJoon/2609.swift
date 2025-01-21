


let input = readLine()!.split(separator: " ").map { Int($0)! }, f = input[0], s = input[1]

func gcd(a: Int, b: Int) -> Int {
    if b == 0 {
        return a
    }
    
    return gcd(a: b, b: a % b)
}

print(gcd(a: f, b: s))
print(f * s / gcd(a: f, b: s))
