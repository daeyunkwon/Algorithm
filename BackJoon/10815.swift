



let n = Int(readLine()!)!

let set = Set(readLine()!.split(separator: " ").map{Int($0)!})

let m = Int(readLine()!)!

let cards = readLine()!.split(separator: " ").map{Int($0)!}

var result: [Int] = []
for item in cards {
    result.append(set.contains(item) ? 1 : 0)
}

print(
    result.map{String($0)}.joined(separator: " ")
)
