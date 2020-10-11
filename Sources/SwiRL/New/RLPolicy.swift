//
//  RLPolicy.swift
//  SwiRL
//
//  Created by Maxim Volgin on 10/10/2020.
//

import Foundation

public protocol RLPolicy {
    associatedtype Observation: RLObservation
    associatedtype Action: RLAction
    
    func action(for observation: Observation) -> Action
}
