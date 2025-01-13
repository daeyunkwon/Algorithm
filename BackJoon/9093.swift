


let n = Int(readLine()!)!

for _ in 1...n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    
    var answer = ""
    
    for i in 0...input.count - 1 {
        let arr = input[i].map { Character(String($0)) }
        
        if i == input.count - 1 {
            answer += (arr.reversed())
        } else {
            answer += (arr.reversed() + " ")
        }
    }
    
    print(answer)
}
