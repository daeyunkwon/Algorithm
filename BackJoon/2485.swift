

func gcd(a: Int, b: Int) -> Int {
    if b == 0 {
        return a
    }
    
    return gcd(a: b, b: a % b)
}

let n = Int(readLine()!)!
var positions = [Int]()

for _ in 0..<n {
    positions.append(Int(readLine()!)!)
}

positions.sort()
var distances = [Int]()
for i in 1..<n {
    distances.append(positions[i] - positions[i - 1])
}

var commonGCD = distances[0]
for i in 1..<distances.count {
    commonGCD = gcd(a: commonGCD, b: distances[i])
}

var result = 0
for distance in distances {
    result += (distance / commonGCD) - 1
}

print(result)


