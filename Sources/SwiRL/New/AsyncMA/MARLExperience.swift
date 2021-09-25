//
//  MARLExperience.swift
//  
//
//  Created by Maxim Volgin on 25/09/2021.
//

import Foundation

public struct MARLExperience<StateType: Comparable, ActionType: Comparable, Value: RLValue> {
    /** Oₜ */
    public let observation: RLType<StateType>
    /** Aₜ */
    public let action: RLType<ActionType>
    /** Rₜ₊₁ */
    public let reward: Value
    /** Oₜ₊₁ */
    public let nextObservation: RLType<StateType>
    
    public init(observation: RLType<StateType>, action: RLType<ActionType>, reward: Value, nextObservation: RLType<StateType>) {
        self.observation = observation
        self.action = action
        self.reward = reward
        self.nextObservation = nextObservation
    }
}
