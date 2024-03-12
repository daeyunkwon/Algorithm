



let n = Int(readLine()!)!

let input = readLine()!.split(separator: " ").map{Int($0)!}

var count = 0

for i in 0..<n {
    var factorArray: [Int] = []
    
    for j in 1...input[i] {
        if factorArray.count == 3 {
            break
        }
        
        if input[i] % j == 0 {
            factorArray.append(j)
        }
    }
    
    if factorArray.count == 2 {
        count += 1
    }
}

print(count)
