//
//  RLAgent.swift
//  SwiRL
//
//  Created by Maxim Volgin on 10/10/2020.
//

import Foundation

public protocol RLAgent: RLPolicy {
    associatedtype Experience: RLExperience
    associatedtype Target: RLTarget where Target.Value == Experience.Value

    func action(for observation: Observation) -> Action
    mutating func reflect(upon experience: Experience)
}
