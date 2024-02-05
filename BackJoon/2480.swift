//
//  main.swift
//  CommandTool
//
//  Created by 권대윤 on 1/31/24.
//

import Foundation


let arr = readLine()!.split(separator: " ").map {Int($0)!}

var mySetForCount = Set(arr)

var dict = arr.reduce(into: [:]) { partialResult, arrElement in
    partialResult[arrElement, default: 0] += 1
}

if mySetForCount.count == 3 {
    //주사위 눈이 모두 다른 경우
    print( dict.max{$0.key < $1.key}!.key * 100 )
} else if mySetForCount.count == 2 {
    //2개의 주사위 눈이 같은 경우
    print( 1000 + dict.max{$0.value < $1.value}!.key * 100 )
} else if mySetForCount.count == 1 {
    //주사위 눈이 모두 같은 경우
    print( 10000 + arr[0] * 1000 )
}


