/*
 최대상승
 25644
 */
var arr = [1,4,7,2,6]
func maxUP(_ arr: [Int]) {
    var DP = Array(repeating: 0, count: arr.count)
    var maxNums:[Int] = []
    for i in 1..<DP.count-1 {
            DP[j] = (arr[j]-arr[j-1])+DP[j-1]-DP[i-1]
        print(DP)
    }
}
maxUP(arr)
