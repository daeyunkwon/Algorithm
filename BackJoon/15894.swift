



//방법1

//let n = Int(readLine()!)!
//
//var lineShape = 0
//
//var shape = 0
//
//for i in stride(from: n-1, through: 1, by: -1) {
//    lineShape += i
//}
//
//lineShape *= 4
//
//for i in 1...n {
//    shape += i
//}
//
//shape *= 4
//
//let result = shape - lineShape
//
//
//print(result)


//방법2

let n = Int(readLine()!)!

print(n*4)

