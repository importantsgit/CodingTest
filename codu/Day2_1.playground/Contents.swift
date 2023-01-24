// 분할정복

// 1. 재귀로 제일 작은 것을 먼저 만든 후 return
// 2. return 된 결과를
// - 1) 먼저

var arr:[Int] = []

func makeRec(left: Int, right: Int) -> Int {
    // 원자값일 때 그 값을 그냥 return
    if left == right { return arr[left] }
    
    // 중간값 계산(분할정복)
    var mid = (left + right) / 2
    // 왼쪽과 오른쪽에서 나온 큰 결과값 중 제일 큰 것을 ret에 집어넣기
    var ret = max(makeRec(left: left, right: mid), makeRec(left: mid + 1, right: right))
    // 왼쪽으로 -할 값
    var lo = mid
    // 오른쪽으로 +할 값
    var hi = mid + 1
    var height = min(arr[lo], arr[hi])
    ret = max(ret, height*2)
    
    while left < lo || hi < right {
        // 만약 hi값이 right값에 안 닿고, ()
        if hi < right && ( lo <= left || arr[lo - 1] < arr[hi + 1] ) {
            hi+=1
            height = min(height, arr[hi])
        } else {
            lo-=1
            height = min(height,arr[lo])
        }
        ret = max(ret, height*(hi-lo+1))
    }
    return ret
}

arr = [7,1,5,9,6,7,3]
print(makeRec(left: 0, right: arr.count - 1))
