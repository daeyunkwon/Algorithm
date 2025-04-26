

let n = Int(readLine()!)!
var dict: [String: Int] = [:]
for _ in 0..<n {
    let bookTitle = readLine()!
    dict[bookTitle, default: 0] += 1
}

let arr = dict.compactMap { ($0.key, $0.value) }.sorted {
    if $0.1 != $1.1 {
        // 개수가 다른 경우, 개수 기준 내림차순 정렬
        return $0.1 > $1.1
    } else {
        // 개수가 같은 경우, 문자열 기준 오름차순 정렬
        return $0.0 < $1.0
    }
}

print(arr[0].0)
