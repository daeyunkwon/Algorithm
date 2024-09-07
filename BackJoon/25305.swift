





let count = readLine()!.split(separator: " ").map { Int($0)! }

var score = readLine()!.split(separator: " ").map{Int($0)!}

var sortedScoreList: [Int] = []

for i in 0..<count[0] {
    sortedScoreList.append(score[i])
}

sortedScoreList.sort(by: >)

print(sortedScoreList[count[1] - 1])


