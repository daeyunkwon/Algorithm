




var xArray: [Int] = []
var yArray: [Int] = []

let n = Int(readLine()!)!

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    xArray.append(input[0])
    yArray.append(input[1])
}

if n == 1 {
    print(0)
} else {
    xArray.sort()
    yArray.sort()

    let result = (xArray.last! - xArray.first!) * (yArray.last! - yArray.first!)
    print(result)
}








