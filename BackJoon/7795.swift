

for _ in 1...Int(readLine()!)! {
    
    let _ = readLine()!.split(separator: " ").map { Int($0)! }
    
    let a = readLine()!.split(separator: " ").map { Int($0)! }
    let b = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    
    var answer = 0
    
    for num in a {
        var count = 0
        var start = 0
        var end = b.count - 1
        
        while start <= end {
            let mid = (start + end) / 2
            
            if num > b[mid] {
                start = mid + 1
                count = mid + 1 // B의 인덱스에 +1 해서 숫자 개수 구하기
            } else {
                end = mid - 1
            }
        }
        answer += count
    }
    
    print(answer)
}
