
import Foundation





for i in 1...Int(readLine()!)! {
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    print("Case #\(i): \(arr[0]) + \(arr[1]) = \(arr[0]+arr[1])")
}
