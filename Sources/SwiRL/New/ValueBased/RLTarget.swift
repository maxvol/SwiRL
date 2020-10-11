//
//  RLTarget.swift
//  SwiRL
//
//  Created by Maxim Volgin on 10/10/2020.
//

import Foundation

public protocol RLTarget {
    associatedtype Value: RLValue
    
    var discount: Value { get }
    
    /**
     - Returns: target value
     */
    func callAsFunction() -> Value
}

public protocol RLStateValueTarget: RLTarget {
    associatedtype State: RLState

    typealias V = (State) -> Value
    
    var value: V { get }
}

public protocol RLStateActionValueTarget: RLTarget {
    associatedtype State: RLState
    associatedtype Action: RLAction
    
    typealias Q = (State, Action) -> Value
    
    var value: Q { get }
}
