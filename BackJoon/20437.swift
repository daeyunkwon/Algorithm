

/*
 알파벳 소문자로 이루어진 문자열 W가 주어진다.
 양의 정수 K가 주어진다.
 어떤 문자를 정확히 K개를 포함하는 가장 짧은 연속 문자열의 길이를 구한다.
 어떤 문자를 정확히 K개를 포함하고, 문자열의 첫 번째와 마지막 글자가 해당 문자로 같은 가장 긴 연속 문자열의 길이를 구한다.
 */

import Foundation

let t = Int(readLine()!)!

for _ in 1...t {
    
    var dict: [String: [Int]] = [:] // 문자: 해당 문자의 인덱스 값들
    
    let chars = readLine()!.map { String($0) }
    let k = Int(readLine()!)!
    
    // 문자들의 인덱스 정보 저장 작업
    for i in 0..<chars.count {
        let char = chars[i]
        dict[char, default: []].append(i)
    }
    
    var minLength = Int.max
    var maxLength = 0
    
    for (_, indexInfo) in dict {
        if indexInfo.count < k { continue } // 해당 문자의 등장 횟수가 K개를 만족하지 못하므로 생략
        
        for i in 0...(indexInfo.count - k) {
            let length = indexInfo[i + k - 1] - indexInfo[i] + 1 // 두 인덱스의 차이에 +1을 해줌으로써 문자 개수 얻기
            minLength = min(minLength, length)
            maxLength = max(maxLength, length)
        }
    }
    
    if maxLength == 0 {
        print(-1)
    } else {
        print("\(minLength) \(maxLength)")
    }
}
