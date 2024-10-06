


let n = Int(readLine()!)!
var arr: [(Int, String)] = []

for _ in 1...n {
    let input = readLine()!.split(separator: " ").map{String($0)}
    let value: (Int, String) = (Int(input[0])!, input[1])
    arr.append(value)
}

arr.sort {
    $0.0 < $1.0
}

arr.forEach {
    print($0.0, $0.1)
}
