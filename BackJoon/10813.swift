
import Foundation



//방법1

//let nm = readLine()!.split(separator: " ").map{Int($0)!}
//
//var basket = Array(1...nm[0])
//
//for _ in 1...nm[1] {
//    
//    let ab = readLine()!.split(separator: " ").map{Int($0)!}
//    
//    var temp = basket[ab[0]-1]
//    
//    basket[ab[0]-1] = basket[ab[1]-1]
//    
//    basket[ab[1]-1] = temp
//}
//
//print(basket.map{String($0)}.joined(separator: " "))


//방법2

let nm = readLine()!.split(separator: " ").map{Int($0)!}

var basket = Array(1...nm[0])

for _ in 1...nm[1] {
    let ab = readLine()!.split(separator: " ").map{Int($0)!}
    basket.swapAt(ab[0]-1, ab[1]-1) //2개의 인덱스의 값을 서로 바꾸기
}

print(basket.map{String($0)}.joined(separator: " "))
