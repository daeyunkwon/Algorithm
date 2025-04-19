
var arr = readLine()!.split(separator: " ").map { Int($0)! }

for i in 0..<arr.count-1 {
    for j in i+1..<arr.count {
        let currentItem = arr[i]
        let nextItem = arr[j]
        
        if currentItem > nextItem {
            arr[i] = nextItem
            arr[j] = currentItem
        }
    }
}

arr.forEach {
    print(String($0), terminator: " ")
}
