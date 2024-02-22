




//방법1

//let word = readLine()!.map({Character(String($0).uppercased())})
//
//let dict = word.reduce(into: [:]) {
//    $0[$1, default: 0] += 1
//}
//
//let maxValue = dict.max{a, b in a.value < b.value}!.value
//
//var isOne = 0
//
//dict.forEach { n in
//    if n.value == maxValue {
//        isOne += 1
//    }
//}
//
//isOne == 1 ? print(dict.max{a, b in a.value < b.value}!.key) : print("?")

//방법2

let word = readLine()!.map{Character(String($0).uppercased())}

let dict = word.reduce(into: [:]) {
    $0[$1, default:0] += 1
}

let maxValue = dict.max{$0.value < $1.value}!.value

let maxChar = dict.filter{$0.value == maxValue}

maxChar.count == 1 ? print(maxChar.first!.key) : print("?")



