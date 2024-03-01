



//방법1

//var range = 6
//var num = 1
//let inputNumber = Int(readLine()!)!
//var isFind = false
//
//if inputNumber == 1 {
//    print(1)
//} else {
//    for i in 2... {
//        
//        for _ in 1...range {
//            num += 1
//            if inputNumber == num {
//                isFind = true
//                break
//            }
//        }
//        
//        if isFind {
//            print(i)
//            break
//        } else {
//            range += 6
//        }
//    }
//}


//방법2

let n = Int(readLine()!)!

var range = 1

var i = 0

while true {
    range += 6 * i
    
    if n <= range {
        print(i+1)
        break
    }
    
    i += 1
}
