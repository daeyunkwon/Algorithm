//
//  main.swift
//  CommandTool
//
//  Created by 권대윤 on 1/31/24.
//

import Foundation

//방법1

//var sum = 0
//
//for i in 1...Int(readLine()!)! {
//    sum += i
//}
//
//print(sum)

//방법2

let n = Int(readLine()!)!
print(n*(n+1)/2)



//reduce 사용연습

//var arr: [Int] = []
//
//for i in 1...Int(readLine()!)! {
//    arr.append(i)
//}
//
//print(arr.reduce(0) { partialResult, n in
//    partialResult + n
//})
