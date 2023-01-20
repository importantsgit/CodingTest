class Node<T> {
    var data: T?
    var next: Node?
    
    init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkedList<T:Equatable> {
    private var head: Node<T>?
    
    func append(data: T?) {
        // 만약 head가 없으면 노드 추가
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var node = head
        // 맨 마지막 노드까지 이동
        while node?.next != nil {
            node = node?.next
        }
        // 맨 마지막 노드에 연결
        node?.next = Node(data: data)
        
    }
    
    func insert(data: T?, at index: Int) {
        
        // head가 없는 경우 Node를 생성 후 head로 지정한다.
        if head == nil {
            print("링크 리스트에 노드가 전혀 없습니다.")
            return
        }
        
        var node = head
        for _ in 0 ..< (index - 1) { // 입력된 인덱스 전까지 올라감
            if node?.next == nil {
                print("인덱스 범위를 넘어갔습니다.")
                break
            }
            
            // change node
            let nextNode = node?.next
            node?.next = Node(data: data)
            node?.next?.next = nextNode
        }
    }
    
    func removeLast(){
        if head == nil {
            print("저장된 노드가 없습니다.")
            return
        }
        
        var node = head
        // 만약 현재 노드의 next 노드의 next가 nil이라면 다음 노드가 마지막임으로 현재
        while node?.next?.next == nil {
            node = node?.next
        }
        node?.next = nil
    }
    
    func remove(at index: Int) {
        if head == nil {
            print("현재 저장된 노드가 전혀 없습니다.")
            return
        }
        
        var node = head
        for _ in 0 ..< index-1 {
            if node?.next?.next == nil {break}
            node = node?.next
        }
        
        node?.next = node?.next?.next
        // 가운데 노드 연결 끊기
    }
    
    func searchFirstNum(from data: T?) -> Node<T>? {
        if head == nil {
            print("현재 저장된 노드가 전혀 없습니다.")
            return nil
        }
        
        var node = head
        while node?.next != nil {
            if node?.data == data {break}
            node = node?.next
        }
        
        return node
    }
    
    func returnArray()->[T]? {
        var arr:[T] = []
        if head == nil {
            print("현재 저장된 노드가 전혀 없습니다.")
            return nil
        }
        var node = head
        while node != nil {
            arr.append((node?.data!)!)
            node = node?.next
        }
        return arr
    }
}

var linkList: LinkedList = LinkedList<Int>()
linkList.append(data: 1)
linkList.append(data: 5)
linkList.append(data: 4)
linkList.append(data: 3)
linkList.append(data: 2)

linkList.remove(at: 2)

print(linkList.returnArray()!)
