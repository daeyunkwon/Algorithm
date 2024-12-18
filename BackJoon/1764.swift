



let nm = readLine()!.split(separator: " ").map { Int($0)! }

var set = Set<String>()

var answer: [String] = []

for _ in 1...nm[0] {
    let name = readLine()!
    set.insert(name)
}

for _ in 1...nm[1] {
    let name = readLine()!
    if !set.insert(name).inserted {
        answer.append(name)
    }
}

answer.sort(by: <)

print(answer.count)
answer.forEach {
    print($0)
}
