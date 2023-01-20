
class Node<T> {
    var prev: Node?
    var data: T?
    var next: Node?
    
    init(data: T?,prev: Node? = nil, next: Node? = nil) {
        self.prev = prev
        self.next = next
        self.data = data
    }
}

class DoublylinkedList<T:Equatable> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    // tail은 늘 마지막 노드 (새로운 노드 추가시 tail에 추가)
    func append(data : T?) {
        if head == nil {
            head = Node.init(data: data)
            tail = head
        }
        
        let newNode = Node.init(data: data)
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
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
                return
            }
            node = node?.next
        }
            
        // change node
        let nextNode = node?.next
        node?.next = Node(data: data)
        node?.next?.prev = node
        node?.next?.next = nextNode
        nextNode?.prev = node?.next
    }
    
    func removeLast() {
        if head == nil {
            print("링크 리스트에 노드가 전혀 없습니다.")
            return
        }
        
        // head를 삭제하는 경우 (연결 리스트에 노드가 1개 밖에 없는 경우)
        if head?.next == nil {
            head = nil
            tail = nil
            return
        }
        
        tail?.prev?.next = nil
        tail = tail?.prev
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
}
