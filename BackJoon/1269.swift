



let nm = readLine()!.split(separator: " ").map { Int($0)! }

let inputA = readLine()!.split(separator: " ").map { Int($0)! }
let inputB = readLine()!.split(separator: " ").map { Int($0)! }

let a = Set(inputA)
let b = Set(inputB)

let symmetricDifference = a.symmetricDifference(b)

print(symmetricDifference.count)
