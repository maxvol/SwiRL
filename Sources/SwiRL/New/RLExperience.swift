//
//  RLExperience.swift
//  SwiRL
//
//  Created by Maxim Volgin on 10/10/2020.
//

import Foundation

public struct RLExperience<Observation: RLObservation, Action: RLAction, Value: RLValue> {
    /** Oₜ */
    let observation: Observation
    /** Aₜ */
    let action: Action
    /** Rₜ₊₁ */
    let reward: Value
    /** Oₜ₊₁ */
    let nextObservation: Observation
    /** episode is finished */
    let isFinal: Bool
}

