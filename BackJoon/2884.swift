//
//  main.swift
//  CommandTool
//
//  Created by 권대윤 on 1/31/24.
//

import Foundation


let arr = readLine()!.split(separator: " ").map {Int($0)!}

var h = max(0, min(23, arr[0]))
var m = max(0, min(59, arr[1]))

let sub = m - 45

if sub < 0 {
    m = 60 + sub
    if h == 0 {
        h = 23
    } else {
        h -= 1
    }
} else {
    m = sub
}

print(h, m)


