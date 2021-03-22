//
//  RLTransition.swift
//  
//
//  Created by Maxim Volgin on 22/03/2021.
//

import Foundation

public struct RLTransition<Observation: RLObservation, Value: RLValue> {
    let observation: Observation
    let reward: Value
}
