//
//  MARLExperience.swift
//  
//
//  Created by Maxim Volgin on 25/09/2021.
//

import Foundation

public struct MARLExperience<Observation: RLObservation, Action: RLAction, Value: RLValue> {
    /** Oₜ */
    public let observation: Observation
    /** Aₜ */
    public let action: Action
    /** Rₜ₊₁ */
    public let reward: Value
    /** Oₜ₊₁ */
    public let nextObservation: Observation
}
