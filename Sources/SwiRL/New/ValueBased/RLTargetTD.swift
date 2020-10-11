//
//  RLTargetTD.swift
//  
//
//  Created by Maxim Volgin on 11/10/2020.
//

import Foundation

public struct RLTargetTD<State: RLState, Value: RLValue>: RLStateValueTarget {
    
    public let reward: Value
    public let discount: Value
    public let value: (State) -> Value
    public let nextState: State
    
    public init(reward: Value, discount: Value, value: @escaping (State) -> Value, nextState: State) {
        self.reward = reward
        self.discount = discount
        self.value = value
        self.nextState = nextState
    }
    
    public func callAsFunction() -> Value {
        RLTargetTD.expectedReturn(reward: reward, discount: discount, value: value, state: nextState)
    }

    /**
        TD estimated return for step `t`
     
        - Note: Rₜ₊₁ + 𝛄V(Sₜ₊₁)
        - Remark: bootstrapping, 1-step
     
        - Parameters:
            - Rₜ₊₁: reward
            - Sₜ₊₁: next state
            - V: value function
            - 𝛄: discount
        - Returns: Ĝₜ
     */
    public static func expectedReturn(reward Rₜ₊₁: Value, discount 𝛄: Value, value V: (State) -> Value, state Sₜ₊₁: State) -> Value {
        Rₜ₊₁ + 𝛄*V(Sₜ₊₁)
    }
    
}

