
let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var index = (0, 0)
var min = Int.max

var start = 0
var end = arr.count - 1

while start < end {
    let sum = arr[start] + arr[end]
    
    if sum == 0 {
        print(arr[start], arr[end])
        break
    }
    
    if abs(sum) < min {
        min = abs(sum)
        index.0 = start
        index.1 = end
    }
    
    if sum < 0 {
        start += 1
    } else if sum > 0 {
        end -= 1
    }
}

print(
    arr[index.0], arr[index.1]
)
