//
//  RLTargetQLearning.swift
//  SwiRL
//
//  Created by Maxim Volgin on 10/10/2020.
//

import Foundation

public struct RLTargetQLearning<State: RLState, Action: RLAction, Value: RLValue>: RLStateActionValueTarget {
    
    public let reward: Value
    public let discount: Value
    public let value: (State, Action) -> Value
    public let nextState: State
    public let actionSpace: [Action]
    
    public init(reward: Value, discount: Value, value: @escaping (State, Action) -> Value, nextState: State, actionSpace: [Action]) {
        self.reward = reward
        self.discount = discount
        self.value = value
        self.nextState = nextState
        self.actionSpace = actionSpace
    }
    
    public func callAsFunction() -> Value {
        RLTargetQLearning.expectedReturn(reward: reward, discount: discount, value: value, state: nextState, actionSpace: actionSpace)
    }

    /**
        Q-learning estimated return for step `t`
     
        - Note: Rₜ₊₁ + 𝛄maxₐQ(Sₜ₊₁, a)
        - Remark: bootstrapping, 1-step
     
        - Parameters:
            - Rₜ₊₁: reward
            - Sₜ₊₁: next state
            - Q: value function
            - 𝛄: discount
        - Returns: Ĝₜ
     */
    public static func expectedReturn(reward Rₜ₊₁: Value, discount 𝛄: Value, value Q: (State, Action) -> Value, state Sₜ₊₁: State, actionSpace A: [Action]) -> Value {
        Rₜ₊₁ + 𝛄*A.map{ a in Q(Sₜ₊₁, a) }.max()!
    }
    
}

