//
//  main.swift
//  CommandTool
//
//  Created by 권대윤 on 1/31/24.
//

import Foundation


let total = Int(readLine()!)!
var sum = 0

for _ in 1...Int(readLine()!)! {
    sum += readLine()!.split(separator: " ").map{Int($0)!}.reduce(1, *)
}

print(total == sum ? "Yes":"No")
