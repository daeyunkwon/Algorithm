


var n = Int(readLine()!)!

for i in stride(from: 2, to: n, by: 1) {
    while n % i == 0 {
        print(i)
        n = n / i
    }
}

if n != 1 {
    print(n)
}
