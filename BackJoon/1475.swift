
var dict: [Int: Int] = [:]
let n = readLine()!.map { Int(String($0))! }
for num in n {
    dict[num, default: 0] += 1
}

var answer = 0
for i in 0...9 {
    if i == 6 || i == 9 { continue } // 6과 9는 나중에 따로 개수 판별하기 위해서 스킵
    
    guard let count = dict[i] else { continue }
    
    answer = max(answer, count)
}

let six = dict[6] ?? 0
let nine = dict[9] ?? 0

if six == nine {
    answer = max(answer, six)
} else if six > nine {
    let remainder = six - nine
    let count = remainder / 2 + remainder % 2 + nine
    answer = max(answer, count)
} else if nine > six {
    let remainder = nine - six
    let count = remainder / 2 + remainder % 2 + six
    answer = max(answer, count)
}

print(answer)
