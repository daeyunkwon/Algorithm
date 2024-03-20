



let input = readLine()!.split(separator: " ").map{Int($0)!}
let n = input[0]
let m = input[1]

let cards = readLine()!.split(separator: " ").map{Int($0)!}

var sumArray: [Int] = []

for i in 0..<cards.count-2 {
    
    for j in i+1..<cards.count-1 {
        
        for k in j+1...cards.count-1 {
            
            if (cards[i]+cards[j]+cards[k]) <= m {
                sumArray.append((cards[i]+cards[j]+cards[k]))
            }
            
        }
        
    }
    
}

print(sumArray.max()!)
