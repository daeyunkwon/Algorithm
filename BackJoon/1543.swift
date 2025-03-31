


let document = readLine()!.map { Character(String($0)) }
let word = readLine()!

var count = 0
var index = 0

while index <= document.count - 1 {
    var endIndex = index + (word.count - 1)
    
    if endIndex <= document.count - 1 {
        if String(document[index...endIndex]) == word {
            count += 1
            index += word.count
        } else {
            index += 1
        }
    } else {
        break
    }
}

print(count)
