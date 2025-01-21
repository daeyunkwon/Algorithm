
import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }, m = input[0], n = input[1]

//func isPrimeNumber(_ n: Int) -> Bool {
//    if n == 1 {
//        return false
//    }
//    
//    for i in 2..<Int(sqrt(Double(n)))+1 {
//        if n % i == 0 {
//            return false
//        }
//    }
//    
//    return true
//}
//
//
//for i in m...n {
//    if isPrimeNumber(i) {
//        print(i)
//    }
//}

var isPrimeNumber = [Bool](repeating: true, count: n+1)
isPrimeNumber[0] = false
isPrimeNumber[1] = false

for i in 2..<Int(sqrt(Double(n)))+1 {
    if isPrimeNumber[i] {
        var j = 2
        while i * j <= n {
            isPrimeNumber[i*j] = false
            j += 1
        }
    }
}

for i in m...n {
    if isPrimeNumber[i] {
        print(i)
    }
}
