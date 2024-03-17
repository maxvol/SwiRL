//
//  MARLStatus.swift
//  
//
//  Created by Maxim Volgin on 25/09/2021.
//

import Foundation

// ID: Hashable, 
public struct MARLStatus<Value: RLValue, StateType: Comparable> {
    public let step: UInt64
    public let time: TimeInterval
    public let observation: RLType<StateType>
    public let isTerminated: Bool
    public var isInitial: Bool { step == 0 }
//    let reward: Dictionary<ID, Value>
    
    public init(step: UInt64, time: TimeInterval, observation: RLType<StateType>, isTerminated: Bool) {
        self.step = step
        self.time = time
        self.observation = observation
        self.isTerminated = isTerminated
    }
}
