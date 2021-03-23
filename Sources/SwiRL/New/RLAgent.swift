//
//  RLAgent.swift
//  SwiRL
//
//  Created by Maxim Volgin on 10/10/2020.
//

import Foundation

public protocol RLAgent: RLPolicy {
    associatedtype Target: RLTarget // where Target.Value == Experience.Value
//    associatedtype Experience: RLExperience<Observation, Action, Target.Value>

    func action(for observation: Observation) -> Action
    mutating func reflect(upon experience: RLExperience<Observation, Action, Target.Value>)
}
