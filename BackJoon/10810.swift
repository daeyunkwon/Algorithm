
import Foundation





let nm = readLine()!.split(separator: " ").map{Int($0)!}

var basket = Array(repeating: 0, count: nm[0])

for _ in 1...nm[1] {
    let abc = readLine()!.split(separator: " ").map{Int($0)!}
    
    for j in abc[0]...abc[1] {
        basket[j-1] = abc[2]
    }
}

print(basket.map{String($0)}.joined(separator: " "))



