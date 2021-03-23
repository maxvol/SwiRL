//
//  MDP.swift
//  
//
//  Created by Maxim Volgin on 22/03/2021.
//

import Foundation

public protocol Transition: Edge {
    associatedtype Value: RLValue
    
    var probability: Value { get }
}

public protocol RLTransition: Transition {
    associatedtype Value: RLValue
    
    var reward: Value { get }
}

//public struct RLTransition<Value: RLValue>: Transition {
//    public typealias ID = <#type#>
//
//    let reward: Value
//}

public protocol MDP: Graph {
    
}

protocol RLMDP {
    
//    func transition(state: RLState, action: RLAction) -> RLState
//
//    func reward(state: RLState, action: RLAction) -> RLReward

//    func T(_ obs: RLObservation, _ action: RLAction, _ nextObs: RLObservation) -> RLValue
//    func R(_ obs: RLObservation, _ action: RLAction?, _ nextObs: RLObservation?) -> RLValue

}


/*
class MDP {
//    let S: RLState
//    let A: RLAction
//    let T: RLTransition
//    let R: RLReward
//    let S₀: RLState
//    let 𝛄: RLCoefficient
//    let H: Int
}

class POMDP: MDP {
//    let O: RLObservation
//    let E: RLProbability // emission probability of O given S
}
*/
