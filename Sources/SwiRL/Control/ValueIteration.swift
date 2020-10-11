//
//  ValueIteration.swift
//  
//
//  Created by Maxim Volgin on 09/08/2020.
//

import Foundation

fileprivate let zero: Float = 0.0

// reference implementation, very inefficient
public class ValueIteration<E: RLEnvironment1> where E.Value == Float {
    
    public private(set) var optimalPolicy: RLDeterministicPolicy<E.State, E.Action>? = nil
    
    public private(set) var V: [E.Value] = []
    public private(set) var Q: [[E.Value]] = []
    
    public init() {}
    
    public func iterate(environment: E, gamma: E.Value = Float(1.0), theta: E.Value = Float(1e-10)) {
        let actionCount = E.Action.allCases.count
        let stateCount = environment.stateSpace.count
        V = Array<E.Value>(repeating: zero, count: stateCount)
        
        while true {
            Q = Array<Array<E.Value>>(repeating: Array<E.Value>(repeating: zero, count: actionCount), count: stateCount)
            
            for s in environment.stateSpace {
                for a in environment.actionSpace(for: s) {
                    for o in environment.outcomeSpace(for: s, action: a) {
                        Q[s.id][a.rawValue] += self.value(for: o, in: V, gamma: gamma)
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
        
        self.optimalPolicy = RLDeterministicPolicy<E.State, E.Action>(self.policy(Q: Q))
    }
    
    private func value(for outcome: RLOutcome<E.State, E.Value>, in V: [E.Value], gamma: E.Value) -> E.Value {
        let expected = outcome.done ? zero : (gamma * V[outcome.next.id])
        return outcome.probability * (outcome.reward + expected)
    }
    
    private func didConverge(V: [E.Value], Q: [[E.Value]], theta: E.Value) -> Bool {
        zip (
            V,
            Q.map { $0.max()! }
        )
        .map { abs($0 - $1) }
        .max()! < theta
    }
    
    private func policy(Q: [[E.Value]]) -> [Int] {
        var P: [Int] = Array<Int>(repeating: -1, count: Q.count)
        for (s, q) in Q.enumerated() {
            P[s] = argmax(q)
        }
        return P
    }
      
}
