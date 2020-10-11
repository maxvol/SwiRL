//
//  RLTargetSARSA.swift
//  SwiRL
//
//  Created by Maxim Volgin on 10/10/2020.
//

import Foundation

public struct RLTargetSARSA<State: RLState, Action: RLAction, Value: RLValue>: RLStateActionValueTarget {
    
    public let reward: Value
    public let discount: Value
    public let value: (State, Action) -> Value
    public let nextState: State
    public let nextAction: Action
    
    public func callAsFunction() -> Value {
        RLTargetSARSA.expectedReturn(reward: reward, discount: discount, value: value, state: nextState, action: nextAction)
    }

    /**
        SARSA estimated return for step `t`
     
        - Note: Rₜ₊₁ + 𝛄Q(Sₜ₊₁, Aₜ₊₁)
        - Remark: bootstrapping, 1-step
     
        - Parameters:
            - Rₜ₊₁: reward
            - Sₜ₊₁: next state
            - Q: value function
            - 𝛄: discount
        - Returns: Ĝₜ
     */
    public static func expectedReturn(reward Rₜ₊₁: Value, discount 𝛄: Value, value Q: (State, Action) -> Value, state Sₜ₊₁: State, action Aₜ₊₁: Action) -> Value {
        Rₜ₊₁ + 𝛄*Q(Sₜ₊₁, Aₜ₊₁)
    }
    
}

