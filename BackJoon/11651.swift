


let n = Int(readLine()!)!

var arr: [(Int, Int)] = []


for _ in 1...n {
    let xy = readLine()!.split(separator: " ").map{Int($0)!}
    
    arr.append((xy[0], xy[1]))
}

arr.sort {
    $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 < $1.1
}

for item in arr {
    print(item.0, item.1)
}
