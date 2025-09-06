
import Foundation

// a + b + c = k 가 아닌 a + b = k - c의 계산법을 사용
// 두 수의 합이 k - c가 되는 경우를 찾으면 됨
// 두 수의 합은 twoSumSet에 있음

let n = Int(readLine()!)!
var nums: [Int] = []
var twoSum: [Int] = []
var twoSumSet = Set<Int>()

for _ in 0..<n {
    let num = Int(readLine()!)!
    nums.append(num)
}

nums.sort()

for i in 0..<n {
    for j in i..<n {
        twoSum.append(nums[i] + nums[j])
    }
}

twoSumSet = Set(twoSum)

for i in stride(from: n - 1, through: 0, by: -1) {
    for j in 0..<i {
        let target = nums[i] - nums[j] // 찾아야 되는 수, k - c으로 나온 수
        
        // 이분탐색이 아닌 Set의 O(1) 검색 시간복잡도를 사용
        if twoSumSet.contains(target) {
            print(nums[i]) // 맨 처음으로 발견한 k가 제일 큰 수 이므로, 더 이상 찾을 필요 없음
            exit(0)
        }
        
//        var left = 0
//        var right = twoSum.count - 1
//        while left <= right {
//            let mid = (left + right) / 2
//            
//            if target == twoSum[mid] {
//                print(nums[i])
//                exit(0)
//                break
//            }
//            
//            if twoSum[mid] > target {
//                right = mid - 1
//            } else {
//                left = left + 1
//            }
//        }
    }
}
