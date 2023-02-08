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
    sloveProblem2(arr: arr, count: 3)
}
// [1,2,4,8,10,12] 오류


// func(arr / 쪼개진 인덱스 / DP)
// 쪼개진 배열의 가장 큰 수와 가장 작은 수의 차이를 구해서 이 값이 크다면 오차가 큰 배열을 나누는 방식으로
// DP에 저장된 값이 있으면 스킵

//MARK: - https://bba-dda.tistory.com/14
var n = 0

// 0번째 수부터 i번째 수까지 합을 저장
var pSum: [Int] = [Int](repeating: -1, count: 101)

var pSqSum: [Int] = [Int](repeating: -1, count: 101)

var cache: [[Int]] = [[Int]](repeating: [Int](repeating: -1, count: 11), count: 101)

var INF = 987654321

// start end까지 한 묶음일 때 (하나의 숫자로 양자화 할 때) 가능한 최소의 오차 리턴
func minError(start: Int, end: Int)->Int {
    var sum = 0, sqSum = 0
    if start == 0 {
        sum = pSum[end]
        sqSum = pSqSum[end]
    } else {
        sum = pSum[end] - pSum[start-1]
        sqSum = pSqSum[end] - pSqSum[start-1]
    }
    // start와 end사이의 수들을 평균값을 반올림한 수로 양자화
    var m = Int(floor(0.5 + Double(sum / (end - start + 1))))
    var result = sqSum - 2 * m * sum + m * m * (end - start + 1)
    return result
}

// start 부터 숫자들을 parts개의 묶음으로 분리할 때 가능한 최소의 error return
func quantize(start: Int, parts: Int)->Int {
    if start == n {return 0}
    if parts == 0 {return INF}
    var ret = cache[start][parts]
    if (ret != -1) {return ret}
    ret = INF
    // 해당 묶음의 길이를 변화시키면서 최솟값 찾기
    for size in 1..<n {
        ret = min(ret, minError(start: start, end: start+size-1) + quantize(start: start+size, parts: parts-1))
    }
    return ret
}

func initquantize(arr: [Int], parts: Int){
    var arr = arr.sorted()
    pSum[0] = arr[0]
    pSqSum[0] = arr[0] * arr[0]
    n = arr.count
    for i in 1..<n {
        pSum[i] = pSum[i-1]+arr[i]
        pSqSum[i] = pSqSum[i-1]+arr[i]*arr[i]
    }
    print(quantize(start: 0, parts: parts))
}

for arr in arrs {
    initquantize(arr: arr, parts: 3)
}

/*
인터넷에 나와있는 코드를 이해하려고 했으나
완벽하게 이해를 하지 못했습니다.
 - DP 메모제이션
수요일 안으로 이해하고 코드를 다시 짜보겠습니다.
*/
