
import Foundation


//방법1

//var arr: [Int] = []
//
//for i in 0...Int(readLine()!)! - 1 {
//    arr.append(readLine()!.split(separator: " ").map {Int($0)!}.reduce(0, +))
//}
//
//for i in 1...arr.count {
//    print("Case #\(i): \(arr[i-1])")
//}


//방법2

var arr: [Int] = []

for i in 1...Int(readLine()!)! {
    let sum = readLine()!.split(separator: " ").map{Int($0)!}
    print("Case #\(i): \(sum[0]+sum[1])")
}
