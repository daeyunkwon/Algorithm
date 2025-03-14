


let n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map { Int($0)! }.sorted()


var answer = 0

for i in 0...a.count - 1 {
    let find = a[i]
    
    var start = 0
    var end = a.count - 1
    
    while start < end {
        if i == start {
            start += 1
            continue
        }
        
        if i == end {
            end -= 1
            continue
        }
        
        let sum = a[start] + a[end]
        
        if i != start && i != end && sum == find {
            answer += 1
            break
        }
        
        if sum > find {
            end -= 1
            continue
        }
        
        if sum < find {
            start += 1
        }
    }
}

print(answer)


