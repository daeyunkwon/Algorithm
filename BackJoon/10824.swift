


let input = readLine()!.split(separator: " ").map { String($0) }
var answer = 0

answer += Int((input[0] + input[1]))!
answer += Int((input[2] + input[3]))!

print(answer)
