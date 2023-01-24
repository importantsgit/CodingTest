// 공백 단위로 정수형 받기

var arr = readLine()!.split(separator: " ").map { Int($0)! }

// 이게 더 빠름
// Substring → String → Int
var arr1 = readLine()!.split(separator: " ").map { Int(String($0))! }



// 배열 만들기
var array = [Int](repeating: 0, count: 3)



// 배열 정렬하기
arr.sort() // 원본 순서 변경 (오름차순) [1,2,3]
let changeArr = arr.sorted() // 정렬한 배열을 반환
arr.sort(by: >) // 원본 순서 변경 (내림차순) [3,2,1]



// 배열 중 최소, 최대 찾기
var min = arr.min()!
var max = arr.max()!



// 배열 정방향, 역방향으로 찾기

// 정방향
// count 사용
for i in 0..<arr.count {
    print(arr[i])
}

// indices 사용
for i in arr.indices {
    print(arr[i])
}

// 역방향
for i in (0..<arr.count).reversed() {
    print(arr[i])
}

for i in arr.indices.reversed() {
    print(arr[i])
}
// 아니면 배열 자체를 뒤집고 정방향 순회 해도 됨

