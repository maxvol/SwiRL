//
//  RLStatus.swift
//  
//
//  Created by Maxim Volgin on 25/09/2021.
//

import Foundation

public struct RLStatus<Value: RLValue, T: Comparable> {
    let step: UInt64
    let time: TimeInterval
    let reward: Value
    let observation: RLType<T>
    let isTerminated: Bool
    var isInitial: Bool { step == 0 }
}
