

let s = Array(readLine()!)

var dict: [Character: Int] = [:]

var answer: [String] = []

for i in 0...25 {
    dict[Character(UnicodeScalar(97+i)!)] = 0
}

for char in s {
    dict[char]! += 1
}

for i in 0...25 {
    let value = dict[Character(UnicodeScalar(97+i)!)]!
    answer.append(String(value))
}

print(answer.joined(separator: " "))
