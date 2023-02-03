func printArray(arr: [[Int]]) {
    var grid: [String] = []
    for i in 0..<arr.count {
        var row = ""
        for j in 0..<arr.first!.count {
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
//MARK: - 알고리즘

// 물건 [무게, 가치]
var things = [[3,50],[6,30],[5,10],[4,40]]
var things2 = [[5,10],[4,40],[6,30],[3,50]]
// 배낭 무게
var C = 10

func knapSack(weight: Int, things: [[Int]]) {
    // 가치 순으로 변환을 안해도 값은 똑같이 나옴
    //var things = things.sorted(by: {$0[1] < $1[1]})
    print(things)
    var BP: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: C+1), count: things.count + 1)
    
    for item in 1...things.count { // 아이템 인덱스 = item - 1
        for w in 1...C { // 무게
            if w < things[item-1][0] { // 배낭의 무게보다 아이템의 무게가 크다면
                BP[item][w] = BP[item-1][w]
            } else {
                BP[item][w] = max(BP[item-1][w], BP[item-1][w-things[item-1][0]]+things[item-1][1])
            }
        }
    }
    printArray(arr: BP)
}
knapSack(weight: C, things: things)
knapSack(weight: C, things: things2)
