//
//  main.swift
//  CommandTool
//
//  Created by 권대윤 on 1/31/24.
//

import Foundation


let inputX = readLine()!
let inputY = readLine()!

let x = min(1000, max(-1000, Int(inputX)! == 0 ? 1 : Int(inputX)!))
let y = min(1000, max(-1000, Int(inputY)! == 0 ? 1 : Int(inputY)!))

if x > 0 {
    if y > 0 {
        print(1)
    } else {
        print(4)
    }
} else {
    if y > 0 {
        print(2)
    } else {
        print(3)
    }
}
