//
//  RLEnvironment.swift
//  SwiRL
//
//  Created by Maxim Volgin on 10/10/2020.
//

import Foundation

public protocol RLEnvironment {
    associatedtype Value: RLValue
    associatedtype Action: RLAction
    associatedtype Observation: RLObservation
//    associatedtype Experience: RLExperience

//    func perform(action intended: Action) -> Experience
    
    func reset() -> RLStep<Observation, Value>
    func step(action intended: Action) -> RLStep<Observation, Value>
    
//    func T(_ obs: RLObservation, _ action: RLAction, _ nextObs: RLObservation) -> RLValue
//    func R(_ obs: RLObservation, _ action: RLAction?, _ nextObs: RLObservation?) -> RLValue

}
