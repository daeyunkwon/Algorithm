




let n = Int(readLine()!)!
var stack: [Int] = []
var start = 1
let nums = readLine()!.split(separator: " ").map { item in
    return Int(item)!
}
let dict = Dictionary(nums.map { ($0, 1) }, uniquingKeysWith: +)
var answer: [Int] = Array(repeating: -1, count: n)

for i in 0...nums.count - 1 {
    
    while !stack.isEmpty && dict[nums[stack.last!]]! < dict[nums[i]]! {
        answer[stack.popLast()!] = nums[i]
    }
    
    stack.append(i)
}

print(answer.map { String($0) }.joined(separator: " "))
