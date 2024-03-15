



while true {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    
    let sum = input.reduce(0, +)
    let maxNum = input.max()!
    
    if sum == 0 {
        break
    }
    
    if sum - maxNum <= maxNum {
        print("Invalid")
        continue
    }
    
    let dict = input.reduce(into: [:]) {
        $0[$1, default: 0] += 1
    }
    
    if dict.count == 1 {
        print("Equilateral")
    } else if dict.count == 2 {
        print("Isosceles")
    } else if dict.count == 3 {
        print("Scalene")
    }
    
}
