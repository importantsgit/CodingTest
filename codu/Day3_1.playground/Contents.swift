var arr = [
    [2,5,1,6,1,4,1],
    [6,1,1,2,2,9,3],
    [7,2,3,2,1,3,1],
    [1,1,3,1,7,1,2],
    [4,1,2,3,4,1,2],
    [3,3,1,2,3,4,1],
    [1,5,2,9,4,7,0]
]

func game( i:Int, j: Int) -> Bool {
    if 6<i || 6<j {return false}
    var jump = arr[i][j]
    if jump == 0 || game(i: jump+i, j: j) || game(i: i, j: jump+j) {return true}
    return false
}

print(game(i: 0, j: 0))


func game2( i:Int, j: Int, count:Int) -> Bool {
    var count = count + 1
    if 6<i || 6<j {return false}
    var jump = arr[i][j]
    if jump == 0 {
        print("count:\(count) ==> [\(i)][\(j)]")
        return true
    }
    if game2(i: jump+i, j: j, count: count) || game2(i: i, j: jump+j,count: count) {
        print("count:\(count) ==> [\(i)][\(j)]")
        return true
    }
    return false
}

print(game2(i: 0, j: 0, count: 0))


// cache ?? 
