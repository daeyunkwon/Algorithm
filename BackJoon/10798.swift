





var words = [[String]](repeating: [String](repeating: "", count: 15), count: 5)

for y in 0..<5 {
    let word = readLine()!.map { String($0) }
    let lastIndex = word.count - 1
    words[y].replaceSubrange(0..<lastIndex, with: word)
}

//print(words)

for x in 0..<15 {
    for y in 0..<5 {
        print(words[y][x], terminator: "")
    }
}



