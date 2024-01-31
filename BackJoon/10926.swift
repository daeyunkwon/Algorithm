//
//  main.swift
//  CommandTool
//
//  Created by 권대윤 on 1/31/24.
//

import Foundation


var id = readLine()!

var lowerId = id.lowercased()

if lowerId.count > 50 {
    if lowerId.count == 51 {
        lowerId.remove(at: id.index(id.startIndex, offsetBy: 50))
    } else {
        lowerId.removeSubrange(id.index(id.startIndex, offsetBy: 50)...)
    }
}

print(lowerId + "??!")



