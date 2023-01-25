import Foundation

public class AdjacencyMatrix<T>: Graph {
    private var vertices: [Vertex<T>] = []
    private var weights: [[Double?]] = []
    private var isVisited: [Bool] = []
    public init() {}
    
    public func createVertex(data: T) -> Vertex<T> {
        // 새로운 꼭지점을 배열에 추가
        let vertex = Vertex(index: vertices.count, data: data)
        vertices.append(vertex)
        for i in 0..<weights.count {
            // 아직 모서리를 가지지 않기 때문에 아무 가중치도 추가하지 않음
            weights[i].append(nil)
        }
        let row: [Double?] = [Double?](repeating: nil, count: vertices.count)
        weights.append(row)
        isVisited.append(false)
        return vertex
    }
    
    // 모서리 생성 -> 가중치 추가
    public func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        weights[source.index][destination.index] = weight
    }
    
    // 꼭지점에 대한 모서리 검색
    public func edges(from source: Vertex<T>) -> [Edge<T>] {
        var edges: [Edge<T>] = []
        for column in 0..<weights.count {
            if let weight = weights[source.index][column] {
                edges.append(Edge(
                    source: source,
                    destination: vertices[column],
                    weight: weight
                ))
            }
        }
        return edges
    }
    
    // 가중치 검색
    public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        return weights[source.index][destination.index]
    }
    
    public func DepthFirstSearch(source: Vertex<T>) {
        var source = source
        isVisited[source.index] = true
        print("정점 \(source.data) ->")
        for i in 0..<weights.count {
            if weights[source.index][i] != nil && !isVisited[i] {
                DepthFirstSearch(source: vertices.first(where: {$0.index == i})!)
            }
        }
    }
}

extension AdjacencyMatrix: CustomStringConvertible {
    public var description: String {
        let verticesDescription = vertices.map { "\($0)" }
        // 2
        var grid: [String] = []
        for i in 0..<weights.count {
            var row = ""
            for j in 0..<weights.count {
                if let value = weights[i][j] {
                    row += "\(value)\t"
                } else {
                    row += "ø\t\t"
                }
            }
            grid.append(row)
        }
        let edgesDescription = grid.joined(separator: "\n")
        
        return "\(verticesDescription)\n\n\(edgesDescription)"
    }
}
