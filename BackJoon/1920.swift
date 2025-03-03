

let n = Int(readLine()!)!
var a: [Int] = Array(repeating: 0, count: n)
a = readLine()!.split(separator: " ").map{Int($0)!}

let m = Int(readLine()!)!
var b: [Int] = Array(repeating: 0, count: m)
b = readLine()!.split(separator: " ").map{Int($0)!}

a.sort()

var answer = 0
for num in b {
    var start = 0
    var end = a.count - 1
    answer = 0
    
    while start <= end {
        let mid = (start + end) / 2
        
        if a[mid] == num {
            answer = 1
            break
        }
        
        if num < a[mid] {
            end = mid - 1
        }
        
        if num > a[mid] {
            start = mid + 1
        }
    }
    
    print(answer)
}
