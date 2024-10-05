



let n = Int(readLine()!)!

var arr: [String] = []

for _ in 1...n {
    arr.append(readLine()!)
}

arr = Array(Set(arr))

arr.sort { prev, next in
    if prev.count != next.count {
        return prev.count < next.count
    } else {
        return prev < next
    }
}

arr.forEach {
    print($0)
}


