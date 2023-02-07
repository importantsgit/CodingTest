/*
 단어수학
 1339
 */

//var n = Int(String(readLine()!))!
var arr: [[String]] = []

//for i in 0..<n {
//    arr.append(readLine()!.map{String($0)})
//}

arr = [["A","F","A"],["A","D","C"],["G","A","F","A"]].sorted(by: {$0.count>$1.count})
var maxCnt = arr[0].count
var arrs:[[String]] = [[String]](repeating: [], count: maxCnt)
print(arrs)

for i in (0..<maxCnt).reversed() {
    for item in arr {
        let j = item.count - (1 + i)
        if item.count > i {
            arrs[i].append(item[j])
        }
    }
}

for item in arrs.reversed() {

}
