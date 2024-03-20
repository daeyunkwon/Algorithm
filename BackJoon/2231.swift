



let n = Int(readLine()!)!
var answer = 0

for i in max(1, n - 6*9)...n {
    
    let numArray = String(i).map{Int(String($0))!}
    
    let sumOfNumArray = numArray.reduce(0, +)
    
    if n == i + sumOfNumArray {
        answer = i
        break
    }
}

print(answer)
