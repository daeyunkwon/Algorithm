import Foundation


//방법1

//let i = Int(readLine()!)!
//
//let n = readLine()!.map { c in
//    Int(String(c))!
//}
//    
//print(n.reduce(0, +))


//방법2

var n = Array(repeating: 0, count: Int(readLine()!)!)
let input = readLine()!.map{Int(String($0))!}

for i in 0...n.count-1 {
    n[i] = input[i]
}

print(n.reduce(0, +))
