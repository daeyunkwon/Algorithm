
import Foundation





//방법1

//for i in 1...Int(readLine()!)! {
//    print(String(repeating: "*", count: i))
//}


//방법2

(1...Int(readLine()!)!).map{print(String(repeating: "*", count: $0))}
