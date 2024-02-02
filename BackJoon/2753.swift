//
//  main.swift
//  CommandTool
//
//  Created by 권대윤 on 1/31/24.
//

import Foundation


let input = readLine()!

let value = min(4000, max(1, Int(input)!))


if value % 4 == 0 {
    
    if value % 100 == 0 && value % 400 != 0 {
        print(0)
    } else {
        print(1)
    }
    
} else {
    print(0)
}
