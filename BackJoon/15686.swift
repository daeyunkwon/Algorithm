
// 0: 빈칸, 1: 집, 2: 치킨집
// 치킨 거리는 집과 가장 가까운 치킨집 사이의 거리
// 각각의 집은 치킨 거리를 가지고 있다. 도시의 치킨 거리는 모든 집의 치킨 거리의 합

// 치킨 거리 구하는 식 -> |y1 - y2| + |x1 - x2|

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0] // 행
let m = nm[1] // 열
var arr: [[Int]] = .init(repeating: [], count: n+1)

var chickenHouse: [(Int, Int)] = [] // 치킨집 좌표들
var house: [(Int, Int)] = [] // 집 좌표들
 
for i in 1...n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append(input)
    for j in 0..<input.count {
        let value = input[j]
        if value == 2 {
            chickenHouse.append((i, j+1))
        } else if value == 1 {
            house.append((i, j+1))
        }
    }
}

var answer: Int = Int.max // M개를 골랐을 때, 도시의 치킨 거리의 최솟값

func executeThreeCombination(_ start: Int, selected: [(Int, Int)]) { // 치킨집 m개씩 조합하고, 치킨 거리 구하기
    if selected.count == m { // 치킨집 m개가 조합된 경우
        var totalDistance = 0
        
        for h in house {
            let hy = h.0
            let hx = h.1
            var minDistance: Int = Int.max
            
            for chicken in selected {
                let cy = chicken.0
                let cx = chicken.1
                
                let distance = abs(hy - cy) + abs(hx - cx)
                minDistance = min(minDistance, distance)
            }
            
            totalDistance += minDistance
        }
        
        answer = min(answer, totalDistance)
    }
    
    
    for i in start..<chickenHouse.count {
        executeThreeCombination(i + 1, selected: selected + [chickenHouse[i]])
    }
}

executeThreeCombination(0, selected: [])

print(answer)
