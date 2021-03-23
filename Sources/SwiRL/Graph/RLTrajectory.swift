//
//  RLTrajectory.swift
//  
//
//  Created by Maxim Volgin on 22/03/2021.
//

import Foundation

public struct RLTrajectory<Observation: RLObservation, Action: RLAction, Value: RLValue> {
    public var experiences: [RLExperience<Observation, Action, Value>] = []
    
    public var isEmpty: Bool { get { experiences.isEmpty } }
    public var isComplete: Bool { get { experiences.last?.isFinal ?? false } }
}

/**
 Ĝₜ
 */
//public protocol RLTarget {
//
//}

/**
 
 Ĝₜ
 
 
 ₜ₊₁
 
 𝛄²³ⁿ
 
 𝜋
 
 Rₜ₊₁₂₃₄₅ₙ
 
 */
