

let tc = Int(readLine()!)!
for _ in 0..<tc {
    let firstNoteCount = Int(readLine()!)!
    var firstNoteNums = readLine()!.split(separator: " ").map { Int($0)! }
    let secondNoteCount = Int(readLine()!)!
    var secondNoteNums = readLine()!.split(separator: " ").map { Int($0)! }
    
    firstNoteNums.sort()
    
    var answer: [Int] = []
    
    func binarySearch(_ arr: [Int], _ target: Int) -> Int {
        var start = 0
        var end = arr.count - 1
        
        while start <= end {
            let mid = (start + end) / 2
            
            if arr[mid] < target {
                start = mid + 1
            } else if arr[mid] > target {
                end = mid - 1
            } else if arr[mid] == target {
                return 1
            }
        }
        
        return 0
    }
    
    for i in 0...secondNoteCount-1 {
        let target = secondNoteNums[i]
        let result = binarySearch(firstNoteNums, target)
        answer.append(result)
    }
    
    answer.forEach {
        print($0)
    }
}
