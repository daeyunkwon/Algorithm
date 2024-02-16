import Foundation



//방법1

//let n = Double(readLine()!)!
//let arr = readLine()!.split(separator: " ").map{Double($0)!}
//var highScore: Double = arr.max()!
//var average: Double = 0
//
//for i in 0...arr.count-1 {
//    average += arr[i] / highScore * 100
//}
//
//print(average/n)


//방법2

let n = Double(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Double($0)!}
var average: Double = arr.reduce(0) { partialResult, element in
    partialResult + element / arr.max()! * 100
}
print(average/n)

