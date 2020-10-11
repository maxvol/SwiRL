//
//  PolicyImprovement.swift
//  
//
//  Created by Maxim Volgin on 09/08/2020.
//

import Foundation

fileprivate let zero: Float = 0.0

// reference implementation, very inefficient
public class PolicyImprovement<E: RLEnvironment1> where E.Value == Float {
    
    public private(set) var P: [Int] = []
    
    public init() {}
    
    public func improve(environment: E, V: [E.State.ID: E.Value], gamma: E.Value = Float(1.0)) {
        let stateCount = environment.stateSpace.count
        let actionCount = E.Action.allCases.count
        var Q: [[E.Value]] = Array<Array<E.Value>>(repeating: Array<E.Value>(repeating: 0.0, count: actionCount), count: stateCount)
        
        for s in environment.stateSpace {
            for a in environment.actionSpace(for: s) {
                for o in environment.outcomeSpace(for: s, action: a) {
                    Q[s.id][a.rawValue] += self.value(for: o, in: V, gamma: gamma)
                }
            }
        }
        
        // new_pi = lambda s: {s:a for s, a in enumerate(np.argmax(Q, axis=1))}[s]
        self.P = self.policy(Q: Q)
  
    }
    
    private func policy(Q: [[E.Value]]) -> [Int] {
        var P: [Int] = Array<Int>(repeating: -1, count: Q.count)
        for (s, q) in Q.enumerated() {
            P[s] = argmax(q)
        }
        return P
    }
    
    private func value(for outcome: RLOutcome<E.State, E.Value>, in V: [E.State.ID: E.Value], gamma: E.Value) -> E.Value {
        let expected = outcome.done ? zero : (gamma * (V[outcome.next.id] ?? zero))
        return outcome.probability * (outcome.reward + expected)
    }
        
}
