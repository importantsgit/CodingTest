// 캐시를 쓰기 (메모라이즈)
// 이렇게 풀면 나중에 문자열 길이가 길어질 경우가 있을때 어려움 -> 재귀로 풀기
var arr = ["12341234","11111222","12122222","22222222","12673939"]

func memo(_ str:String,_ start: Int,_ end: Int) -> Int {
    var str2:String = str.substring(from: start, to: end)
    if str2.filter({$0 != Character(str2.findIndex(from: 0))}).isEmpty { return 1 } // 다 같은 경우
    var m:[Int] = []
    for i in (1..<str2.count).reversed() {m.append(Int(str2.findIndex(from: i))!-Int(str2.findIndex(from: i-1))!)}
    if m.filter({ $0 != 1}).isEmpty || m.filter({ $0 != -1}).isEmpty { return 2 } // 증감 1, -1
    if m.filter({$0 != m[0]}).isEmpty ||  m.filter({$0 != -m[0]}).isEmpty { return 5 } // 증감 m, -m
    var pos = 0
    while pos < str2.count - 2 {
        if str2.findIndex(from: pos) != str2.findIndex(from: pos+2) {break}
        pos += 1
    }
    if pos == str2.count - 2 { return 4 } // 번갈아 바뀔 때
    return 10
}


func PIMemorization(){

    for item in arr {
        var ret = 10000000
        for i in 2...4 {
            ret = min(ret,memo(item,0,i) + memo(item,i+1,7))
        }
        print(ret)
    }
    
}

PIMemorization()
