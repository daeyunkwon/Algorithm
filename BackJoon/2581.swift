



let m = Int(readLine()!)!
let n = Int(readLine()!)!
var primeNumberArray: [Int] = []

for i in m...n {
    var factorArray: [Int] = []
    
    for j in 1...i {
        if factorArray.count == 3 {
            break
        }
        
        if i % j == 0 {
            factorArray.append(j)
        }
    }
    
    if factorArray.count == 2 {
        primeNumberArray.append(i)
    }
}

if !primeNumberArray.isEmpty {
    print(primeNumberArray.reduce(0, +))
    print(primeNumberArray[0])

} else {
    print(-1)
}
