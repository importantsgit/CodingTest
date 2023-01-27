/*
 다익스트라 알고리즘은 그리디 알고리즘의 하나로 매 상황에서 가장 비용이 적은 노드를 선택해 임의의 과정을 반복
 플로이드 워샬 알고리즘은 다익스트라 알고리즘을 n번 사용할 때의 시간 복잡도와 동일
 하지만, 플로이드 워샬 알고리즘은 매우 간단하여 다익스트라 알고리즘보다 효율적
 
 플로이드 워샬 알고리즘 로직
 1. 2차원 배열 만들고 그래프의 간선의 정보를 저장 ( 두 정점이 직접적으로 연결되어 있지 않으면 INF(무한대값), 자기 자신으로 가는 거리는 0으로 한다.
 2. 경유지 1~V까지 순회하여 2차원 테이블을 업데이트 한다.
 
 아이디어
 1. 3개의 점이 있는 경우, a에서 c까지의 최단 경로를 찾으려면 2가지 경로, 즉 a에서 c로 가는 경로와 점 b를 경유하는 경로 중에서 짧은 것을 선택
 2. 경유 가능한 점이 점 1, 2, 3, ..., n 즉 모든 점을 경유 가능한 점들로 고려하면서, 모든 쌍의 최단 경로의 거리를 계산
 
 주의
 - 점 1에서 점 k까지 모든 점을 반드시 경유하는 경로를 의미하는 것이 아님
 - i->k->j {1, 2, ..., K}을 하나도 경유하지 않으면서 점 i에서 직접 점 j에 도달하는 간선 (i, j)가 가장 짧은 거리일 수도 있음
 */


let allConnections = [[1,2,12],[2,3,20],[3,4,5],[4,5,7],[1,5,10],[2,4,3]]

var allDistances = [[Int]](repeating: [Int](repeating: 1000000, count: allConnections.count+1), count: allConnections.count+1)

for i in 0..<allDistances.count {
    allDistances[i][i] = 0
}

for connection in allConnections {
    allDistances[connection[0]][connection[1]] = connection[2]
    allDistances[connection[1]][connection[0]] = connection[2]
}

func floyd() {
    for k in 1..<allDistances.count {
        for i in 1..<allDistances.count {
            if k == i { continue }
            for j in 1..<allDistances.count {
                if k == j || i == j { continue }
                allDistances[i][j] = min((allDistances[i][k]+allDistances[k][j]),allDistances[i][j])
            }
        }
    }
}

func printArray(arr: [[Int]]) {
    var grid: [String] = []
    for i in 0..<arr.count {
        var row = ""
        for j in 0..<arr.count {
            let value = arr[i][j]
            if value != 1000000 {
                row += "\(value) \t"
            } else {
                row += "INF\t"
            }
        }
        grid.append(row)
    }

    let edgesDescription = grid.joined(separator: "\n\n")
    print(edgesDescription)
}

floyd()
printArray(arr: allDistances)

