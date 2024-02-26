



//방법1: 인덱스값의 차이를 이용한다. 차이가 1이라면 그룹단어!

//var groupCount = 0
//
//for _ in 0...Int(readLine()!)! - 1 {
//    var isGroupWord = true
//
//    let arr = readLine()!.map{Character(String($0))}
//
//    for j in 0...arr.count - 1 {
//        if j == arr.count-1 {
//            continue
//        }
//        var indexArr: [Int] = [j]
//
//        for k in j+1...arr.count - 1 {
//            if arr[j] == arr[k] {
//                indexArr.append(k)
//            }
//        }
//        //print(indexArr) //이 시점에는 특정 단어의 인덱스 값들을 모두 모았다!
//
//        for l in 0...indexArr.count - 1 {
//            if indexArr.count - 1 == l {
//                continue
//            }
//
//            if indexArr[l+1] - indexArr[l] > 1 { //앞에 인덱스값이랑 뒤에 인덱스값의 차이가 2이상이면 그룹단어X
//                isGroupWord = false
//                break
//            }
//        }
//    }
//    //print(isGroupWord)
//
//    if isGroupWord {
//        groupCount += 1
//    } else {
//        groupCount += 0
//    }
//}
//
//print(groupCount)


//방법2: 배열 갯수로 판별한다. 그룹단어일 경우 갯수는 Set(word).count 이어야 한다.

var answer: Int = 0

for _ in 1...Int(readLine()!)! {
    let word = readLine()!.map{String($0)}
    var stack: [String] = [word.first!]
    
    for i in word {
        if stack.last! != i {
            stack.append(i)
        }
    }
    
    if stack.count == Set(word).count {
        answer += 1
    }
}

print(answer)
