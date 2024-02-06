//
//  main.swift
//  CommandTool
//
//  Created by 권대윤 on 1/31/24.
//

import Foundation



let n = readLine()!.split(separator: " ").map { sub in
    Int(sub)!
}.first!

for i in 1...9 {
    print("\(n) * \(i) = \(n*i)")
}
