//
//  RLEnv.swift
//  
//
//  Created by Maxim Volgin on 24/09/2021.
//

import Foundation

//typealias RLActionSpace

public protocol RLEnv: CustomStringConvertible {
    associatedtype Value: RLValue
    //    associatedtype Action: RLAction
    //    associatedtype Observation: RLObservation
    //    associatedtype Experience: RLExperience
    associatedtype StateType: Comparable
    associatedtype ActionType: Comparable
    
    static var stateSpace: RLSpace<StateType> { get }
    static var actionSpace: RLSpace<ActionType> { get }
    var isTerminated: Bool { get }
    var reward: Value { get }
    var state: RLType<StateType> { get }
    
    mutating func reset() // -> RLStep<Observation, Value>
//    func step(action intended: Action) -> RLStep<Observation, Value>

    func callAsFunction(action intended: RLType<ActionType>) // -> RLStep<Observation, Value>
    


}

public extension RLEnv {
    var description: String {
        [
            "isTerminated: \(isTerminated)",
            "stateSpace: \(Self.stateSpace)",
            "actionSpace: \(Self.actionSpace)",
            "state: \(state)"
        ]
        .joined(separator: "\n")
    }
}
