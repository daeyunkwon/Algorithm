
import Foundation

var max = 100

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

while let input = Int(readLine()!) {
    if input == 0 { break }
    
    var flag = false
    
    for i in 3...input {
        if isPrimeNumber[i] {
            let m = input - i
            if isPrimeNumber[m] {
                print("\(input) = \(i) + \(m)")
                flag = true
                break
            }
        }
    }
    
    if !flag {
       print("Goldbach's conjecture is wrong.")
    }
}



