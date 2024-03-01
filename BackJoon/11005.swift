






let input = readLine()!.split(separator: " ").map{Int($0)!}

let output = String(input[0], radix: input[1])

print(output.uppercased())
