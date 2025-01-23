

//let n = Int(readLine()!)!
//var result = 1
//var answer = 0
//var stack: [Character] = []
//
//for i in 0...n {
//    if i == 0 {
//        continue
//    }
//    result *= i
//}
//
//stack = Array(String(result))
//
//
//while !stack.isEmpty {
//    if stack.popLast()! != "0" {
//        break
//    } else {
//        answer += 1
//    }
//}
//
//print(answer)


let n = Int(readLine()!)!
var count = 0

for i in 1..<n+1 {
    var num = i
    while num > 0 && num % 5 == 0 {
        count += 1
        num /= 5
    }
}

print(count)
