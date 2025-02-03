

var n = Int(readLine()!)!
var answer = 0

if n % 5 == 0 {
    answer = n / 5
} else {
    while n > 0 {
        n -= 2
        answer += 1
        if n % 5 == 0 {
            answer += n / 5
            break
        }
    }
}

if n < 0 {
    print(-1)
} else {
    print(answer)
}

