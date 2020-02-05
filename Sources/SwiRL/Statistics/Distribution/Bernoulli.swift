//
//  Bernoulli.swift
//  SwiRL
//
//  Created by Maxim Volgin on 04/02/2020.
//

import Foundation

public struct Bernoulli: Distribution {
    public let p: Double
    
    public init(_ p: Double) {
        self.p = p
        assert(p > 0.0, "p > 0")
    }
    
    /** 𝔼[x] = p */
    public var mean: Double { get { self.p } }
    
    /** Mode[x] =  */
    public var mode: Double { get { 0.0 } } // TODO: implement
    
    /** Var[x] = p (1 - p)  */
    public var variance: Double { get { self.p * (1.0 - self.p) } }
    
    /**
     */
    public func PDF(_ x: Double) -> Double {
        assert(x >= 0.0 && x <= 1.0, "x ∊ [0,1]")
        return pow(self.p, x) * pow(1.0 - self.p, 1.0 - x)
    }
    
    /** p(X|θ) = θᴺ¹(1 - θ)ᴺ⁰ */
    public func likelihood(θ: Double, N1: Double, N0: Double) -> Double { pow(θ, N1) * pow(1.0 - θ, N0) }
    
    public static func posterior(N1: Double, N0: Double, conjugatePrior: Beta) -> Distribution {
        Beta(N1 + conjugatePrior.a, N0 + conjugatePrior.b)
    }
    
}
