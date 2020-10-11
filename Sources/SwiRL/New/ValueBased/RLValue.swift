//
//  RLValue.swift
//  SwiRL
//
//  Created by Maxim Volgin on 10/10/2020.
//

import Foundation

public typealias RLValue = FloatingPoint

public protocol RLKey {}

public struct RLKeyV<State: RLState>: RLKey {
    public let state: State
    
    public init(state: State) {
        self.state = state
    }
}

public struct RLKeyQ<State: RLState, Action: RLAction>: RLKey {
    public let state: State
    public let action: Action
    
    public init(state: State, action: Action) {
        self.state = state
        self.action = action
    }
}
