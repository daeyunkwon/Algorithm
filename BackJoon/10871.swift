
import Foundation



//방법1

//let o = a.filter {
//    $0 < nx[1]
//}
//
//var out = ""
//
//for i in 0...o.count-1 {
//    if i == o.count-1 {
//        out += ("\(o[i])")
//        break
//    }
//    out += ("\(o[i]) ")
//}
//
//print(out)


//방법2

let nx = readLine()!.split(separator: " ").map{Int($0)!}

let a = readLine()!.split(separator: " ").map{Int($0)!}

print(a.filter{$0 < nx[1]}.map{String($0)}.joined(separator: " "))
