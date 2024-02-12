
import Foundation



//방법1

//let n = Int(readLine()!)!
//
//var arr = readLine()!.split(separator: " ").map{Int($0)!}
//
//let v = Int(readLine()!)!
//
//let c = arr.reduce(0) { partialResult, n in
//    var c = 0
//    if n == v {
//        c += 1
//    }
//    return partialResult + c
//}
//
//print(c)


//방법2

let n = Int(readLine()!)!

let arr = readLine()!.split(separator: " ").map{Int($0)!}

var v = Int(readLine()!)!

var sum = 0

for i in 0...n-1 {
    if arr[i] == v {
        sum += 1
    }
}

print(sum)
