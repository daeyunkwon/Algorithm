
import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }, a = input[0], b = input[1]

let m = Int(readLine()!)!

var arr = readLine()!.split(separator: " ").map { Int($0)! }
arr = arr.reversed()

var decimal = 0

var stack: [Int] = []

//A진법 -> 10진법 -> B진법으로

for i in 0...m-1 {
    let value = arr[i] * Int(pow(Double(a), Double(i)))
    decimal += value
}

while true {
    stack.append(decimal % b)
    decimal = decimal / b
    if decimal == 0 { break }
}

while !stack.isEmpty {
    print(stack.popLast()!, terminator: " ")
}
