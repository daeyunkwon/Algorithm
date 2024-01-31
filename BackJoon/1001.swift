//
//  main.swift
//  CommandTool
//
//  Created by 권대윤 on 1/23/24.
//

import Foundation



let arr = readLine()!.split(separator: " ").map {
    Int($0)!
}

let a = arr[0]
let b = arr[1]

print(a - b)

