

while let input = readLine() {
    let arr = Array(input)
    
    var lower = 0
    var upper = 0
    var num = 0
    var space = 0
    
    for char in arr {
        if char.isLowercase {
            lower += 1
        } else if char.isUppercase {
            upper += 1
        } else if char.isNumber {
            num += 1
        } else if char.isWhitespace {
            space += 1
        }
    }
    
    print(lower, upper, num, space)
}
