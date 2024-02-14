
import Foundation


//방법1

//var arr = Array(1...30)
//
//for _ in 1...28 {
//    let input = Int(readLine()!)!
//    
//    arr[input-1] = 0
//}
//
//print(arr.first{$0 != 0}!)
//
//print(arr.last{$0 != 0}!)


//방법2
var input: [Int] = []
for _ in 1...28 {
    input.append(Int(readLine()!)!)
}

(1...30).forEach {
    if !input.contains($0) {
        print($0)
    }
}


