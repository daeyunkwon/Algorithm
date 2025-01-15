



let stick = readLine()!
var stack: [Character] = []
var prev: Character = " "
var answer = 0

for char in stick {
    if char == "(" {
        stack.append(char)
    } else {
        let _ = stack.popLast()
        if prev == "(" {
            answer += stack.count
        } else {
            answer += 1
        }
    }
    prev = char
}

print(answer)
