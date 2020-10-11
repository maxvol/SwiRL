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
    let state: State
}

public struct RLKeyQ<State: RLState, Action: RLAction>: RLKey {
    let state: State
    let action: Action
}
