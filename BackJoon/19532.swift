



let input = readLine()!.split(separator: " ").map{Int($0)!}
let a = input[0]
let b = input[1]
let c = input[2]
let d = input[3]
let e = input[4]
let f = input[5]

var answerX = 0
var answerY = 0

for x in -999...999 {
    var isFind = false
    for y in -999...999 {
        if (a * x) + (b * y) == c && (d * x) + (e * y) == f {
            answerX = x
            answerY = y
            isFind = true
            break
        }
    }
    
    if isFind {
        break
    }
}

print(answerX, answerY)


