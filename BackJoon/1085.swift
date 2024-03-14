





let input = readLine()!.split(separator: " ").map{Int($0)!}

let x = input[0]
let y = input[1]
let w = input[2]
let h = input[3]

print(min(x, y, w-x, h-y))
