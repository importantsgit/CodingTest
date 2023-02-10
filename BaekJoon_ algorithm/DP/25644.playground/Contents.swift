/*
 최대상승
 25644
 */
var arr = [1,4,7,2,6]
func maxUP(_ arr: [Int]) {
    var DP = Array(repeating: 0, count: arr.count)
    var maxNums:[Int] = []
    for i in 1..<DP.count {
            DP[i] = (arr[i]-arr[i-1])+DP[i-1]
    }
    maxNums.append(DP.max())
    for i in 0..<DP.count {
        
    }
    print(DP)
}
maxUP(arr)
