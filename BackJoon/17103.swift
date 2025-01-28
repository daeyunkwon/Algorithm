



import Foundation

var max = 1000000

var isPrimeNumber = [Bool](repeating: true, count: max+1)
isPrimeNumber[0] = false
isPrimeNumber[1] = false

for i in 2..<Int(sqrt(Double(max)) + 1) {
    if isPrimeNumber[i] {
        var j = 2
        while i * j <= max {
            isPrimeNumber[i * j] = false
            j += 1
        }
    }
}



let testCase = Int(readLine()!)!

for _ in 1...testCase {
    let num = Int(readLine()!)!
    var answer = 0
    
    
    for i in 2...num / 2 {
        if isPrimeNumber[i] && isPrimeNumber[num - i] {
            answer += 1
        }
    }
    print(answer)
}


