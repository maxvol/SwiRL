//
//  RLMDP.swift
//  
//
//  Created by Maxim Volgin on 22/03/2021.
//

import Foundation


public protocol RLMDP: Graph where V: RLObservation, E: RLTransition {
    associatedtype A: RLAction where A.ID == E.Action.ID

//    func probability(from: V.ID, via: A.ID, to: V.ID) -> E.Value
//    func reward(from: V.ID, via: A.ID, to: V.ID) -> E.Value
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
