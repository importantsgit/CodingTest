/*
 양자화
 - 연속적인 값을 디지털 데이터, 즉 띄엄띄엄한 값으로 바꾸어 근사하는 과정
*/
import Foundation

var arr = [1, 744, 755, 4, 897, 902, 890, 6, 777]
var arr2 = [3, 3, 3, 1, 2, 3, 2, 2, 2, 1]
arr.sort()
arr2.sort()
print(quantization(arr: Array(arr[0..<3])) + quantization(arr: Array(arr[3..<6])) + quantization(arr: Array(arr[6..<9])))

func quantization(arr: [Int]) -> Int {
    
    
    //MARK: - 배열을 나눴을때 제일 작은 오차제곱 합
    // 평균값 구하기
    var qNum = Int(round(Double(arr.reduce(0, +))/Double(arr.count)))
    // 오차제곱 합
    var num = arr.map({($0-qNum)*($0-qNum)}).reduce(0, +)

    return num
}

print(quantization(arr: Array(arr[0..<3])) + quantization(arr: Array(arr[3..<6])) + quantization(arr: Array(arr[6..<9])))
print(quantization(arr: Array(arr2[0..<2])) + quantization(arr: Array(arr2[3..<6])) + quantization(arr: Array(arr2[6..<9])))


var a1 = [1,2,3,4,5,6,7,8,9,10].reduce(0, +)
