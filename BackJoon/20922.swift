


let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (line[0], line[1])

let nums = readLine()!.split(separator: " ").map { Int($0)! }

var count: [Int: Int] = [:]
var left = 0
var answer = 0

for r in 0..<n {
    let num = nums[r]
    count[num, default: 0] += 1
    
    while count[num]! > k {
        let leftNum = nums[left]
        left += 1
        count[leftNum]! -= 1
    }
    
    let currentLength = r - left + 1
    answer = max(answer, currentLength)
}

print(answer)
