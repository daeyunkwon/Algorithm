



let nm = readLine()!.split(separator: " ").map{Int($0)!}
var mySet: Set<String> = []
var count = 0

for _ in 0..<nm[0] {
    mySet.insert(readLine()!)
}

for _ in 0..<nm[1] {
    let word = readLine()!
    if mySet.contains(word) {
        count += 1
    }
}

print(count)
