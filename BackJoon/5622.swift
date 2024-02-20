import Foundation




//방법1

//let alphabet = readLine()!
//var second = 0
//
//for char in alphabet {
//    if char == "A" || char == "B" || char == "C" {
//        second += 3
//    } else if char == "D" || char == "E" || char == "F" {
//        second += 4
//    } else if char == "G" || char == "H" || char == "I" {
//        second += 5
//    } else if char == "J" || char == "K" || char == "L" {
//        second += 6
//    } else if char == "M" || char == "N" || char == "O" {
//        second += 7
//    } else if char == "P" || char == "Q" || char == "R" || char == "S" {
//        second += 8
//    } else if char == "T" || char == "U" || char == "V" {
//        second += 9
//    } else if char == "W" || char == "X" || char == "Y" || char == "Z" {
//        second += 10
//    } else {
//        second += 11
//    }
//}
//
//print(second)


//방법2

let keys = (65...90).map {
    Character(UnicodeScalar($0)!)
}

let distances = [3,3,3,3,3,4,3,4].enumerated().flatMap {
    Array(repeating: $0 + 3, count: $1)
}

let dict = Dictionary(uniqueKeysWithValues: zip(keys, distances))

print(readLine()!.reduce(0){$0 + dict[$1]!})








