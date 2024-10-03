



let n = Int(readLine()!)!
var arr: [(Int, Int)] = []


for _ in 1...n {
    let xy = readLine()!.split(separator: " ").map{Int($0)!}
    
    arr.append((xy[0], xy[1]))
}

arr.sort {
    $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0
}

for i in 0..<n {
    print(arr[i].0, arr[i].1)
}



