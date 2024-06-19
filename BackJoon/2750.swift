




let n = Int(readLine()!)!

var numberList: [Int] = []

for i in 1...n {
    numberList.append(Int(readLine()!)!)
}

numberList.sort { first, second in
    return first < second
}

for element in numberList {
    print(element)
}
