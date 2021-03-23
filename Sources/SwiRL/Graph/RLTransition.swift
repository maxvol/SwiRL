//
//  RLTransition.swift
//  
//
//  Created by Maxim Volgin on 22/03/2021.
//

import Foundation

//public protocol RLNode: RLState, Vertex {
//}

public protocol RLTransition: Edge {
    associatedtype Value: RLValue
        
    var reward: Value { get }
}

public extension RLTransition {
    func render() -> String {
        "\tV\(from) -> V\(to) [label='\(reward)'];"
    }
}

//public protocol Transition: Edge  {
//    associatedtype Value: RLValue
//
//    var probability: Value { get }
//}
