

func gcd(a: Int, b: Int) -> Int {
    if b == 0 {
        return a
    }
    
    return gcd(a: b, b: a % b)
}

let input1 = readLine()!.split(separator: " ").map { Int($0)! }
let a1 = input1[0], a2 = input1[1]

let input2 = readLine()!.split(separator: " ").map { Int($0)! }
let b1 = input2[0], b2 = input2[1]

let result1 = (a1 * b2) + (b1 * a2)
let result2 = a2 * b2

let num = gcd(a: result1, b: result2)

print(result1 / num, result2 / num)

