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

//public protocol Transition: Edge  {
//    associatedtype Value: RLValue
//
//    var probability: Value { get }
//}
