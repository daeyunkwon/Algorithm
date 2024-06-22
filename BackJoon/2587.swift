




var a = 0
var m = 0
var numbers: [Int] = []

for _ in 1...5 {
    numbers.append(Int(readLine()!)!)
}

a = numbers.reduce(0, +); a /= numbers.count
print(a)

numbers.sort(by: <)
m = numbers[numbers.count / 2]
print(m)
