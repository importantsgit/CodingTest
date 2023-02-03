import Foundation

func printArray(arr: [[Int]]) {
    var grid: [String] = []
    for i in 0..<arr.count {
        var row = ""
        for j in 0..<arr.first!.count {
            let value = arr[i][j]
            if value != 1000000 {
                row += "\(value) \t"
            } else {
                row += "INF\t"
            }
        }
        grid.append(row)
    }

    let edgesDescription = grid.joined(separator: "\n\n")
    print(edgesDescription)
}

func DPCoinChange(money: Int, coins: [Int]) -> Int {
    var minCoin = coins.min()!
    var tens = Int(pow(10.0,Double(String(minCoin).filter({$0 == "0"}).count)))
    var money = money/tens
    var coins = coins.sorted().map{$0/tens}
    var arr: [Int] = [Int](repeating:100000, count: money+1)
    arr[0] = 0
    for i in 1...money {
        for coin in coins {
            if coin <= i && arr[i-coin] + 1 < arr[i] { arr[i] = arr[i-coin] + 1 }
        }
    }
    print(arr)
    return arr[money]
}


var money = 200
var coins = [160,50,10,100]




DPCoinChange(money: money, coins: coins)
