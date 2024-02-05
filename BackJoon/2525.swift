//
//  main.swift
//  CommandTool
//
//  Created by 권대윤 on 1/31/24.
//

import Foundation


let arr = readLine()!.split(separator: " ").map {Int($0)!}
let time = Int(readLine()!)!

var h = arr[0]
var m = arr[1]

h = (((time+m) / 60) + h) % 24
m = (time + m) % 60

print(h, m)
