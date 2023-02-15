import Foundation
var cache = [[Int]](repeating: [Int](repeating: -1, count: 10), count: 100) // 파트와 인덱스값 저장

func getResult(_ arr:[Int])->Int {
    var minusN = Int(round(Double(arr.reduce(0, +))/Double(arr.count))) // Int(round(Double()/Double())합 -> 평균값
    var result = arr.map{($0-minusN)*($0-minusN)}.reduce(0, +) // 오차 제곱 합
    return result
}

func quantization(_ arr:[Int],_ pos:Int,_ parts:Int)->Int { // arr, idx, 파트
    if pos == arr.count {return 0} // 끝까지 돌아갔을때 true
    if parts == 0 {return 987654321} // 파트 끝났을때 false
    if cache[pos][parts] != -1 {return cache[pos][parts]} // 값이 있으면 값 반환
    cache[pos][parts] = 987654321 // 큰 값으로 초기화
    for i in 1...arr.count-pos { // 끝까지 가게끔
        cache[pos][parts] = min(cache[pos][parts], quantization(arr, pos+i, parts-1)+getResult(Array(arr[pos..<(pos+i)])))
    }
    return cache[pos][parts]
}

print(quantization([1, 744, 755, 4, 897, 902, 890, 6, 777].sorted(), 0, 3))






var cache = Array(repeating: -1, count: 8) // 캐쉬 사용 -> start값 저장

func getLevel(_ arr:[Int])->Int { // 잘라진 배열 가져오기
    var arr = arr
    if !arr.contains(where: {$0 != arr[0]}) {return 1} // 모두 같은 값
    var gaps:[Int] = [] // gap 저장 단조증감 구분
    for i in 1..<arr.count {gaps.append(arr[i]-arr[i-1])}
    if !gaps.contains(where: {$0 != gaps[0]}) { // 단조증감 한다면
        if arr[0] == 1 || arr[0] == -1 {return 2} // 1이나 -1로 증감한다면
        return 5 // 나머지
    }
    var idx = 0
    repeat {
        if arr[idx] != arr[idx+2] {break}
        idx+=1
    } while idx < arr.count-2 //중요 arr.count-2 전까지
    if idx == arr.count-2 {return 4} // arr.count-2 같다면 4
    return 10
}

func memo(_ arr:[Int], start: Int)->Int { // arr, start값 가져오기
    if start == arr.count {return 0} // idx가 count값과 같다면 0
    var start = start
    if cache[start] != -1 {return cache[start]} // 검사를 했다면
    cache[start] = 987654321
    for i in 3...5 { //3...5까지
        if i + start <= arr.count { // 왜 같냐면 마지막까지 getLevel함수가 돌아야하기 때문
            cache[start] = min(cache[start], memo(arr, start: start+i)+getLevel(Array(arr[start..<(start+i)])))
        }
    }
    return cache[start]
}

print(memo([1,2,3,4,1,2,3,4], start: 0))
print(cache)






var str1 = "he?p"
var str2 = "help"
var strs = [str1,str2]
var cache = [[Int]](repeating: [Int](repeating: -1, count: strs[1].count+1), count: strs[0].count+1) // w,s인덱스 저장

extension String {
    func findTo(_ i: Int)-> String {
        if i<0 || self.count<i {return ""}
        var idx = index(self.startIndex, offsetBy: i)
        return String(self[idx])
    }
}

func wildCard(_ strs:[String],_ w: Int,_ s:Int)->Bool { // w,s인덱스 가져오기 (Bool)
    var w=w,s=s
    if cache[w][s] != -1 {return cache[w][s]==1} // 1이면 -> true
    while w<strs[0].count && s<strs[1].count && (strs[0].findTo(w)==strs[1].findTo(s) || strs[0].findTo(w)=="?") {w+=1;s+=1}// w,s가 각 str의 count값을 넘지 않고 && (?가 나오거나 || 두 char이 같다면)
    if w == strs[0].count { // w가 끝까지 돌았을때
        cache[w][s] = s == strs[1].count ? 1 : 0 // s가 끝까지 돌았다면 1->true 돌지 못했다면 0->false
        return s == strs[1].count
    }
    if strs[0].findTo(w)=="*"{ //*가 나왔을때
        for i in 0...strs[1].count-s { // s1.count-s까지
            if wildCard(strs, w+1, s+i) {
                cache[w][s] = 1
                return true
            }
        }
    }
    cache[w][s] = 0 // 다 해당 안되기 떄문에 0
    return false
}

print(wildCard(strs, 0, 0))




var arr = [
    [2,5,1,6,1,4,1],
    [6,1,1,2,2,9,3],
    [7,2,3,2,1,3,1],
    [1,1,3,1,7,1,2],
    [4,1,2,3,4,1,2],
    [3,3,1,2,3,4,1],
    [1,5,2,9,4,7,0]
]

func jump(_ x:Int,_ y:Int)->Bool{
    if x > 6 || y > 6 {return false}
    if arr[y][x] == 0 || jump(x+arr[y][x], y) || jump(x, y+arr[y][x]) {return true}
    return false
}

print(jump(0, 0))




func meeting(_ str1:String,_ str2:String) {
    var arr1 = str1.map{$0 == "F" ? 0:1}
    var arr2 = str2.map{$0 == "F" ? 0:1}
    var result = 0
    for i in 0...arr2.count-arr1.count {
        var hug = 0
        for j in 0..<arr1.count {
            hug += arr1[j]*arr2[j+i]
        }
        result += hug == 0 ? 1:0
    }
    print(result)
}

