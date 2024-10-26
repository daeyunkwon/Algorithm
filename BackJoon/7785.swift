



let n = Int(readLine()!)!

var myDict: [String: String] = [:]

for _ in 0..<n {
    let person = readLine()!.split(separator: " ").map{String($0)}
    myDict[person[0]] = person[1]
}

var answer: [String] = []

for item in myDict {
    if item.value == "enter" {
        answer.append(item.key)
    }
}

answer.sort(by: >)

answer.forEach { print($0) }
