//
//  main.swift
//  CommandTool
//
//  Created by 권대윤 on 1/31/24.
//

import Foundation


var arr = readLine()!.split(separator: " ").map { subString in
    min(10000, max(2, Int(subString)!))
}

let a = arr[0]
let b = arr[1]
let c = arr[2]

print( (a+b)%c )
print( ((a%c)+(b%c))%c )
print( (a*b)%c )
print( ((a%c)*(b%c))%c )



