

let t = Int(readLine()!)!
let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!
let b = readLine()!.split(separator: " ").map {Int($0)! }

var aSum: [Int] = []
var bSum: [Int] = []

for i in 0..<a.count {
    var value = a[i]
    aSum.append(value)
    for j in i+1..<n {
        value += a[j]
        aSum.append(value)
    }
}

for i in 0..<m {
    var value = b[i]
    bSum.append(value)
    for j in i+1..<m {
        value += b[j]
        bSum.append(value)
    }
}

aSum.sort(by: <)
bSum.sort(by: <)

var aIndex = 0
var bIndex = bSum.count - 1
var validCase = 0

while aIndex < aSum.count && bIndex >= 0 {
    let sum = aSum[aIndex] + bSum[bIndex]
    
    if sum < t {
        aIndex += 1
        continue
    }
    
    if sum > t {
        bIndex -= 1
        continue
    }
    
    if sum == t {
        let validA = aSum[aIndex]
        let validB = bSum[bIndex]
        var duplicatedA = 0
        var duplicatedB = 0
        
        while aIndex < aSum.count && aSum[aIndex] == validA {
            duplicatedA += 1
            aIndex += 1
        }
        
        while bIndex >= 0 && bSum[bIndex] == validB {
            duplicatedB += 1
            bIndex -= 1
        }
        
        validCase += duplicatedA * duplicatedB
    }
}

print(validCase)
