
//연산자 기준으로 앞에 두 숫자씩 계산함


let n = Int(readLine()!)!
let dict: [String: Int] = [
    "A": 0, "B": 1, "C": 2, "D": 3, "E": 4, "F": 5, "G": 6, "H": 7, "I": 8, "J": 9, "K": 10, "L": 11, "M": 12, "N": 13, "O": 14, "P": 15, "Q": 16, "R": 17, "S": 18, "T": 19, "U": 20, "V": 21, "W": 22, "X": 23, "Y": 24, "Z": 25
]

let input = readLine()!.map { String($0) }
var nums: [Double] = []

var numStack: [Double] = [] //피연산자 담기


for _ in 0...n - 1 {
    nums.append( Double(readLine()!)!)
}

for item in input {
    
    if let indexNumber = dict[item] {
        numStack.append(nums[indexNumber])
    } else {
        if numStack.count >= 2 {
            let second = numStack.popLast()!
            let first = numStack.popLast()!
            
            switch item {
            case "+": numStack.append(first + second)
            case "-": numStack.append(first - second)
            case "*": numStack.append(first * second)
            case "/": numStack.append(first / second)
            default: break
            }
        }
    }
}

let result = numStack.last!

import Foundation
print(
    String(format: "%.2f", result)
)
