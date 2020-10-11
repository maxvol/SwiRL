//
//  RLValueBasedAlgorithm.swift
//  SwiRL
//
//  Created by Maxim Volgin on 11/10/2020.
//

import Foundation

public protocol RLValueBasedAlgorithm {
    associatedtype ValueFunction: RLValueFunction
    associatedtype Target: RLTarget where Target.Value == ValueFunction.Value
    
    var valueFunction: ValueFunction { get set }
    
    /**
     - Parameters:
        - key: value function key
        - target: target
        - 𝛼:  learning rate
     - Returns: new value for valueₜ
     - Note: valueₜ + 𝛼[targetₜ - valueₜ]
     */
    mutating func backup(for key: ValueFunction.Key, with target: Target, learningRate 𝛼: Target.Value)
    /**
     - Parameters:
        - valueₜ: estimated value on step `t`
        - targetₜ: target
        - 𝛼:  learning rate
     - Returns: new value for valueₜ
     - Note: valueₜ + 𝛼[targetₜ - valueₜ]
     */
    func newValue(value valueₜ: Target.Value, target targetₜ: Target, learningRate 𝛼: Target.Value) -> Target.Value
    /**
     - Parameters:
        - valueₜ: estimated value on step `t`
        - targetₜ: target
     - Returns: error
     - Note: targetₜ - valueₜ
     */
    func error(value valueₜ: Target.Value, target targetₜ: Target) -> Target.Value
}

public extension RLValueBasedAlgorithm {
    
    mutating func backup(for key: ValueFunction.Key, with target: Target, learningRate 𝛼: Target.Value) {
        var value = valueFunction[key]
        value = newValue(value: value, target: target, learningRate: 𝛼)
        valueFunction[key] = value
    }

    func newValue(value valueₜ: Target.Value, target targetₜ: Target, learningRate 𝛼: Target.Value) -> Target.Value {
        valueₜ + 𝛼*error(value: valueₜ, target: targetₜ)
    }

    func error(value valueₜ: Target.Value, target targetₜ: Target) -> Target.Value {
        targetₜ() - valueₜ
    }
    
}

public protocol RLStateValueBasedAlgorithm: RLValueBasedAlgorithm where ValueFunction: RLStateValueFunction  {
    mutating func backup(state Sₜ: ValueFunction.State, with target: Target, learningRate 𝛼: Target.Value)
}

public extension RLStateValueBasedAlgorithm {
    mutating func backup(state Sₜ: ValueFunction.State, with target: Target, learningRate 𝛼: Target.Value) {
        var value = valueFunction.V(Sₜ)
        value = newValue(value: value, target: target, learningRate: 𝛼)
        valueFunction[Sₜ] = value
    }
}

public protocol RLStateActionValueBasedAlgorithm: RLValueBasedAlgorithm where ValueFunction: RLStateActionValueFunction {
    mutating func backup(state Sₜ: ValueFunction.State, action Aₜ: ValueFunction.Action, with target: Target, learningRate 𝛼: Target.Value)
}

public extension RLStateActionValueBasedAlgorithm {
    mutating func backup(state Sₜ: ValueFunction.State, action Aₜ: ValueFunction.Action, with target: Target, learningRate 𝛼: Target.Value) {
        var value = valueFunction.Q(Sₜ, Aₜ)
        value = newValue(value: value, target: target, learningRate: 𝛼)
        valueFunction[Sₜ, Aₜ] = value
    }
}
