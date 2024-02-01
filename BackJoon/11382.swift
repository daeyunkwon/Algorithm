//
//  main.swift
//  CommandTool
//
//  Created by 권대윤 on 1/31/24.
//

import Foundation


let arr = readLine()!.split(separator: " ").map { (Int($0)!) }

print(arr[0] + arr[1] + arr[2])
