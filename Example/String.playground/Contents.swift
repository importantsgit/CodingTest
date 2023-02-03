// Int형 인덱스로 만들기

extension String {
    public func substring(from: Int, to: Int) -> String {
        guard from < count, to >= 0, to - from >= 0 else {
            return ""
        }
        
        // Index 값 획득
        let startIndex = index(self.startIndex, offsetBy: from)
        let endIndex = index(self.startIndex, offsetBy: to + 1) // '+1'이 있는 이유: endIndex는 문자열의 마지막 그 다음을 가리키기 때문
        
        // 파싱
        return String(self[startIndex ..< endIndex])
    }
    
    public func findIndex(from num: Int) -> String {
        guard num <= count, num >= 0 else {
            return ""
        }
        if num == 0 {
            return  String(self[self.startIndex])
        }
        
        let find = index(self.startIndex, offsetBy: num)
        return String(self[find])
    }
}
