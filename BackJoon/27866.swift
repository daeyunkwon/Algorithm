import Foundation



//방법 1

//let s = readLine()!
//let i = Int(readLine()!)!
//let stringIndex = s.index(s.startIndex, offsetBy: i-1)
//
//print(s[stringIndex])


//방법2

let s = readLine()!
let i = Int(readLine()!)! - 1

print(Array(s)[i])
