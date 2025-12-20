

/*
 - CCTV는 감시할 수 있는 방향에 있는 칸 전체를 감시할 수 있다.
 - 회전은 항상 90도 방향으로 해야 하며, 감시하려고 하는 방향이 가로 또는 세로 방향
 - 지도에서 0은 빈 칸, 6은 벽, 1~5는 CCTV의 번호.
 - CCTV는 벽을 통과 못함, 하지만 CCTV는 통과 가능함.
 
 : 사무실의 크기와 상태, 그리고 CCTV의 정보가 주어졌을 때, CCTV의 방향을 적절히 정해서, 사각 지대의 최소 크기를 구하기
 */

import Foundation

struct CCTV {
    var x: Int
    var y: Int
    var type: Int
    
    init(_ x: Int, _ y: Int, _ type: Int) {
        self.x = x
        self.y = y
        self.type = type
    }
}

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1]) // 세로크기, 가로크기

var office: [[Int]] = .init(repeating: .init(repeating: 0, count: m), count: n)
var cctvList: [CCTV] = []

for y in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    for x in 0..<m {
        let value = input[x]
        
        if 1...5 ~= value {
            let cctv: CCTV = .init(x, y, value)
            cctvList.append(cctv)
        }
        
        office[y][x] = value
    }
}

/// 상: 0 하: 1 좌: 2 우: 3
var dx = [0, 0, -1, 1]
var dy = [-1, 1, 0, 0]

/// cctv 타입별 모든 방향 조합
let direction: [[[Int]]] = [
    [], // empty
    [[0], [1], [2], [3]], // 1번
    [[0, 1], [2, 3]], // 2번
    [[0, 3], [3, 1], [1, 2], [2, 0]], // 3번
    [[2, 0, 3], [0, 3, 1], [3, 1, 2], [1, 2, 0]], // 4번
    [[0, 1, 2, 3]] // 5번
]

var answer = Int.max

func dfs(_ index: Int, _ office: [[Int]]) {
    // 1. 종료 조건
    if index == cctvList.count {
        var count = 0
        
        for y in 0..<n {
            for x in 0..<m {
                if office[y][x] == 0 { count += 1 } // 사각지대
            }
        }
        answer = min(answer, count) // 더 최소값을 찾은 경우 갱신
        return
    }
    
    // 2. dfs 진행 (하나의 cctv의 하나의 방향 기준으로 dfs 진행하여 모든 cctv 방향 조합 처리됨)
    let cctv = cctvList[index]
    
    for dirSet in direction[cctv.type] {
        var copiedOffice = office
        
        for dir in dirSet {
            var x = cctv.x
            var y = cctv.y
            
            while true {
                x += dx[dir]
                y += dy[dir]
                
                if x < 0 || x >= m || y < 0 || y >= n { break }
                if copiedOffice[y][x] == 6 { break }
                
                if copiedOffice[y][x] == 0 {
                    copiedOffice[y][x] = -1 // 감시 처리
                }
            }
        }
        dfs(index + 1, copiedOffice)
    }
}

dfs(0, office)
print(answer)
