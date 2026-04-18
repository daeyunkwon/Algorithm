import Foundation

let input = readLine()!

for char in input {
    if char >= "a" && char <= "z" {
        print(char.uppercased(), terminator: "")
    } else {
        print(char.lowercased(), terminator: "")
    }
}


