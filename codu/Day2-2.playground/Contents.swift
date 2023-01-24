// 남자: 1 여자: 0
// 1*0 0*1 1*1 0*0

var str1 = "MFMFMFFFMMMFMF"
var str2 = "MMFFFFMFFFMFFFFFFMFFFMFFFFMFMMFFFFFFF"
var arr1:[Int] = []
var arr2:[Int] = []

var count = 0

// 변환
for i in str1 {
    arr1.append(i=="F" ? 0 : 1)
}

for i in str2 {
    arr2.append(i=="F" ? 0 : 1)
}

// 계산
for i in 0...arr2.count-arr1.count {
    var isHug = 0
    for j in 0..<arr1.count {
        isHug += arr1[j]*arr2[i+j]
    }
    count += isHug == 0 ? 1 : 0
}

print(count)


// 비트 연산자 나중에 사용할 수 있으니
// 검색엔진
