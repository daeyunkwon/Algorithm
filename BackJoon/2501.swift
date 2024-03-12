



let input = readLine()!.split(separator: " ").map{Int($0)!}
let n = input[0]
let k = input[1]
var factorArray: [Int] = []

for i in 1...n {
    if n % i == 0 {
        factorArray.append(i)
    }
}

if factorArray.count < k {
    print(0)
} else {
    print(factorArray[k-1])
}
