



let s = readLine()!.map { String($0) }

var set = Set<String>()

for i in 0..<s.count {
    var string = ""
    for j in i..<s.count {
        string.append(s[j])
        set.insert(string)
    }
}

print(set.count)
