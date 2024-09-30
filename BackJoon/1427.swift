



let n = readLine()!.map{Int(String($0))!}

let sorted = n.sorted(by: >)

print(sorted.map{String($0)}.joined(separator: ""))


