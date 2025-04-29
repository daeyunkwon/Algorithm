

let n = Int(readLine()!)!
var numbers: [Int] = []

for _ in 0..<n {
    numbers.append(Int(readLine()!)!)
}

func quickSort(_ list: inout [Int], _ start: Int, _ end: Int) {
    if end <= start {
        return
    }
    
//    let randomIndex = Int.random(in: start...end)
//    list.swapAt(start, randomIndex)
    let pivot = list[start]
    var left = start + 1
    var right = end
    
    while true {
        while left <= right && list[left] <= pivot { left += 1 }
        
        while left <= right && list[right] > pivot { right -= 1 }
        
        if left > right {
            break
        }
        
        list.swapAt(left, right)
    }
    
    list.swapAt(start, right)
    quickSort(&list, start, right-1)
    quickSort(&list, right+1, end)
}

quickSort(&numbers, 0, numbers.count-1)

numbers.forEach {
    print($0)
}
