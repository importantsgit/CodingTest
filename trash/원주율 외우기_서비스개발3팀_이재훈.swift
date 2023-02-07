// 캐시를 쓰기 (메모라이즈)
var arr = ["12341234","11111222","12122222","22222222","12673939"]

func memo(_ str:String,_ end: Int) -> Int {
    // 모든 숫자가 같은지 확인
    if !arr.filter({$0 == str.findIndex(from: 0)}).isEmpty { return 1 }
    // 숫자가 같은 단위로 증감하는지 확인
    var d = 0
    var m:[Int] = []
    for i in (1..<end).reversed() { m.append(Int(arr[i])!-Int(arr[i-1])!)}
    if !m.filter({$0 == -1 || $0 == 1}).isEmpty { return 2 }
    if !m.filter({$0 == m[0]}).isEmpty { return 5 }
    
    // 등차수열
    return 10
    
}
func getLevel(){
    
}

func PIMemorization(){
    var ret = 10000000
    for item in arr {
        for i in 3...5 {
           ret = min(ret,memo(item,i+1), getLevel() )
        }
    }
}
