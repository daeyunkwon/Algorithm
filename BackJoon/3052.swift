
import Foundation


//방법1

//var remainders: [Int] = []
//var temp: [Int] = []
//
//for _ in 1...10 {
//    let input = Int(readLine()!)!
//    remainders.append(input % 42)
//}
//
//remainders.forEach { n in
//    if !temp.contains(n) {
//        temp.append(n)
//    }
//}
//
//print(temp.count)


//방법2

var remainders: [Int] = []

for _ in 1...10 {
    let input = Int(readLine()!)!
    remainders.append(input % 42)
}

print(Set(remainders).count)
