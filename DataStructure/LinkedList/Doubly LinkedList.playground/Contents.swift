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
}
