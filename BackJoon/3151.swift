
let n = Int(readLine()!)!
var students = readLine()!.split(separator: " ").map { Int($0)! }
students.sort()

var answer: Int64 = 0

for i in 0..<n {
    if students[i] > 0 { // 이 시점부터 i ~ N은 0보다 큰 값 밖에 없으므로 진행할 필요 없음
        break
    }
    
    var left = i + 1
    var right = n - 1
    
    while left < right {
        let sum = students[i] + students[left] + students[right]
        
        if sum == 0 {
            if students[left] == students[right] {
                let count = right - left + 1
                answer += Int64(count * (count - 1) / 2)
                break
            } else {
                var leftCount = 1
                var rightCount = 1
                
                while left + 1 < right && students[left] == students[left + 1] { // left의 중복값 개수 찾기
                    left += 1
                    leftCount += 1
                }
                
                while right - 1 > left && students[right] == students[right - 1] { // right의 중복값 개수 찾기
                    right -= 1
                    rightCount += 1
                }
                
                answer += Int64(leftCount * rightCount)
                left += 1
                right -= 1
            }
        } else if sum > 0 {
            right -= 1
        } else {
            left += 1
        }
    }
}

print(answer)
