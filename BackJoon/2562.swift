
import Foundation




var arr: [Int] = []

for _ in 1...9 {
    arr.append(Int(readLine()!)!)
}

var max = arr[0]
var index = 1

for i in 0...arr.count-1 {
    if max < arr[i] {
        max = arr[i]
        index = i+1
    }
}

print(max)
print(index)



//방법2

//var arr: [Int] = []
//
//for _ in 1...9 {
//    arr.append(Int(readLine()!)!)
//}
//
//var max = arr.max()!
//var index = arr.firstIndex(of: max)! + 1
//
//print(max)
//print(index)
