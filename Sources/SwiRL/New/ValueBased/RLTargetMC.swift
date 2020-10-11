//
//  RLTargetMC.swift
//  
//
//  Created by Maxim Volgin on 11/10/2020.
//

import Numerics
import Foundation

public struct RLTargetMC<State: RLState, Value: RLValue>: RLTarget {
    
    public let reward: [Value]
    public let discount: Value
    
    public init(reward: [Value], discount: Value) {
        self.reward = reward
        self.discount = discount
    }
    
    public func callAsFunction() -> Value {
//        RLTargetMC.expectedReturn(reward: reward, discount: discount)
        RLTargetMC.expectedReturnRecursive(reward: reward, discount: discount)
    }
    
    /**
        Monte Carlo estimated return for step `t`
     
        - Note: Gₜ = Rₜ₊₁ + 𝛄Rₜ₊₂ + 𝛄²Rₜ₊₃ + 𝛄³Rₜ₊₄ + ... + 𝛄ⁿRₙ
     
        - Parameters:
            - R: reward from step `t+1` onwards: Rₜ₊₁ + ... + Rₙ
            - 𝛄: discount
        - Returns: Ĝₜ
     */
//    public static func expectedReturn(reward R: [Value], discount 𝛄: Value) -> Value {
//        R
//        .enumerated()
//            .reduce(0.0) { (G, r) -> Value in
//            G + pow(𝛄, r.offset) * r.element
//        }
//    }
    
    /**
     Monte Carlo estimated return for step `t`
  
     - Remark: recursive version for reference only, performance is suboptimal
  
     - Note: Gₜ = Rₜ₊₁ + 𝛄Rₜ₊₂ + 𝛄²Rₜ₊₃ + 𝛄³Rₜ₊₄ + ... + 𝛄ⁿRₙ
     
     - Parameters:
         - R: reward from step `t+1` onwards: Rₜ₊₁ + ... + Rₙ
         - 𝛄: discount
     - Returns: Ĝₜ
     */
    public static func expectedReturnRecursive(reward R: [Value], discount 𝛄: Value) -> Value {
        var mutableR = R
        return mutableR.removeFirst() + 𝛄 * RLTargetMC.expectedReturnRecursive(reward: mutableR, discount: 𝛄)
    }
    
}
