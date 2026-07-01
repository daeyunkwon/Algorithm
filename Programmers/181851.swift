import Foundation

func solution(_ rank:[Int], _ attendance:[Bool]) -> Int {
    var answer: Int = 0
    
    var arr: [(Int, Int)] = [] // 등수, 번호
    
    for i in 0..<rank.count {
        if attendance[i] {
            let element = (rank[i], i)
            arr.append(element)
        }
    }
    
    arr.sort { f, s in
        return f.0 < s.0
    }
    
    answer = arr[0].1 * 10000 + arr[1].1 * 100 + arr[2].1
    
    return answer
}
