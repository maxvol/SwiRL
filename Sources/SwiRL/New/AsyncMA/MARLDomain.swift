//
//  MARLDomain.swift
//  
//
//  Created by Maxim Volgin on 25/09/2021.
//

import Foundation

public protocol MARLDomain {
    associatedtype StateType: Comparable
    associatedtype ActionType: Comparable

    associatedtype ID: Hashable

//    static var stateSpace: RLSpace<StateType> { get }
//    static var actionSpace: RLSpace<ActionType> { get }
    
    // can act / my turn?
    // which actions
    
    // maybe include status / terminated
    func canAct(observation: RLType<StateType>, agent id: ID) -> Bool
    
//    func generate masks
    
}

//
//var id: ID { get }
