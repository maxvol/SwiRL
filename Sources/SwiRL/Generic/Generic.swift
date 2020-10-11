//
//  File.swift
//  
//
//  Created by Maxim Volgin on 09/08/2020.
//

import Foundation

public protocol RLState1: RLState where ID == Int {
    var rawValue: Int { get }
    init?(rawValue: Int)
}

public extension RLState1 {
    var id: Int { get { rawValue } }
}

public protocol RLAction1: RLAction where ID == Int {
    var rawValue: Int { get }
    init?(rawValue: Int)
}

public extension RLAction1 {
    var id: Int { get { rawValue } }
}

public protocol RLPolicy1 {
    associatedtype State: RLState1
    associatedtype Action: RLAction1
    
    func action(for state: State) -> Action
}

public class RLDeterministicPolicy<S: RLState1, A: RLAction1>: RLPolicy1 {
    public private(set) var table: [Int] = [] // state is index
    
    public init(_ table: [Int]) {
        self.table = table
    }
    
    public convenience init(stateCount: Int) {
        self.init(
            Array<Int>(repeating: 0, count: stateCount)
                .map { _ in A.allCases.randomElement()!.rawValue }
        )
    }
    
    public func action(for state: S) -> A {
        A(rawValue: table[state.id])!
    }
}

//// TODO: implement
//public class RLStochasticPolicy<A: RLAction1>: RLPolicy1 {
//    private var table: [[(Int, RLValue)]] = [] // state is index
//
//    public init(_ table: [[(Int, RLValue)]]) {
//        self.table = table
//    }
//
//    public func action(for state: RLState1) -> A {
//        let actionProbability = table[state]
//        // TODO:
//        return A(rawValue: actionProbability.first!.0)!
//    }
//}
//
////typealias RLTrajectory = [RLExperience]

public struct RLOutcome<State: RLState1, Value: RLValue> {
    public let probability: Value
    public let next: State
    public let reward: Value
    public let done: Bool

    public init(probability: Value, next: State, reward: Value, done: Bool) {
        self.probability = probability
        self.next = next
        self.reward = reward
        self.done = done
    }
}

//typealias RLActionToOutcome = [RLAction1: [RLOutcome]]
//typealias RLStateToActionToOutcome = [RLState1: RLActionToOutcome]
//
//struct RLModel {
//    let P: RLStateToActionToOutcome = [:]
//}

public protocol RLEnvironment1 {
    associatedtype State: RLState1 where State: Hashable
    associatedtype Action: RLAction1
    associatedtype Value: RLValue

    var stateSpace: [State] { get }
    func actionSpace(for state: State) -> [Action]
    func outcomeSpace(for state: State, action: Action) -> [RLOutcome<State, Value>]
}

// MARK: - functions

//public func G<A: RLAction1>(trajectory: [RLExperience<A>], gamma: RLValue = 1.0) -> RLValue {
//    trajectory.map { $0.reward }.enumerated().map { pow(gamma, RLValue($0)) * $1 as RLValue }.reduce(0.0, +)
//}
//
//public func G<A: RLAction1>(trajectory: [RLExperience1<A>], gamma: RLValue = 1.0) -> RLValue {
//    trajectory.map { $0.Rₜ₊₁ }.enumerated().map { pow(gamma, RLValue($0)) * $1 as RLValue }.reduce(0.0, +)
//}

public func argmax<Value: RLValue>(_ array: [Value]) -> Int {
    var argmax: (Int, Value) = (-1, Value(Int(-Float.infinity))) // TODO: ???
    for element in array.enumerated() {
        if element.1 > argmax.1 {
            argmax = element
        }
    }
    return argmax.0
}
