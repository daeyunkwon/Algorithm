
import Foundation

func solution(_ arr:[[Int]]) -> [[Int]] {
    let rowCount = arr[0].count
    let columnCount = arr.count
    let size = max(rowCount, columnCount)
    
    var answer: [[Int]] = .init(repeating: .init(repeating: 0, count: size), count: size)
    
    for y in 0..<arr.count {
        for x in 0..<arr[0].count {
            answer[y][x] = arr[y][x]
        }
    }
    
    return answer
}
