

let s = Array(readLine()!)
var answer: [Character] = []

for char in s {
    if char.isNumber || char.isWhitespace {
        answer.append(char)
        continue
    }
    
    if char.isUppercase {
        var rot = char.asciiValue! + 13
        
        if (65 + 25) < rot {
            let value = rot - (65 + 25)
            rot = 65 + value - 1
        }
        
        answer.append(Character(UnicodeScalar(rot)))
        continue
    }
    
    if char.isLowercase {
        var rot = char.asciiValue! + 13
        
        if (97 + 25) < rot {
            let value = rot - (97 + 25)
            rot = 97 + value - 1
        }
        
        answer.append(Character(UnicodeScalar(rot)))
    }
}

print(String(answer))
