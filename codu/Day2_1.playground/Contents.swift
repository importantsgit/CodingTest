var T = "xbwwb"

func reverse(str: String, idx: Int) -> String {
    var idx = idx
    let char = str.findIndex(from: idx)
    idx += 1
    
    if char != "x" {
        return char
    }
    var sub:[String] = []
    for i in 0..<4 {
        sub.append(reverse(str: str, idx: idx))
        idx += sub[i].count
    }
    
    return char + sub[2] + sub[3] + sub[0] + sub[1]
}

print(reverse(str: T, idx: 0))

