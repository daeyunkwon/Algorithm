

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    }
    
    return gcd(b, a % b)
}

let ns = readLine()!.split(separator: " ").map { Int($0)! }, s = ns[1]

let a = readLine()!.split(separator: " ").map { Int($0)! }

var distance: [Int] = []

for item in a {
    var result = (s - item)
    if result < 0 {
        result *= -1
    }
    distance.append(result)
}

var answer = distance[0]

if distance.count == 1 {
    print(answer)
} else {
    for i in 1...distance.count-1 {
        answer = gcd(answer, distance[i])
    }
    print(answer)
}

