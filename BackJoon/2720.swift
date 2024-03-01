




//방법1

//let q = 25
//let d = 10
//let n = 5
//let p = 1
//
//for _ in 1...Int(readLine()!)! {
//    let c = Int(readLine()!)!
//    
//    let qCount = c / q
//    let dCount = c % q / d
//    let nCount = c % q % d / n
//    let pCount = c % q % d % n / p
//    
//    print(qCount, dCount, nCount, pCount)
//}

//방법2

let q = 25
let d = 10
let n = 5
let p = 1

for _ in 1...Int(readLine()!)! {
    var c = Int(readLine()!)!

    let qCount = c / q
    c %= q
    let dCount = c / d
    c %= d
    let nCount = c / n
    c %= n
    let pCount = c / p

    print(qCount, dCount, nCount, pCount)
}
