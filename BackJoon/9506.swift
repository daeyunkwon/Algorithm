
//방법1

//while true {
//    let input = Int(readLine()!)!
//    var factorArray: [Int] = []
//    
//    if input == -1 {
//        break
//    }
//    
//    for i in 1..<input {
//        if input % i == 0 {
//            factorArray.append(i)
//        }
//    }
//    
//    if factorArray.reduce(0, +) == input {
//        let string = factorArray.map{String($0)}.joined(separator: " + ")
//        print("\(input) = \(string)")
//    } else {
//        print("\(input) is NOT perfect.")
//    }
//}


//방법2

while true {
    let input = Int(readLine()!)!
    
    if input == -1 {
        break
    }
    
    let perfects = [
        6: "1 + 2 + 3",
        28: "1 + 2 + 4 + 7 + 14",
        496: "1 + 2 + 4 + 8 + 16 + 31 + 62 + 124 + 248",
        8128: "1 + 2 + 4 + 8 + 16 + 32 + 64 + 127 + 254 + 508 + 1016 + 2032 + 4064",
    ]
    
    if let perfect = perfects[input] {
        print(input, "=", perfect)
    } else {
        print(input, "is NOT perfect.")
    }
}


