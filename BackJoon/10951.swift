
import Foundation






//입력종료는 컨트롤+D

while let input = readLine(){
    print(input.split(separator: " ").map{ Int($0)! }.reduce(0, +))
}

