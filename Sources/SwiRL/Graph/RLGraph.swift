//
//  RLGraph.swift
//  
//
//  Created by Maxim Volgin on 23/03/2021.
//

import Foundation

public protocol RLGraph: Graph where V: RLState, E: RLTransition {
}

//public protocol Graph {
//    associatedtype V: Vertex
//    associatedtype E: Edge where E.ID == V.ID
//
//    var vertices: [V] { get }
//    var edges: [E] { get }
//}

