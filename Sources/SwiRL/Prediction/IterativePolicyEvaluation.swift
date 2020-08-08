//
//  IterativePolicyEvaluation.swift
//  
//
//  Created by Maxim Volgin on 08/08/2020.
//

import Foundation


typealias RLState1 = Int
typealias RLValue = Float

protocol RLAction1 {
    associatedtype Item
}

protocol RLPolicy1 {
    associatedtype A: RLAction1
    
    func action(for state: RLState1) -> A
}

struct RLOutcome {
    let probability: RLValue
    let next: RLState1
    let reward: RLValue
    let done: Bool
}

//typealias RLActionToOutcome = [RLAction1: [RLOutcome]]
//typealias RLStateToActionToOutcome = [RLState1: RLActionToOutcome]
//
//struct RLModel {
//    let P: RLStateToActionToOutcome = [:]
//}

protocol RLEnvironment1 {
    associatedtype A: RLAction1
    
    var stateSpace: [RLState1] { get }
//    func actionSpace(for state: RLState1) -> [RLAction1]
    func outcomeSpace(for state: RLState1, action: A) -> [RLOutcome]
}

struct IterativePolicyEvaluation<E: RLEnvironment1, P: RLPolicy1> where E.A == P.A {
    
    // policy_evaluation(pi, P, gamma=1.0, theta=1e-10)
    //  for s in range(len(P)):
    //      for prob, next, reward, done in P[s][pi(s)]:
    //
    // P -> [state]
    // pi(s) -> a
    // P[s] -> A(s)
    // P[s][a] -> [prob, next, reward, done] // len(p,n,r,d) = len(A(s))

    
    func evaluate(environment: E, policy: P, gamma: RLValue = 1.0, theta: RLValue = 1e-10) {
        //
        for state in environment.stateSpace {
            //
            let action = policy.action(for: state)
            for outcome in environment.outcomeSpace(for: state, action: action) {
                
            }
            
        }
        
    }
    
    
}
