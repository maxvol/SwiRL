//
//  PolicyIteraton.swift
//  
//
//  Created by Maxim Volgin on 09/08/2020.
//

import Foundation

fileprivate let zero: RLValue = 0.0

// reference implementation, very inefficient
public class PolicyIteraton<E: RLEnvironment1> {
    
    public private(set) var optimalPolicy: RLDeterministicPolicy<E.A>? = nil
    
    public init() {}
    
    public func iterate(environment: E, gamma: RLValue = 1.0, theta: RLValue = 1e-10) {
        let stateCount = environment.stateSpace.count
        var P = Array<Int>(repeating: 0, count: stateCount)
            .map { _ in E.A.allCases.randomElement()!.rawValue }
        
        while true {
            let policy = RLDeterministicPolicy<E.A>(P)
            let ipe = IterativePolicyEvaluation<E, RLDeterministicPolicy<E.A>>()
            ipe.evaluate(environment: environment, policy: policy, gamma: gamma, theta: theta)
            let pi = PolicyImprovement<E>()
            pi.improve(environment: environment, V: ipe.bootstrap)
            if zip(pi.P, P).map { $0 != $1 }.filter { $0 }.count == 0 {
                self.optimalPolicy = RLDeterministicPolicy<E.A>(pi.P)
                break
            }
            P = pi.P
        }
    }
      
}
