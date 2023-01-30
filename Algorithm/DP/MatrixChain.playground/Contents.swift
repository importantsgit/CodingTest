/*
연속 행렬 곱셈
- 연속된 행렬들의 곱셈에 필요한 원소 간의 최소 곱셈 횟수를 찾는 문제
- ex) [10,20], [20,5] -> 곱셈:10*20*5 (10*5크기로 만들어짐)
    
주의
- 주어진 행렬의 순서를 지켜서 반드시 이웃하는 행렬끼리 곱해야함
 */


//MARK: - 나중에 다시 생각하기
//TODO: - 다시 이해하기

var matrix = [[10,5],[5,20],[20,10],[10,15]]

var dp = [[Int]](repeating:[Int](repeating: 0, count: matrix.count+1), count: matrix.count+1)

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

    printArray(arr: dp)

func MatrixChain() {
    for L in 1..<matrix.count { // L: 연속된 행렬
        print("----------------")
        print("L:\(L)")
        for i in 1...matrix.count-L { // i: 행렬 행
            print("i:\(i)")
            var j = i + L             // j: 행렬 열
            print("j:\(j)")
            dp[i][j] = 1000000
            for k in i..<j {
                print("k:\(k)")
                let temp = dp[i][k] + dp[k+1][j]
            }
        }
    }
}

MatrixChain()
