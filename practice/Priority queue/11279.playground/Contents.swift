enum MyError: Error {
    case noElement
    case Error
}

struct MaxHeap<T: Comparable> {
    var heap: [T] = []
    
    init(zero: T) {
        heap.append(zero)
    }
    
    // 삽입
    mutating func insert(of num: T) {
        // 1. 마지막 노드에 숫자 삽입
        heap.append(num)
        var numIdx = heap.count - 1
        // 2. 부모노드랑 현재 num노드랑 값을 비교하여 자신이 크다면 Swap
        // 3. 2번 조건을 만족하지 않을 때까지 자신의 루트 노드가 아닐때 까지 반복
        while numIdx != 1 && num > heap[numIdx/2] {
            changeNum(idx1: numIdx, idx2: numIdx/2)
            numIdx = numIdx/2
        }
    }
    
    @discardableResult
    mutating func popMax() -> T? {
        // 1. 먼저 요소가 있는지 체크
        if heap.count <= 1 {
            print(MyError.noElement)
            return nil
        }
        // 2. 마지막 요소와 첫번째 요소 체인지
        changeNum(idx1: 1, idx2: heap.count-1)
        let pop = heap.popLast()!
        // 3. 현재 노드에서 자식 노드와 비교하면서 자식 노드가 더 큰 값이면 Swap
        // 4. 위치를 찾을 때까지 3번 과정을 반복
        downHeap()
        
        return pop
    }
    
    private mutating func changeNum(idx1:Int, idx2: Int) {
        var changeNum = heap[idx1]
        heap[idx1] = heap[idx2]
        heap[idx2] = changeNum
    }
    
    private mutating func downHeap() {
        var pIdx = 1
        while true {
            var cIdx = pIdx * 2
            if cIdx+1 < heap.count && heap[cIdx] < heap[cIdx+1] {cIdx+=1}
            if cIdx >= heap.count || heap[cIdx] < heap[pIdx] {break}
            changeNum(idx1: pIdx, idx2: cIdx)
            pIdx = cIdx
        }
    }
}



