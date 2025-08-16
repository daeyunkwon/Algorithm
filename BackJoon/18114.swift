import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, c) = (line[0], line[1]) // 물건의 개수, 무게

var arr = readLine()!.split(separator: " ").map { Int($0)! }
arr.sort()

if arr.contains(c) { // 이벤트 조건 만족
    print(1)
    exit(0)
}

for i in 0..<arr.count-1 {
    for j in i+1..<arr.count {
        if arr[i] + arr[j] == c { // 이벤트 조건 만족
            print(1)
            exit(0)
        }
        
        // 여기까지 오면 3번째 수를 찾아야 하는데, 이때 이분탐색을 사용
        var left = 0
        var right = arr.count - 1
        while left <= right {
            let mid = (left + right) / 2
            
            let sum = arr[mid] + arr[i] + arr[j]
            
            if mid != i && mid != j && sum == c { // 이벤트 조건 만족
                print(1)
                exit(0)
            }
            
            if sum >= c {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
    }
}

print(0)



