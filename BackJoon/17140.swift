
/*
 1. 크기가 3×3인 배열 A가 있다. 배열의 인덱스는 1부터 시작한다. 1초가 지날때마다 배열에 연산이 적용된다.
 - R 연산: 배열 A의 모든 행에 대해서 정렬을 수행한다. 행의 개수 ≥ 열의 개수인 경우에 적용된다.
 - C 연산: 배열 A의 모든 열에 대해서 정렬을 수행한다. 행의 개수 < 열의 개수인 경우에 적용된다.
 
 2. 정렬된 결과를 배열에 넣을 때는, 수와 등장 횟수를 모두 넣으며, 순서는 수가 먼저이다.
 
 3. R 연산이 적용된 경우에는 가장 큰 행을 기준으로 모든 행의 크기가 변함
 
 4. C 연산이 적용된 경우에는 가장 큰 열을 기준으로 모든 열의 크기가 변함
 
 5. A[r][c]에 들어있는 값이 k가 되기 위한 연산의 최소 시간을 출력한다. 100초가 지나도 A[r][c] = k가 되지 않으면 -1을 출력한다.
 */


let rck = readLine()!.split(separator: " ").map { Int($0)! }
let (r, c, k) = (rck[0], rck[1], rck[2])

var arr: [[Int]] = .init(repeating: [], count: 3)
for i in 0..<3 {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    arr[i] = line
}

var time = 0

while true {
    // 1. 값 비교 (연산 과정에서 배열이 줄어둘 수 있음을 고려)
    if r-1 < arr.count && c-1 < arr[0].count && arr[r-1][c-1] == k {
        print(time)
        break
    }
    
    // 2. 연산
    let rowCount = arr.count
    let colCount = arr[0].count
    
    if rowCount >= colCount {
        calculateR()
    } else {
        calculateC()
    }
    
    // 3. time 증가
    time += 1
    
    if time > 100 {
        print(-1)
        break
    }
}

func calculateR() {
    var count = 0 // 한 행의 요소 개수
    
    for y in 0..<arr.count {
        var dict: [Int: Int] = [:]
        
        for x in arr[y] {
            if x == 0 { continue }
            dict[x, default: 0] += 1
        }
        
        let sorted = dict.map { ($0.key, $0.value) }.sorted { item1, item2 in
            if item1.1 == item2.1 {
                return item1.0 < item2.0
            }
            
            else {
                return item1.1 < item2.1
            }
        }
        
        var result = sorted.flatMap { [$0.0, $0.1] }
        
        if result.count > 100 {
            result = Array(result.prefix(100))
        }
        
        count = max(count, result.count)
        
        // 결과 업데이트
        arr[y] = result
    }
    
    // 0 채우기
    for y in 0..<arr.count {
        if arr[y].count < count {
            for _ in 1...count - arr[y].count {
                arr[y].append(0)
            }
        }
    }
}

func calculateC() {
    var count = 0 // 한 열의 요소 개수
    var columns: [[Int]] = []
    
    for x in 0..<arr[0].count {
        var dict: [Int: Int] = [:]
        
        for y in 0..<arr.count {
            let item = arr[y][x]
            if item == 0 { continue }
            dict[item, default: 0] += 1
        }
        
        let sorted = dict.map { ($0.key, $0.value) }.sorted { item1, item2 in
            if item1.1 == item2.1 {
                return item1.0 < item2.0
            }
            
            else {
                return item1.1 < item2.1
            }
        }
        
        var result = sorted.flatMap { [$0.0, $0.1] }
        
        if result.count > 100 {
            result = Array(result.prefix(100))
        }
        count = max(count, result.count)
        
        columns.append(result)
    }
    
    // 0 채우기
    for i in 0..<columns.count {
        if columns[i].count < count {
            columns[i].append(contentsOf: Array(repeating: 0, count: count - columns[i].count))
        }
    }
    
    // 열 -> 행
    var newArr: [[Int]] = .init(repeating: .init(repeating: 0, count: columns.count), count: count)
    
    for x in 0..<columns.count {
        for y in 0..<count {
            newArr[y][x] = columns[x][y]
        }
    }
    
    arr = newArr
}
