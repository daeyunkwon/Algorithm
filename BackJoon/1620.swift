



let nm = readLine()!.split(separator: " ").map{Int($0)!}

var pokemonName: [String: Int] = [:]
var pokemonNum: [Int: String] = [:]

for i in 1...nm[0] {
    let name = readLine()!
    pokemonNum[i] = name
    pokemonName[name] = i
}

for _ in 1...nm[1] {
    let input = readLine()!
    
    if let num = Int(input) {
        print(pokemonNum[num]!)
    } else {
        print(pokemonName[input]!)
    }
}


