




var xArray: [Int] = []
var yArray: [Int] = []
var fourth: [Int] = []

for _ in 1...3 {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    xArray.append(input[0])
    yArray.append(input[1])
}

xArray.sort()
yArray.sort()

if xArray[0] == xArray[1] && xArray[0] != xArray[2] {
    fourth.append(xArray[2])
} else {
    fourth.append(xArray[0])
}

if yArray[0] == yArray[1] && yArray[0] != yArray[2] {
    fourth.append(yArray[2])
} else {
    fourth.append(yArray[0])
}

print(fourth[0], fourth[1])

