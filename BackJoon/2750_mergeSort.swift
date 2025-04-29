

let n = Int(readLine()!)!
var numbers: [Int] = []
for _ in 0..<n {
    numbers.append(Int(readLine()!)!)
}

func mergeSort(_ array: [Int]) -> [Int] {
    if array.count <= 1 { return array }
    
    let mid = array.count / 2
    let left = Array(array[0..<mid])
    let right = Array(array[mid..<array.count])
    
    return merge(mergeSort(left), mergeSort(right))
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var temp: [Int] = []
    temp.reserveCapacity(left.count + right.count)
    var l = 0
    var r = 0
    while l < left.count && r < right.count {
        if left[l] <= right[r] {
            temp.append(left[l])
            l += 1
        } else {
            temp.append(right[r])
            r += 1
        }
    }
    
    if l < left.count {
        temp.append(contentsOf: left[l...])
    }
    
    if r < right.count {
        temp.append(contentsOf: right[r...])
    }
    
    return temp
}

let sortedList = mergeSort(numbers)
sortedList.forEach { print($0) }
