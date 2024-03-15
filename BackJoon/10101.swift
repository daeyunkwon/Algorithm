



let x = Int(readLine()!)!
let y = Int(readLine()!)!
let z = Int(readLine()!)!

var arr = [x, y, z]

if x+y+z == 180 {
    
    let dict = arr.reduce(into: [:]) {
        $0[$1, default: 0] += 1
    }
    
    dict.count == 1 ? print("Equilateral") : dict.count == 2 ? print("Isosceles") : print("Scalene")
    
} else {
    print("Error")
}
