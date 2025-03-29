
// 시간초과
//for _ in 1...Int(readLine()!)! {
//    let n = Int(readLine()!)!
//    let arr = readLine()!.split(separator: " ").map { Int($0)! }
//    
//    var profit = 0
//    var maxPrice = arr.max()!
//    for i in 0...arr.count-1 {
//        let price = arr[i]
//        
//        if price < maxPrice {
//            profit += (maxPrice - price)
//        } else if price == maxPrice {
//            if i < arr.count-1 {
//                maxPrice = arr[i+1...arr.count-1].max()! // 뒷 영역 기준으로 최고값 다시 산정
//            }
//        }
//    }
//    
//    print(profit)
//}

for _ in 1...Int(readLine()!)! {
    let n = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    
    var profit = 0
    var maxPrice = arr.last!
    
    for i in stride(from: arr.count-1, through: 0, by: -1) {
        let price = arr[i]
        
        if price < maxPrice {
            profit += maxPrice - price
        } else {
            maxPrice = price
        }
    }
    
    print(profit)
}
