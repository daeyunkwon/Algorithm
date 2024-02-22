


//실패시도

//let word = readLine()!.split(separator: "c=")
//print(word)
//
//let croatiaAlphabet = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]
//var croatiaAlphabetCount = 0
//
//for char in croatiaAlphabet {
//    let ranges = word.first!.ranges(of: char)
//    croatiaAlphabetCount += ranges.count
//}
//
//print(word.count - croatiaAlphabetCount)


//성공방법
import Foundation
var input = readLine()!

var arr = ["c=","c-","dz=","d-","lj","nj","s=","z="]

for i in 0...arr.count-1 {
    input = input.replacingOccurrences(of: arr[i] , with: "1")
}
print(input.count)
print(input)
