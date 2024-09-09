




//처음 시도

//var list: [Int] = []
//let count = Int(readLine()!)!
//
//for _ in 0..<count {
//    list.append(Int(readLine()!)!)
//}
//
//list.sort(by: <)
//
//for item in list {
//    print(item)
//}


//찾은 방법

var countingNums: [Int] = Array(repeating: 0, count: 10001)
let n = Int(readLine()!)!

for _ in 0..<n {
    countingNums[Int(readLine()!)!] += 1
}

//var output: [Int] = []
var output = ""

for i in 1...10000 {
    output += String(repeating: "\(i)\n", count: countingNums[i])
//    if countingNums[i] != 0 {
//        output.append(i)
//    }
}

//output.forEach{ print($0) }
print(output)




