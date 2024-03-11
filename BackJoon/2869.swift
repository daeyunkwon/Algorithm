

import Foundation

let input = readLine()!.split(separator: " ").map{Double($0)!}

let a = input[0]
let b = input[1]
let v = input[2]


let day = ceil((v - b) / (a - b))

print(Int(day))
