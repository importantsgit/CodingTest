import Foundation
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
var cache=[[Int]](repeating: [Int](repeating: -1, count: 11), count: 101)
func getResult(_ arr:[Int],_ start:Int,_ end:Int)->Int {
    //MARK:  배열을 나눴을때 제일 작은 오차제곱 합
    // 평균값 구하기
    var arr = Array(arr[start...end])
    var qNum = Int(round(Double(arr.reduce(0, +))/Double(arr.count)))
    // 오차제곱 합
    var num = arr.map({($0-qNum)*($0-qNum)}).reduce(0, +)

    return num
}
func quantize(_ arr:[Int],_ pos:Int,_ parts:Int)->Int{
    if pos == arr.count {return 0} // 끝
    if parts == 0 {return 987654321} // 파트 없을 때
    if cache[pos][parts] != -1 {return cache[pos][parts]}
    cache[pos][parts] = 987654321
    for i in 1...arr.count-pos {
        cache[pos][parts] = min(cache[pos][parts], getResult(arr, pos, pos+i-1) + quantize(arr, pos+i, parts-1))
    }
    return cache[pos][parts]
}

quantize([1, 744, 755, 4, 897, 902, 890, 6, 777].sorted(), 0, 3)

printArray(arr: cache)
