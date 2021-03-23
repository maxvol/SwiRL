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
}

