

let n = Int(readLine()!)!
var cache: [Int] = Array(repeating: 0, count: n+1) //인덱스는 숫자, 값은 경우의 수

for i in 1...n {
    if i == 1 { continue }
    
    cache[i] = cache[i-1] + 1 //1을 뺀다
    
    if i % 3 == 0 { cache[i] = min(cache[i], cache[i/3]+1) } //3으로 나눈다
    if i % 2 == 0 { cache[i] = min(cache[i], cache[i/2]+1) } //2로 나눈다
}

print(cache[n])
