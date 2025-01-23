

let n = Int(readLine()!)!

var answer = 1

for i in 0...n {
    if i == 0 {
        continue
    }
    answer *= i
}

print(answer)

