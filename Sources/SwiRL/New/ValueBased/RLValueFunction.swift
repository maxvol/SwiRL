//
//  RLValueFunction.swift
//  SwiRL
//
//  Created by Maxim Volgin on 11/10/2020.
//

import Foundation

public protocol RLValueFunction {
    associatedtype Key: RLKey
    associatedtype Value: RLValue

    var defaultValue: Value { get }
    
    func value(for key: Key) -> Value?
    func set(value: Value, for key: Key)
    
    subscript(key: Key) -> Value { get set }
}

public extension RLValueFunction {
    subscript(key: Key) -> Value {
        get {
            value(for: key) ?? defaultValue
        }
        set {
            set(value: newValue, for: key)
        }
    }
}

public protocol RLStateValueFunction: RLValueFunction where Key == RLKeyV<State> {
    associatedtype State: RLState
    
    subscript(state: State) -> Value { get set }

    func V(_ state: State) -> Value
}

public extension RLStateValueFunction {
    
    subscript(state: State) -> Value {
        get {
            value(for: Key(state: state)) ?? defaultValue
        }
        set {
            set(value: newValue, for: Key(state: state))
        }
    }
    
    func V(_ state: State) -> Value {
        self[Key(state: state)]
    }
    
}

public protocol RLStateActionValueFunction: RLValueFunction where Key == RLKeyQ<State, Action> {
    associatedtype State: RLState
    associatedtype Action: RLAction

    func Q(_ state: State, _ action: Action) -> Value
    func greedy(for Sₜ: State, in actionSpace: [Action]) throws -> (action: Action, value: Value)
}

public extension RLStateActionValueFunction {
    
    subscript(state: State, action: Action) -> Value {
        get {
            value(for: Key(state: state, action: action)) ?? defaultValue
        }
        set {
            set(value: newValue, for: Key(state: state, action: action))
        }
    }

    func Q(_ state: State, _ action: Action) -> Value {
        self[Key(state: state, action: action)]
    }
    
    func greedy(for Sₜ: State, in actionSpace: [Action]) throws -> (action: Action, value: Value) {
        guard let maxQ = actionSpace.map { A in self.Q(Sₜ, A) }.max() else { throw RLException.maxQ(message: "`maxQ` cannot be determined.") }
        guard let argmaxQ = actionSpace.filter { A in self.Q(Sₜ, A) == maxQ }.randomElement() else { throw RLException.argmaxQ(message: "`argmaxQ` cannot be determined.") }
        return (action: argmaxQ, value: maxQ)
    }
    
}
