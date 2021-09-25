//
//  MARLStatus.swift
//  
//
//  Created by Maxim Volgin on 25/09/2021.
//

import Foundation

// ID: Hashable, 
public struct MARLStatus<Value: RLValue, T: Comparable> {
    let step: UInt64
    let time: TimeInterval
    let observation: RLType<T>
    let isTerminated: Bool
    var isInitial: Bool { step == 0 }
//    let reward: Dictionary<ID, Value>
}
