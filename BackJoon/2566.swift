



var max = 0
var yx = (0, 0)

for y in 0...8 {
    let values = readLine()!.split(separator: " ").map{Int($0)!}
    for x in 0...8 {
        if values[x] >= max { // > 으로 할 경우 오답처리된다.
            max = values[x]
            yx.0 = y+1
            yx.1 = x+1
        }
    }
}

print(max)
print(yx.0, yx.1)

