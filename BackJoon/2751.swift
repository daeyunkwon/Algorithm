






var list: [Int] = []
let count = Int(readLine()!)!

for _ in 0..<count {
    list.append(Int(readLine()!)!)
}

list.sort(by: <)

for item in list {
    print(item)
}



