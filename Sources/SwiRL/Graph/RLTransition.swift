//
//  RLTransition.swift
//  
//
//  Created by Maxim Volgin on 22/03/2021.
//

import Foundation

// S × A × S → [0, 1] // P(s'|s, a)
// S × A × S → R

public protocol RLTransition: Edge {
    associatedtype Action: RLAction
    associatedtype Value: RLValue

    var via: Action.ID { get }
    var reward: Value { get }
    /**
     P(s'|s, a) → [0, 1]
     */
    var probability: Value { get }
}

public extension RLTransition {
    func hash(into hasher: inout Hasher) {
        hasher.combine(from)
        hasher.combine(via)
        hasher.combine(to)
    }
}

public extension RLTransition {
    func render() -> String {
        "\tV\(from) -> V\(to) [label=\"A:\(via), P:\(probability), R:\(reward)\"];"
    }
}
