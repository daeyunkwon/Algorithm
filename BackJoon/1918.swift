

let input = Array(readLine()!)
var answer: [Character] = []
var stack: [Character] = []
let operatorPriority: [Character: Int] = ["+": 1, "-": 1, "*": 2, "/": 2, "(": 0]

for item in input {
    if item.isLetter {
        answer.append(item)
    } else {
        if item == "(" {
            stack.append(item)
        } else if item == ")" {
            while !stack.isEmpty {
                let op = stack.popLast()!
                if op == "(" { break }
                answer.append(op)
            }
        } else if stack.isEmpty || operatorPriority[item]! > operatorPriority[stack.last!]! {
            stack.append(item)
        } else {
            while !stack.isEmpty {
                let temp = stack.last!
                if operatorPriority[temp]! >= operatorPriority[item]! {
                    let data = stack.popLast()!
                    answer.append(data)
                } else {
                    break
                }
            }
            stack.append(item)
        }
    }
}

while !stack.isEmpty {
    let value = stack.popLast()!
    answer.append(value)
}

print(String(answer))
