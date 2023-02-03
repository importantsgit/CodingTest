/*
 편집 거리 문제
 - 편집 거리: 삽입, 삭제, 대체 연산을 사용하여 스트링 S를 수정하여 다른 스트링 T로 변환하고자 할 때 필요한 최소의 편집 연산 횟수
 - 삽입, 삭제 시 -> 
 */

import Foundation

var string1 = "strong"
var string2 = "stone"

func printArray(arr: [[Int]]) {
    var grid: [String] = []
    for i in 0..<arr.count {
        var row = ""
        for j in 0..<arr[1].count {
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


func EditDistance(str1: String, str2: String)->Int {
    var DP: [[Int]] = [[Int]](repeating: [Int](repeating: -1, count: str2.count+1), count: str1.count+1)
    for i in 0..<DP.count {
        DP[i][0] = i
    }
    for i in 0..<DP[0].count {
        DP[0][i] = i
    }
    for i in 1..<DP.count {
        for j in 1..<DP[0].count {
            var a = str1.findIndex(from: i-1) == str2.findIndex(from: j-1) ? 0 : 1
            DP[i][j] = min(DP[i-1][j]+1, DP[i][j-1]+1, DP[i-1][j-1]+a)
        }
    }
    printArray(arr: DP)
    return DP.last?.last ?? -1
}

var result = EditDistance(str1: string1, str2: string2)
print(result != -1 ? result : "Error")
