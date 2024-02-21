




//방법1

//let chess = readLine()!.split(separator: " ").map{Int($0)!}
//
//print(
//    1 - chess[0],
//    1 - chess[1],
//    2 - chess[2],
//    2 - chess[3],
//    2 - chess[4],
//    8 - chess[5]
//)


//방법2

let chess = readLine()!.split(separator: " ").map{Int($0)!}

print(
    chess.enumerated().map{[1,1,2,2,2,8][$0] - $1}.map{String($0)}.joined(separator: " ")
)
