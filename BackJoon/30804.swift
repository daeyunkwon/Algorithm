

let n = Int(readLine()!)!
let fruits: [Int] = readLine()!.split(separator: " ").map { Int($0)! }

var start: Int = 0
var fruitCount: [Int: Int] = [:]
var answer: Int = 0

for end in 0..<n {
    let fruit = fruits[end]
    fruitCount[fruit, default: 0] += 1
    
    while fruitCount.keys.count > 2 {
        let removeFruit = fruits[start]
        fruitCount[removeFruit]! -= 1
        if fruitCount[removeFruit]! == 0 {
            fruitCount.removeValue(forKey: removeFruit)
        }
        
        start += 1
    }
    
    answer = max(answer, end - start + 1)
}

print(answer)
