//
//  main.swift
//  CommandTool
//
//  Created by 권대윤 on 1/31/24.
//

import Foundation


//fail: 시간초과
//for _ in 1...Int(readLine()!)! {
//    print( readLine()!.split(separator: " ").map {Int($0)!}.reduce(0, +) )
//}

//라이노님이 만든 빠른 입출력용 클래스이다. 코드원리는 모르겠지만 이 클래스를 사용하여 입출력을 받아야 시간 1초를 넘기지 않고 통과할 수 있다.
final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}


let fIO = FileIO()

for _ in 1...fIO.readInt() {
    var s = fIO.readInt()+fIO.readInt()
    print(s)
}
