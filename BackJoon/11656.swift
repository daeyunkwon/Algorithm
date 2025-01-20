

let input = Array(readLine()!)
var answer: [String] = []

for i in 0...input.count-1 {
    var str = ""
    
    for j in i...input.count-1 {
        str += String(input[j])
    }
    
    answer.append(str)
}

answer.sorted().forEach {
    print($0)
}
