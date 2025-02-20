


var first: Int = 0
var second: Int = 0

var dwarves: [Int] = []
for _ in 1...9 {
    let input = Int(readLine()!)!
    dwarves.append(input)
}

var sum: Int = dwarves.reduce(0, +) - 100

for i in 0...dwarves.count-2 {
    for j in i+1...dwarves.count-1 {
        if dwarves[i] + dwarves[j] == sum {
            first = dwarves[i]
            second = dwarves[j]
            break
        }
    }
}

dwarves.remove(at: dwarves.firstIndex(of: first)!)
dwarves.remove(at: dwarves.firstIndex(of: second)!)

dwarves.sorted().forEach {
    print($0)
}
