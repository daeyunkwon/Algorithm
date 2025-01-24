

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    }
    
    return gcd(b, a % b)
}

for _ in 1...Int(readLine()!)! {
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    var answer = 0
    
    for i in 1..<nums[0] {
        for j in i+1...nums[0] {
            let result = gcd(nums[i], nums[j])
            answer += result
        }
    }
    
    print(answer)
}


