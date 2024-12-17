



let n = Int(readLine()!)!

let cardList = readLine()!.split(separator: " ").map { Int($0)! }
var dict = [Int: Int]()
cardList.forEach { dict[$0, default: 0] += 1 }

let m = Int(readLine()!)!

let cards = readLine()!.split(separator: " ").map { Int($0)! }

for num in cards {
    print(dict[num, default: 0], terminator: " ")
}