meeting("FFFMMM", "MMMFFF")
meeting("MFMFMFFFMMMFMF", "MMFFFFFMFFFMFFFFFFMFFFMFFFFMFMMFFFFFFF")
meeting("FFFFM", "FFFFFMMMMF")






var arr = [7,1,5,9,6,7,3]

func fench(_ left: Int,_ right: Int)->Int { // 왼쪽과 오른쪽 인덱스
    if left == right {return arr[left]} // 만약 원자값이라면 arr[left] 높이 반환
    var mid = (left+right)/2 // 중간인덱스
    var maxR = max(fench(left, mid), fench(mid+1, right)) // 왼쪽 오른쪽 재귀 돌리기 -> 큰 값 저장
    var low = mid
    var high = mid + 1
    var height = min(arr[low],arr[high]) // 낮은 height값 고르기
    maxR = max(height*2, maxR) // 제일 큰 값 다시 저장
    while left < low || high < right { // 인덱스가 넘지 않게 마지막 루트때 low와 right에 닿음
        if high < right && (low <= left || arr[low-1] < arr[high+1]) { // high값이 right에 닿지 않을때&&(low값이 left에 닿음||왼쪽 높이가 오른쪽 높이가 작다면)
            high+=1
            height = min(height, arr[high]) // 높이 초기화
        } else {
            low-=1
            height = min(height, arr[low]) // 높이 초기화
        }
        maxR = max(height*(high-low+1), maxR) // 초기화된 높이로 값 계산, 넓은 값 반환
    }
    return maxR
}

print(fench(0, arr.count-1))

// low, high는 Idx이기 때문에 arr[]로 집어넣자




extension String {
    func findTo(_ i:Int)->String {
        if i<0 || self.count<=i {print("findTo() function is not working");return ""}
        var idx = index(self.startIndex, offsetBy: i)
        return String(self[idx])
    }
    func splitTo(_ i:Int,from j:Int)->String {
        if i<0 && j<i && self.count <= j {print("splitTo() function is not working");return ""}
        var startIdx = index(self.startIndex, offsetBy: i)
        var endIdx = index(self.startIndex, offsetBy: j)
        return String(self[startIdx...endIdx])
    }
}

func qur(_ str: String,_ pos:Int)->String { // str와 idx값 가져오기
    if str.findTo(pos)=="b" || str.findTo(pos)=="w" {return str.findTo(pos)} // 현재 w,b라면 그냥 w,b반환
    var pos = pos + 1 // 현재값은 w이기 때문에 +1 (다음값 검사)
    var strs:[String] = [] // 담을 str
    for i in 0..<4 { // 4가지 트리
        strs.append(qur(str, pos)) // pos만큼 이동
        pos += strs[i].count // 다음 구역으로 pos++
    }
    
    return "x" + strs[2] + strs[3] + strs[0] + strs[1] // str값 반환
}

print(qur("xxwwwbxwxwbbbwwxxxwwbbbwwwwbb", 0))



    
    
    
    
    let buttons = [[0,1,2],[3,7,9,11],[4,10,14,15],[0,4,5,6,7],[6,7,8,10,12],[0,2,14,15],[3,14,15],[4,5,7,14,15],[1,2,3,4,5],[3,4,5,9,13]]
    var arr = [[12, 9, 3, 12, 6, 6, 9, 3, 12, 9, 12, 9, 12, 12, 6, 6],[12,6,6,6,6,6,12,12,12,12,12,12,12,12,12,12]]
    var INF = 987654

    func clickButton(_ array:[Int],_ clickNum:Int)->Int { // clock & 버튼 넘버
        var clocks = array
        if clickNum > 9 {return clocks.contains(where: {$0 != 12}) ? INF : 0버 // 만약 다 눌렀다면 모든 시계가 12인지 체크 아니면 INF
            var ret = INF // INF 초기화
            
            for i in 0..<4 { // 0번 부터 3번 눌렀을때까지
                ret = min(ret, i+clickButton(clocks, clickNum+1)) // 먼저 ret와 재귀함수(버튼+1)+i(현재버튼 클릭 수)
                for button in buttons[clickNum] { // 버튼 클릭
                    clocks[button] = clocks[button]==12 ? 3 : clocks[button]+3 // 만약 12이면 3으로
                }
            }
            return ret // 반환
        }
        
        print(clickButton(arr[0], 0))
        
        
        
        
        
        
        extension String {
            func findTo(_ i:Int)->String {
                if i < 0 || self.count < i {return ""}
                var idx = index(self.startIndex, offsetBy: i)
                return String(self[idx])
            }
        }

        var boggleBoard = [["U","R","L","P","M"],
                           ["X","P","R","E","T"],
                           ["G","I","A","E","T"],
                           ["X","T","N","Z","Y"],
                           ["X","O","Q","R","S"]]

        func re(_ str:String, _ x:Int,_ y:Int,_ idx: Int)->Bool { //str, idx, x,y
            if x<0 || x>5 || y<0 || y>5 {return false} // 먼저 밖으로 나갔는지 체크
            if idx == str.count {return true} // 인덱스가 str의 count와 같은지 체크 (만약 같으면 다 확인한거임)
            if str.findTo(idx) != boggleBoard[y][x] {return false} // 현재 인덱스의 char값과 비교(다르면 false)
            for i in -1...1 {for j in -1...1 {if re(str, x+i, y+j, i+1) && !(i == 0 && j == 0) {return true}}}
            // x,y 가 동시에 0이 아니면서 재귀함수가 true일때
            return false // 나머지
        }

        print(re("PRETTY", 1, 1, 0))

