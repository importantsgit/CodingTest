var T = ["x","b","w","w","x","b","b","b","b","x","b","b","b","b"]
var arr: [[String]] = []
var idx: Int = 0
var f: Int = 0

func split() {
    for i in 0..<T.count {
        if T[i] == "x" {
            idx += 4
        }
    }
    var ar = T[0...idx]
    arr.append(Array(ar))
    idx = 0
}
for i in 0..<T.count {
    while idx <= 20 {
        if T[i] == "x" {
            idx += 4
        }
    }
}

