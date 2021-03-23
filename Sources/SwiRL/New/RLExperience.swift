//
//  RLExperience.swift
//  SwiRL
//
//  Created by Maxim Volgin on 10/10/2020.
//

import Foundation

public struct RLExperience<Observation: RLObservation, Action: RLAction, Value: RLValue> {
    /** Oₜ */
    public let observation: Observation
    /** Aₜ */
    public let action: Action
    /** Rₜ₊₁ */
    public let reward: Value
    /** Oₜ₊₁ */
    public let nextObservation: Observation
    /** episode is finished */
    public let isFinal: Bool
    
    public init(observation: Observation, action: Action, reward: Value, nextObservation: Observation, isFinal: Bool) {
        self.observation = observation
        self.action = action
        self.reward = reward
        self.nextObservation = nextObservation
        self.isFinal = isFinal
    }
    
    public init(observation: Observation, action: Action, step: RLStep<Observation, Value>) {
        self.observation = observation
        self.action = action
        switch step {
        case .restart(let nextObservation):
            self.reward = Value(0)
            self.nextObservation = nextObservation
            self.isFinal = false
        case .transition(let nextObservation, let reward):
            self.reward = reward
            self.nextObservation = nextObservation
            self.isFinal = false
        case .termination(let nextObservation, let reward):
            self.reward = reward
            self.nextObservation = nextObservation
            self.isFinal = true
        }
    }
    
}

