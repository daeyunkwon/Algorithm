
import Foundation

/*
 1. 플레이어는 주사위를 굴려 나온 수만큼 이동
 2. 주사위를 굴린 결과가 100번 칸을 넘어간다면 이동할 수 없다.
 3. 도착한 칸이 사다리면, 사다리를 타고 위로 올라간다. 사다리를 이용해 이동한 칸의 번호는 원래 있던 칸의 번호보다 크고!
 4. 뱀이 있는 칸에 도착하면, 뱀을 따라서 내려가게 된다. 뱀을 이용해 이동한 칸의 번호는 원래 있던 칸의 번호보다 작아진다.
 5. 게임의 목표는 1번 칸에서 시작해서 100번 칸에 도착하는 것이다.
 -  100번 칸에 도착하기 위해 주사위를 굴려야 하는 횟수의 최솟값을 구해보자.
 */

let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (firstLine[0], firstLine[1]) // 사다리 수, 뱀의 수

var ladder: [Int: Int] = [:]
var snake: [Int: Int] = [:]

for _ in 1...N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (origin, arrival) = (input[0], input[1])
    ladder[origin - 1, default: 0] = arrival - 1
}

for _ in 1...M {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (origin, arrival) = (input[0], input[1])
    snake[origin - 1, default: 0] = arrival - 1
}

let dice: [Int] = [1, 2, 3, 4, 5, 6]

func bfs() {
    var queue: [(Int, Int)] = [(0, 0)]
    var index = 0
    var visited: [Bool] = .init(repeating: false, count: 100)
    visited[0] = true
    
    while index < queue.count {
        let now = queue[index].0
        let count = queue[index].1 + 1
        
        for num in dice {
            var next = now + num
            
            if next == 99 {
                print(count)
                exit(0)
            }
            
            if next < 0 || next >= 100 { continue }
            
            if let value = ladder[next] {
                next = value
            }
            
            if let value = snake[next] {
                next = value
            }
            
            if !visited[next] {
                visited[next] = true
                queue.append((next, count))
            }
        }
        
        index += 1
    }
}

bfs()
