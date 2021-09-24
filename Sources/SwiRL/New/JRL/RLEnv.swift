//
//  RLEnv.swift
//  
//
//  Created by Maxim Volgin on 24/09/2021.
//

import Foundation

//typealias RLActionSpace

public protocol RLEnv {
    //    associatedtype Value: RLValue
    //    associatedtype Action: RLAction
    //    associatedtype Observation: RLObservation
    //    associatedtype Experience: RLExperience
    associatedtype ActionType: Comparable
    associatedtype StateType: Comparable
    
    var actionSpace: RLSpace<ActionType> { get }
    var stateSpace: RLSpace<StateType> { get }

    
    func callAsFunction(action intended: RLType<ActionType>) // -> RLStep<Observation, Value>
    
//    func perform(action intended: Action) -> Experience
    
//    func reset() -> RLStep<Observation, Value>
//    func step(action intended: Action) -> RLStep<Observation, Value>

    
    //state(env::YourEnv)
    //reward(env::YourEnv)
    //is_terminated(env::YourEnv)
    //reset!(env::YourEnv)


}
