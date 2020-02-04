//
//  Bernoulli.swift
//  SwiRL
//
//  Created by Maxim Volgin on 04/02/2020.
//

import Foundation

public struct Bernoulli { // TODO: implement `Distribution`
    
    public init() { }
    
    /** p(X|θ) = θᴺ¹(1 - θ)ᴺ⁰ */
    public func likelihood(θ: Double, N1: Double, N0: Double) -> Double { pow(θ, N1) * pow(1.0 - θ, N0) }
    
    public static func posterior(N1: Double, N0: Double, conjugatePrior: Beta) -> Distribution {
        Beta(N1 + conjugatePrior.a, N0 + conjugatePrior.b)
    }
    
}
