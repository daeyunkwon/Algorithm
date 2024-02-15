
import Foundation


//방법1

//let nm = readLine()!.split(separator: " ").map{Int($0)!}
//
//var basket = Array(1...nm[0])
//
//for _ in 1...nm[1] {
//    var temp: [Int] = []
//    var index = 0
//    
//    let ij = readLine()!.split(separator: " ").map{Int($0)!-1}
//    
//    for k in ij[0]...ij[1] {
//        temp.append(basket[k])
//    }
//    
//    index = temp.count - 1
//    
//    for k in ij[0]...ij[1] {
//        basket[k] = temp[index]
//        index -= 1
//    }
//}
//
//print(basket.map{String($0)}.joined(separator: " "))


//방법2

let nm = readLine()!.split(separator: " ").map{Int($0)!}

var basket = Array(1...nm[0])

for _ in 1...nm[1] {
    
    let ij = readLine()!.split(separator: " ").map{Int($0)!-1}
    
    var arr = basket[ij[0]...ij[1]]
    
    arr.reverse()
    
    basket[ij[0]...ij[1]] = arr
}

print(basket.map{String($0)}.joined(separator: " "))
