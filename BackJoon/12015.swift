

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var array: [Int] = []

for i in 0...n-1 {
    if i == 0 {
        array.append(nums[i])
        continue
    }
    
    if array.last! < nums[i] {
        array.append(nums[i])
        continue
    }
    
    // 모아둔 수열의 마지막 값보다 작은 수 혹은 동일한 값의 수
    // 해당 작은 수를 모아둔 수열 중간에 끼워넣는 작업이 필요하다.
    var start = 0
    var end = array.count - 1
    let targetNum = nums[i]
    
    while start <= end {
        let mid = (start + end) / 2
        
        if targetNum < array[mid] {
            end = mid - 1
        }
        
        if targetNum > array[mid] {
            start = mid + 1
        }
        
        if targetNum == array[mid] {
            start = mid
            break
        }
    }
    
    array[start] = targetNum
}

print(array.count)
