extension String {
    public func findTo(_ n: Int)->String {
        if 0>n || n>self.count { return "" }
        let index = index(self.startIndex, offsetBy: n)
        return String(self[index])
    }
}

var cache = [[Int]](repeating: [Int](repeating: -1, count: 101), count: 101)
var str = ["*p*","help"]
func wildCard(_ strs:[String],_ w:Int,_ s:Int)->Bool{
    var w=w,s=s
    var ret = cache[w][s] // 먼저 캐쉬 확인
    if ret != -1 {return ret==1} // 만약 0이면 false 1이면 true -1이면 검사
    while w<strs[0].count && s<strs[1].count && (strs[0].findTo(w) == strs[1].findTo(s) || strs[0].findTo(w) == "?") {
        w+=1;s+=1
    } // *가 안나올 때까지 && w,s가 끝까지 갈때까지
    if w == strs[0].count {// 끝까지 갔다면
        cache[w][s] = s==str[1].count ? 1:0 // s도 끝까지 갔는지 확인 안 갔다면 false
        return s==str[1].count // 그 값을 똑같이 대입
    }
    if strs[0].findTo(w) == "*" { // 만약 *이라면
        for i in 0...str[1].count-s { // str의 나머지 확인 (str[1].count-s)
            if wildCard(strs, w+1, s+i) {
                cache[w][s] = 1 // 정답이라서 1값
                return true
            }
        }
    }
    cache[w][s] = 0 // 모든게 해당이 안되기 때문에 0
    return false
}


wildCard(str, 0, 0)
