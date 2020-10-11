//
//  RLEnvironment.swift
//  SwiRL
//
//  Created by Maxim Volgin on 10/10/2020.
//

import Foundation

public protocol RLEnvironment {
    associatedtype Action: RLAction
    associatedtype Experience: RLExperience

    func perform(action intended: Action) -> Experience
}

//protocol RLEnvironment {
//    func T(_ obs: RLObservation, _ action: RLAction, _ nextObs: RLObservation) -> RLReward // scalar
//    func R(_ obs: RLObservation, _ action: RLAction?, _ nextObs: RLObservation?) -> RLReward // scalar
//}
//
//
