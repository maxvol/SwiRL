//
//  IterativePolicyEvaluation.swift
//  
//
//  Created by Maxim Volgin on 08/08/2020.
//

import Foundation

fileprivate let zero: Float = 0.0

// reference implementation, very inefficient
public class IterativePolicyEvaluation<E: RLEnvironment1, P: RLPolicy1> where E.State == P.State, E.Action == P.Action, E.Value == Float {
    
    public private(set) var bootstrap: [E.State.ID: E.Value] = [:]
    
    public init() {}
    
    public func evaluate(environment: E, policy: P, gamma: E.Value = Float(1.0), theta: E.Value = Float(1e-10), maxIterationCount: Int = 1000, verbose: Bool = false) {
               
        for iteration in 0..<maxIterationCount {
            
            var V: [E.State.ID: E.Value] = [:]
        
            for state in environment.stateSpace {
                var value: E.Value = 0.0
                let action = policy.action(for: state)
                
                for outcome in environment.outcomeSpace(for: state, action: action as! E.Action) {
                    value += self.value(for: outcome, gamma: gamma)
                }
                
                V[state.id] = value
            }
            
            let didConverge = self.didConverge(V, theta: theta)
            self.bootstrap = V

            if verbose {
                print("#\(iteration): \(V.sorted { $0.key < $1.key }.map { String(format: "%.4f", $0.value) })")
            }
            
            if didConverge {
                print("converged!")
                break
            }
        
        }
    }
    
    private func value(for outcome: RLOutcome<E.State, E.Value>, gamma: E.Value) -> E.Value {
        let expected = outcome.done ? zero : (gamma * (self.bootstrap[outcome.next.id] ?? zero))
        return outcome.probability * (outcome.reward + expected)
    }
    
    private func didConverge(_ V: [E.State.ID: E.Value], theta: E.Value) -> Bool {
        let count: Int = bootstrap.count
        guard count > 0 else {
            return false
        }
        return zip(
            bootstrap.sorted { $0.key < $1.key },
            V.sorted { $0.key < $1.key }
        )
        .map { abs($0.value - $1.value) < theta }
        .filter { $0 }
        .count == count
    }
        
}
