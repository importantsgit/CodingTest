import Foundation

struct Queue<T> {
    private var queue: [T?] = []
    private var head: Int = 0
    
    public var count: Int {
        return queue.count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard head < count, let element = queue[head] else {
            return nil
        }
        queue[head] = nil
        head += 1
        
        if head > 3 {
            // head 만큼 앞의 값 지움
            queue.removeFirst(head)
            head = 0
        }
        return element
    }
}
