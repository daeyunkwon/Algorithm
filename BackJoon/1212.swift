



let octalNumber = readLine()!.map { Int(String($0))! }

var answer = ""

for (index, num) in octalNumber.enumerated() {
    // 8진수 숫자를 3자리 2진수로 변환
    var binary = String(num, radix: 2)
    
    // 첫 번째 숫자가 아닌 경우 3자리를 맞추기 위해 앞에 0을 추가
    if index > 0 {
        while binary.count < 3 {
            binary = "0" + binary
        }
    }
    
    answer += binary
}

print(answer)
