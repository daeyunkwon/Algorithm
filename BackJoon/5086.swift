


//방법1

//while true {
//    let input = readLine()!.split(separator: " ").map{Int($0)!}
//    let firstNum = input[0]
//    let secondNum = input[1]
//
//    if firstNum == 0 && secondNum == 0 {
//        break
//    }
//    
//    if (max(firstNum, secondNum) % min(firstNum, secondNum)) == 0 {
//        if firstNum > secondNum {
//            print("multiple")
//        } else {
//            print("factor")
//        }
//    } else {
//        print("neither")
//    }
//}


//방법2

while true {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let firstNum = input[0]
    let secondNum = input[1]

    if firstNum == 0 && secondNum == 0 {
        break
    }
    
    print(
        firstNum % secondNum == 0 ? "multiple" : secondNum % firstNum == 0 ? "factor" : "neither"
    )
}
