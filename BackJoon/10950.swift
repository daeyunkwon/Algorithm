//
//  main.swift
//  CommandTool
//
//  Created by 권대윤 on 1/31/24.
//

import Foundation

//방법1
//let tcN = Int(readLine()!)!
//var a: [Int] = []
//var b: [Int] = []
//
//for i in 1...tcN {
//    let arr = readLine()!.split(separator: " ").map{Int($0)!}
//    a.append(arr[0])
//    b.append(arr[1])
//}
//
//for i in 0...tcN-1 {
//    print(a[i]+b[i])
//}


//방법2
for _ in 1...Int(readLine()!)! {
    print(
        readLine()!.split(separator: " ").map {Int($0)!}.reduce(0, { partialResult, n in
            partialResult + n
        })
    )
}
