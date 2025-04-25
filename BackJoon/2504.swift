
let input = Array(readLine()!)
var stack: [Any] = []

var isValid = true

for char in input {
    if char == "(" || char == "[" {
        stack.append(char)
    } else {
        var temp = 0
        while let last = stack.last {
            if let num = last as? Int {
                temp += num
                stack.removeLast()
            } else if let bracket = last as? Character {
                if (char == ")" && bracket == "(") {
                    stack.removeLast()
                    stack.append(temp == 0 ? 2 : 2 * temp)
                    break
                } else if (char == "]" && bracket == "[") {
                    stack.removeLast()
                    stack.append(temp == 0 ? 3 : 3 * temp)
                    break
                } else {
                    isValid = false
                    break
                }
            }
        }
        if !isValid || stack.isEmpty {
            isValid = false
            break
        }
    }
}

if !isValid || stack.contains(where: { $0 is Character }) {
    print(0)
} else {
    let result = stack.compactMap { $0 as? Int }.reduce(0, +)
    print(result)
}
