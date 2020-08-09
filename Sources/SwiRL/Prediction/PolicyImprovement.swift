//
//  PolicyImprovement.swift
//  
//
//  Created by Maxim Volgin on 09/08/2020.
//

import Foundation

fileprivate let zero: RLValue = 0.0

// reference implementation, very inefficient
public class PolicyImprovement<E: RLEnvironment1> {
    
    public private(set) var P: [Int] = []
    
    public init() {}
    
    public func improve(environment: E, V: [RLState1: RLValue], gamma: RLValue = 1.0) {
        let stateCount = environment.stateSpace.count
        let actionCount = environment.actionSpace(for: environment.stateSpace.first!).count // TODO should be max actually
        var Q: [[RLValue]] = Array<Array<RLValue>>(repeating: Array<RLValue>(repeating: 0.0, count: actionCount), count: stateCount)
        
        for s in environment.stateSpace {
            for a in environment.actionSpace(for: s) {
                for o in environment.outcomeSpace(for: s, action: a) {
                    Q[s][a.rawValue] += self.value(for: o, in: V, gamma: gamma)
                }
            }
        }
        
        // new_pi = lambda s: {s:a for s, a in enumerate(np.argmax(Q, axis=1))}[s]
        self.P = self.policy(Q: Q)
  
    }
    
    private func policy(Q: [[RLValue]]) -> [Int] {
        var P: [Int] = Array<Int>(repeating: -1, count: Q.count)
        for (s, q) in Q.enumerated() {
            P[s] = argmax(q)
        }
        return P
    }
    
    private func value(for outcome: RLOutcome, in V: [RLState1: RLValue], gamma: RLValue) -> RLValue {
        let expected = outcome.done ? zero : (gamma * (V[outcome.next] ?? zero))
        return outcome.probability * (outcome.reward + expected)
    }
        
}
