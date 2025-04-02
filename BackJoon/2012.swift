

let n = Int(readLine()!)!

var expectations: [Int] = []

for _ in 1...n {
    expectations.append(Int(readLine()!)!)
}

expectations.sort()
var answer = 0

for i in 0..<n {
    if expectations[i] != i+1 {
        answer += abs(expectations[i] - (i + 1))
    }
}

print(answer)

//var stack: [Int] = [] // 매겨야 하는 등수들
//var index: [Int] = []
//
//expectations.sort()
//var num = 1
//for i in 0..<n {
//    let element = expectations[i]
//    
//    if element == num {
//        if let lastNum = stack.last {
//            if lastNum == num {
//                stack.popLast()!
////                index.popLast()!
//            }
//        }
//        num += 1
//        continue
//    }
//    
//    if element != num {
//        stack.append(num)
//        if stack.count > index.count {
//            index.append(i)
//        }
//    }
//}
//
//var answer = 0
//for ranking in stack.sorted() {
//    for index in index {
//        let value = ranking - expectations[index]
//        answer += value
//    }
//}
//
//print(answer)
