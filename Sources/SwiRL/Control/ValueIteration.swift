//
//  ValueIteration.swift
//  
//
//  Created by Maxim Volgin on 09/08/2020.
//

import Foundation

fileprivate let zero: RLValue = 0.0

// reference implementation, very inefficient
public class ValueIteration<E: RLEnvironment1> {
    
    public private(set) var optimalPolicy: RLDeterministicPolicy<E.A>? = nil
    
    public private(set) var V: [RLValue] = []
    public private(set) var Q: [[RLValue]] = []
    
    public init() {}
    
    public func iterate(environment: E, gamma: RLValue = 1.0, theta: RLValue = 1e-10) {
        let actionCount = E.A.allCases.count
        let stateCount = environment.stateSpace.count
        V = Array<RLValue>(repeating: 0.0, count: stateCount)
        
        while true {
            Q = Array<Array<RLValue>>(repeating: Array<RLValue>(repeating: 0.0, count: actionCount), count: stateCount)
            
            for s in environment.stateSpace {
                for a in environment.actionSpace(for: s) {
                    for o in environment.outcomeSpace(for: s, action: a) {
                        Q[s][a.rawValue] += self.value(for: o, in: V, gamma: gamma)
                    }
                }
            }
            
            let didConverge = self.didConverge(V: V, Q: Q, theta: theta)
            
            if didConverge {
                print("converged!")
                break
            }
            
            V = Q.map { $0.max()! }
            
        }
        
        self.optimalPolicy = RLDeterministicPolicy<E.A>(self.policy(Q: Q))
    }
    
    private func value(for outcome: RLOutcome, in V: [RLValue], gamma: RLValue) -> RLValue {
        let expected = outcome.done ? zero : (gamma * V[outcome.next])
        return outcome.probability * (outcome.reward + expected)
    }
    
    private func didConverge(V: [RLValue], Q: [[RLValue]], theta: RLValue) -> Bool {
        zip (
            V,
            Q.map { $0.max()! }
        )
        .map { abs($0 - $1) }
        .max()! < theta
    }
    
    private func policy(Q: [[RLValue]]) -> [Int] {
        var P: [Int] = Array<Int>(repeating: -1, count: Q.count)
        for (s, q) in Q.enumerated() {
            P[s] = argmax(q)
        }
        return P
    }
      
}
