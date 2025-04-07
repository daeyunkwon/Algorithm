
let n = Int(readLine()!)!
var villages: [(Int, Int)] = []
var sum = 0

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let village = input[0]
    let people = input[1]
    villages.append((village, people))
    sum += people
}

let referencePoint = sum / 2

var cur = 0
villages.sort { $0.0 < $1.0 } // 마을 위치 기준 오름차순 정렬
for item in villages {
    cur += item.1
    
    if cur >= referencePoint { // 우체국 세울 마을 위치를 찾음
        print(item.0)
        break
    }
}
