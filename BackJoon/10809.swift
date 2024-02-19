import Foundation





let characters = Array(readLine()!)

let alphabet: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

var output: [Int] = []

for i in 0...alphabet.count-1 {
    output.append(characters.firstIndex(of: alphabet[i]) ?? -1)
}

print(output.map{String($0)}.joined(separator: " "))
