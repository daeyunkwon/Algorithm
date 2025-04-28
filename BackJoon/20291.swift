
let n = Int(readLine()!)!
var dict: [String: Int] = [:]
for _ in 0..<n {
    let file = readLine()!
    
    var name: String = ""
    var saveFlag = false
    
    for char in file {
        if char == "." {
            saveFlag = true
            continue
        }
        
        if saveFlag {
            name += String(char)
        }
    }
    
    dict[name, default: 0] += 1
}

var arr: [(String, Int)] = dict.map { ($0.key, $0.value) }.sorted {
    $0.0 < $1.0
}

arr.forEach { print($0.0, $0.1) }
