//
//  RLExperience.swift
//  SwiRL
//
//  Created by Maxim Volgin on 10/10/2020.
//

import Foundation

public protocol RLExperience {
    associatedtype Observation: RLObservation
    associatedtype Action: RLAction
    associatedtype Value: RLValue
    
    /** Oₜ */
    var observation: Observation { get }
    /** Aₜ */
    var action: Action { get }
    /** Rₜ₊₁ */
    var reward: Value { get }
    /** Oₜ₊₁ */
    var nextObservation: Observation { get }
    /** episode is finished */
    var isFinal: Bool { get }
}

