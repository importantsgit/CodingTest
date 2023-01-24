var T = "xxwwwbxwxwbbbwwxxxwwbbbwwwwbb"

func reverse(str: String, idx: Int) -> String {
    var idx = idx
    let char: String = String(str[str.index(str.startIndex, offsetBy: idx)])
    
    if char != "x" {
        return char
    }
    
    var sub:[String] = []
    idx += 1
    
    for i in 0..<4 {
        sub[i] = reverse(str: str, idx: idx)
        idx += sub[i].count
    }
    
    return char + sub[2] + sub[3] + sub[0] + sub[1]
}

print(reverse(str: T, idx: 0))
