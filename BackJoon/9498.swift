//
//  main.swift
//  CommandTool
//
//  Created by 권대윤 on 1/31/24.
//

import Foundation


let input = readLine()!

let value = min(100, max(0, Int(input)!))

if 90 <= value && value <= 100 {
    print("A")
} else if 80 <= value && value <= 89 {
    print("B")
} else if 70 <= value && value <= 79 {
    print("C")
} else if 60 <= value && value <= 69 {
    print("D")
} else {
    print("F")
}


