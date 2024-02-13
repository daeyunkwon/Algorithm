
import Foundation




//방법1

//let n = Int(readLine()!)!
//
//let arr = readLine()!.split(separator: " ").map{Int($0)!}
//
//var max = 0
//var min = 0
//
//for i in arr {
//    if max == 0 {
//        max = i
//    }
//    
//    if min == 0 {
//        min = i
//    }
//    
//    if max < i {
//        max = i
//    }
//    
//    if min > i {
//        min = i
//    }
//}
//
//print(min, max)


//방법2

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
arr.sort(by: <)
print(arr.first!, arr.last!)

