


//let binaryNumber = Array(readLine()!).reversed()
//
//var answer: [Int] = []
//var count = 1
//var temp = 0
//
//for num in binaryNumber {
//    let digit = Int(String(num))
//    
//    if digit == 1 {
//        if count == 1 {
//            temp += 1
//        } else if count == 2 {
//            temp += 2
//        } else if count == 3 {
//            temp += 4
//        }
//    }
//    
//    if count == 3 {
//        answer.append(temp)
//        temp = 0
//        count = 0
//    }
//    
//    count += 1
//}
//
//if binaryNumber.count % 3 != 0 {
//    answer.append(temp)
//}
//
//answer.reversed().forEach { print($0, terminator: "") }


//var binary = readLine()!.reversed().map { Int(String($0))! }
//if binary.count % 3 != 0 {
//    binary.append(contentsOf: Array(repeating: 0, count: (3-binary.count%3)%3))
//}
//binary.reverse()
//
//for i in stride(from: 0, to: binary.count-1, by: 3) {
////    print(binary[i]*4 + binary[i+1]*2 + binary[i+2]*1,terminator: "")
//}


var binaryNumber = readLine()!
var answer = ""

if binaryNumber.count % 3 != 0 {
    binaryNumber = String(repeating: "0", count: (3 - binaryNumber.count % 3) % 3) + binaryNumber
}

let array = binaryNumber.map { Int(String($0))! }

for i in stride(from: 0, to: array.count - 1, by: 3) {
    var result = 0
    
    result = array[i] * 4
    result += array[i+1] * 2
    result += array[i+2] * 1
    
    answer += String(result)
}

print(answer)
