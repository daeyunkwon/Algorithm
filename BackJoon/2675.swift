import Foundation





for _ in 1...Int(readLine()!)! {
    let rs = readLine()!.split(separator: " ")
    var s = ""
    for i in 0...rs[1].count-1 {
        let stringIndex = rs[1].index(rs[1].startIndex, offsetBy: i)
        s.append(String(repeating: rs[1][stringIndex], count: Int(rs[0])!))
    }
    print(s)
}
