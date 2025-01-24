


let input = readLine()!.split(separator: " ").map { Int($0)! }, n = input[0], m = input[1]


func countK(_ n: Int, _ k: Int) -> Int {
    var result = 0
    var temp = k
    
    while temp <= n {
        result += n / temp
        temp *= k
    }
    return result
}

let two = countK(n, 2) - countK(m, 2) - countK(n-m, 2)
let five = countK(n, 5) - countK(m, 5) - countK(n-m, 5)

print(min(two, five))
