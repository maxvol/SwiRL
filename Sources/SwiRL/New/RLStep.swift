//
//  RLStep.swift
//  
//
//  Created by Maxim Volgin on 22/03/2021.
//

import Foundation

public enum RLStep<Observation: RLObservation, Value: RLValue> {
    case restart(observation: Observation)
    case transition(observation: Observation, reward: Value) // , discount: Value = 1.0)
    case termination(observation: Observation, reward: Value)
}
