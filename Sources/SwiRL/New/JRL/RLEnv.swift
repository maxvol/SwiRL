//
//  RLEnv.swift
//  
//
//  Created by Maxim Volgin on 24/09/2021.
//

import Foundation

//typealias RLActionSpace

public protocol RLEnv {
    associatedtype Value: RLValue
    //    associatedtype Action: RLAction
    //    associatedtype Observation: RLObservation
    //    associatedtype Experience: RLExperience
    associatedtype StateType: Comparable
    associatedtype ActionType: Comparable
    
    var stateSpace: RLSpace<StateType> { get }
    var actionSpace: RLSpace<ActionType> { get }
    var isTerminated: Bool { get }
    var reward: Value { get }
    var state: RLType<StateType> { get }
    
    mutating func reset() // -> RLStep<Observation, Value>
//    func step(action intended: Action) -> RLStep<Observation, Value>

    func callAsFunction(action intended: RLType<ActionType>) // -> RLStep<Observation, Value>
    


}
