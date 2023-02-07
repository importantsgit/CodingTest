/*
 양자화
 - 연속적인 값을 디지털 데이터, 즉 띄엄띄엄한 값으로 바꾸어 근사하는 과정
*/
import Foundation

var arrs = [[1, 744, 755, 4, 897, 902, 890, 6, 777],[3, 3, 3, 1, 2, 3, 2, 2, 2, 1],[1,2,4,8,10,12]]

func quantization(arr: [Int]) -> Int {
    //MARK:  배열을 나눴을때 제일 작은 오차제곱 합
    // 평균값 구하기ㅂ
    var qNum = Int(round(Double(arr.reduce(0, +))/Double(arr.count)))
    // 오차제곱 합
    var num = arr.map({($0-qNum)*($0-qNum)}).reduce(0, +)

    return num
}

//print(quantization(arr: Array(arr[0..<3])) + quantization(arr: Array(arr[3..<6])) + quantization(arr: Array(arr[6..<9])))
//print(quantization(arr: Array(arr2[0..<2])) + quantization(arr: Array(arr2[3..<6])) + quantization(arr: Array(arr2[6..<9])))


//MARK: - for문을 쓰는 방법 (만약 기준 3개로 나눌 수 있을 때)
func sloveProblem(arrs: [[Int]]) {
    for arr in arrs {
        var item = arr.sorted()
        var minNum = 10000000
        for i in 1..<item.count-2 {
            for j in i + 1..<item.count-1 {
                minNum = min(minNum, quantization(arr: Array(item[0..<i])) + quantization(arr: Array(item[i..<j])) + quantization(arr: Array(item[j...])))
            }
        }
        print(minNum)
    }
}

sloveProblem(arrs: arrs)

//MARK: - 요소의 차이를 계산하여 제일 큰 차이를 보이는 요소의 인덱스값 구하기 -> 구분 기준
func sloveProblem2(arr: [Int], count: Int) {
    var maxIdx:[[Int]] = []
    var arr = arr.sorted()
    for i in 0..<arr.count-1 {
        maxIdx.append([i+1,abs(arr[i]-arr[i+1])])
    }
    var idxs:[Int] = [0] + Array(maxIdx.sorted(by: {$0[1]>$1[1]})[0..<count-1]).sorted(by: {$0[0]<$1[0]}).map{$0[0]} + [arr.count]
    var result = 0
    for i in 0..<idxs.count-1 {
        result += quantization(arr: Array(arr[idxs[i]..<idxs[i+1]]))
    }
    print(result)
   

}

for arr in arrs {
    sloveProblem2(arr: arrs[2], count: 3)
}
 
// func(arr / 쪼개진 인덱스 / DP)
// 쪼개진 배열의 가장 큰 수와 가장 작은 수의 차이를 구해서 이 값이 크다면 오차가 큰 배열을 나누는 방식으로
// DP에 저장된 값이 있으면 스킵

