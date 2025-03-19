

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var list: [Int] = [arr[0]]


for num in arr {
    if list.isEmpty || num > list.last! {
        list.append(num)
        continue
    }
    
    var start = 0
    var end = list.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if num > list[mid] {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    list[start] = num
}

print(list.count)




