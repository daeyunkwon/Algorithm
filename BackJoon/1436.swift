

//방법1

//let n = Int(readLine()!)!
//var index = 0
//var answer = 0
//
//for i in 666... {
//    if index == n {
//        break
//    }
//    
//    let arr = String(i).map{String($0)}
//    for j in 0..<arr.count-2 {
//        if arr[j] == "6" {
//            if arr[j] == arr[j+1] && arr[j] == arr[j+2] {
//                index += 1
//                answer = i
//                break
//            }
//        }
//    }
//}
//
//print(answer)


//방법2

let n = Int(readLine()!)!
var index = 0
var answer = 0

for i in 666... {
    if index == n {
        break
    }
    
    var temp = i
    
    while temp >= 666 {
        if temp % 1000 == 666 {
            index += 1
            answer = i
            break
        } else {
            temp = temp / 10
        }
    }
    
}

print(answer)
