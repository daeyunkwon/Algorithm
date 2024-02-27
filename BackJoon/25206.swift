


let dict = ["A+", "A0", "B+", "B0", "C+", "C0", "D+", "D0", "F", "P"]
let arr = [4.5, 4.0, 3.5, 3.0, 2.5, 2.0, 1.5, 1.0, 0.0, 9.9]

let subjectGrade = Dictionary(uniqueKeysWithValues: zip(dict, arr))

var scoreSum = 0.0
var creditSum = 0.0

for _ in 1...20 {
    let input = readLine()!.split(separator: " ").map{String($0)}
    
    if input[2] == "P" {
        continue
    }
    
    let credit = Double(input[1])!
    let grade = subjectGrade[input[2]]!
    
    scoreSum += credit * grade
    creditSum += credit
}

print(scoreSum / creditSum)
