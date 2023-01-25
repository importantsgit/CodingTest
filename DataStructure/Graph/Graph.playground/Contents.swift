/*
 그래프
 노드와 그 노드를 연결하는 선을 모아놓은 자료구조
 노드(node) = 정점(vertex)
 간선(edge) = 링크 / 브랜치
 그래프를 그린 후 BFS / DFS 같은 알고리즘을 사용하여 문제를 푼다.
*/

// 노드 코드
// where은 Swift 패턴들과 결합하여 조건을 추가해줄 수 있음
// 타입에 대한 제약을 추가할 수 있음

import Foundation



/*
 인접리스트 장점
 1. 메모리 덜 차지함 (딱 노드 + 간선 갯수만큼만 차지)
 2. 전체 노드를 다 확인해야 할 때 O(E)의 시간복잡도
 
 인접리스트 단점
 1. 노드와 노드가 연결되어 있는지 확인할때 O(V)의 시간이 걸림
 ----
 
 인접 행렬의 장점
 1. 노드와 노드가 연결되어 있는지 확인할 때 O(1)의 시간복잡도
 2. 구현이 좀 더 간편함
 
 인접 행렬의 단점
 1. 전체 노드를 다 확인해야 할 때 -> 간선에 비해 노드의 갯수가 훨씬 많다면 매우 좋지 않음

 */


let graph = AdjacencyList<Int>()
// 노드 생성
let a = graph.createVertex(data: 1)
let b = graph.createVertex(data: 2)
let c = graph.createVertex(data: 3)
let d = graph.createVertex(data: 4)
let e = graph.createVertex(data: 5)
let f = graph.createVertex(data: 6)

// 연결
graph.add(.undirected, from: a, to: b, weight: 300)
graph.add(.undirected, from: c, to: b, weight: 100)
graph.add(.undirected, from: d, to: b, weight: 400)
graph.add(.undirected, from: e, to: b, weight: 100)
graph.add(.undirected, from: f, to: b, weight: 2300)
graph.add(.undirected, from: a, to: d, weight: 140)

print(graph.description)

let graph2 = AdjacencyMatrix<Int>()

let one = graph2.createVertex(data: 1)
let two = graph2.createVertex(data: 2)
let thr = graph2.createVertex(data: 3)
let fou = graph2.createVertex(data: 4)
let fiv = graph2.createVertex(data: 5)
let six = graph2.createVertex(data: 6)

graph2.add(.undirected, from: one, to: two, weight: 300)
graph2.add(.undirected, from: thr, to: two, weight: 100)
graph2.add(.undirected, from: fou, to: two, weight: 400)
graph2.add(.undirected, from: fiv, to: two, weight: 100)
graph2.add(.undirected, from: six, to: two, weight: 2300)
graph2.add(.undirected, from: one, to: two, weight: 140)

print(graph2.description)

graph2.DepthFirstSearch(source: one)

