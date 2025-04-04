import Foundation

let n = Int(readLine()!)!
var k = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }
arr.sort()

var intervals: [Int] = []

if n == 1 {
    print(0)
    exit(0)
}


for i in 0..<arr.count-1 {
    let front = arr[i]
    let next = arr[i + 1]
    
    let intervalValue = next - front
    
    intervals.append(intervalValue)
}

intervals.sort()

for _ in 0..<k-1 {
    intervals.popLast()
}

let answer = intervals.reduce(0, +)
print(answer)



