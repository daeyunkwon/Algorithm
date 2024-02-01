//
//  main.swift
//  CommandTool
//
//  Created by 권대윤 on 1/31/24.
//

import Foundation


let firstLineNumber = Int(readLine()!)!

let secondLineNumber = readLine()!

let one = secondLineNumber[secondLineNumber.index(secondLineNumber.startIndex, offsetBy: 2)]
let ten = secondLineNumber[secondLineNumber.index(secondLineNumber.startIndex, offsetBy: 1)]
let hundred = secondLineNumber[secondLineNumber.index(secondLineNumber.startIndex, offsetBy: 0)]

let numA = Int(String(one))!
let numB = Int(String(ten))!
let numC = Int(String(hundred))!

print(firstLineNumber * numA)
print(firstLineNumber * numB)
print(firstLineNumber * numC)
print( (firstLineNumber * numA) + ((firstLineNumber * numB) * 10) + ((firstLineNumber * numC) * 100) )
