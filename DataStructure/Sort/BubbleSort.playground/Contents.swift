class Sort<T:Comparable> {
    var array:[T] = []
    
    init(array: [T]) {
        self.array = array
    }
    
    func bubbleSort(){
        for pass in 1 ..< array.count {
            for i in 1 ..< array.count - pass {
                if array[i-1] > array[i] { changeNum(idx1: i-1, idx2: i) }
            }
        }
    }
    
    func insertionSort() {
        for i in 1 ..< array.count {
            var currentElement = array[i]
            var j = i - 1
            while j >= 0 && array[j] > currentElement {
                array[j+1] = array[j]
                j -= 1
            }
            array[j+1] = currentElement
        }
    }
    
    func shallSort() {
        for gap in [7,5,3,1] {
            if gap > array.count { continue }
            for i in gap ..< array.count {
                var currentElement = array[i]
                var j = i
                while j >= gap && array[j-gap] > currentElement {
                    array[j] = array[j-gap]
                    j = j - gap
                    array[j] = currentElement
                }
            }
        }
    }
    
    private func changeNum(idx1: Int, idx2: Int) {
        let num = array[idx1]
        array[idx1] = array[idx2]
        array[idx2] = num
    }
    
     
}

var arr = [40,20,50,30,10,60]
var sort = Sort(array: arr)
sort.shallSort()
print(sort.array)
