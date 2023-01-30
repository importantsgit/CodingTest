var arr = [["he?p","help"],["he?p","heap"],["he?p","helpp"],["*p*","help"],["*p*","papa"],["*p*","hello"]]

//MARK: - 와일드 카드 함수

func wildCard2(compare arr1: String,with arr2: String)->Bool {
    let c1 = arr1.count - 1, c2 = arr2.count - 1
    var char: Character = "A", compare: Character = "A"
    var s1 = 0, s2 = 0 // 인덱스
    
    while s2 <= c2 && s1 <= c1 {
        char = arr1[arr1.index(arr1.startIndex, offsetBy: s1)]; compare = arr2[arr2.index(arr2.startIndex, offsetBy: s2)]
        if char == "*" { // *일 경우
            if c1 == s1 { return true } // 마지막에 *이 붙은 경우
            if arr1[arr1.index(arr1.startIndex, offsetBy: s1+1)] == compare { s1 += 2 } // * 다음문자가 compare과 같다면
            s2 += 1
            continue
        } else if char != compare && char != "?" { return false }  // 일치하지 않으면 false 리턴
        s1 += 1
        s2 += 1
    }

    if s1 == c1+1 && s2 == c2+1 { return true }
    // s2가 다 돌았지만 s1의 공간이 남았을 때 (** 같은 문자는 존재하지 않음)
    if char == "*" && s2 == c2+1 && c1 == s1 { return true }
    
    return false
}

var strings: [String] = []

for item in arr {
    if wildCard2(compare: item[0], with: item[1]) {
        strings.append(item[1])
    }
}
strings.sort(by: <)

print(strings)

//MARK: - 2번째
func wildCard3(str1: String, str2: String){
    var str1 = ""
    var str2 = ""
}



//MARK: - 3번째 ** 만 있다면
enum MyError: Error {
    case noValue
}

var str = "*ap*ap*ap*appppp*"

var str2 = "apdsapapapppp"

func checkStar(compare s1: String,with s2: String) throws -> Bool {
    var str2 = s2
    var arr = s1.split(separator: "*")
    for item in arr {
        do {
            guard let index = str2.firstRange(of: item) else { throw MyError.noValue }
            str2 = String(str2[index.upperBound...])
        } catch MyError.noValue {
            print("Out Of Range")
            return false
        }
    }
    return true
}

// try print(checkStar(compare: str, with: str2))


