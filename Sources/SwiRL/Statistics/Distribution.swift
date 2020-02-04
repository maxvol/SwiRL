//
//  Distribution.swift
//  SwiRL
//
//  Created by Maxim Volgin on 04/02/2020.
//

import Foundation

public protocol Distribution {
    func PDF(_ x: Double) -> Double
    var mean: Double { get }
    var mode: Double { get }
    var variance: Double { get }
}

/**
*/
public struct Beta: Distribution {
    public let a: Double
    public let b: Double
    
    public init(_ a: Double, _ b: Double) {
        self.a = a
        self.b = b
        assert({ a > 0.0 && b > 0.0 }(), "a,b > 0")
    }
    
    /** not necesserily correct */
    public init(mean: Double, variance: Double) {
        let div = (1.0 - mean) / mean
        let mul = (1.0 - mean) * mean
        self.a = mean * (1.0 + mul / variance)
        self.b = self.a * div
        assert({ a > 0.0 && b > 0.0 }(), "a,b > 0")
    }
    
    /** 𝔼x = a/(a+b) */
    public var mean: Double { get { self.a / (self.a + self.b) } }
    
    /** Mode[x] = (a-1)/(a+b-2) */
    public var mode: Double { get { (self.a - 1.0) / (self.a + self.b - 2.0) } }
    
    /** Var[x] = ab/((a+b)²(a+b-1)) */
    public var variance: Double { get { self.a * self.b / (pow(self.a + self.b, 2.0) * (self.a + self.b - 1.0 )) } }
    
    /**
     Β(x|a,b) = xᵃ⁻¹(1-x)ᵇ⁻¹/Β(a,b)
     x ∊ [0,1]
     a,b > 0
     */
    public func PDF(_ x: Double) -> Double {
        assert({ x >= 0.0 && x <= 1.0 }(), "x ∊ [0,1]")
        return pow(x, a - 1) * pow(1 - x, b - 1) / Β(self.a, self.b)
    }
    
}

public struct Bernoulli {
    
    public init() { }
    
    /** p(X|θ) = θᴺ¹(1 - θ)ᴺ⁰ */
    public func likelihood(θ: Double, N1: Double, N0: Double) -> Double { pow(θ, N1) * pow(1.0 - θ, N0) }

    
}
