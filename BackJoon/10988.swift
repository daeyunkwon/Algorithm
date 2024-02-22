





let word = readLine()!.map({Character(String($0))})

var reverse = Array(word.reversed())

var isPalindrom = 1

for i in 0...word.count-1 {
    if word[i] != reverse[i] {
        isPalindrom = 0
    }
}

print(isPalindrom)
