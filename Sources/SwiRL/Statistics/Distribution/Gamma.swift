//
//  Gamma.swift
//  SwiRL
//
//  Created by Maxim Volgin on 04/02/2020.
//

import Foundation

public struct Gamma: Distribution {
    public let a: Double
    public let b: Double
    
    public init(_ a: Double, _ b: Double) {
        self.a = a
        self.b = b
        assert(a > 0.0 && b > 0.0, "a,b > 0")
    }
    
    /** not necesserily correct */
//    public init(mean: Double, variance: Double) {
//        let div = (1.0 - mean) / mean
//        let mul = (1.0 - mean) * mean
//        self.a = mean * (1.0 + mul / variance)
//        self.b = self.a * div
//        assert({ a > 0.0 && b > 0.0 }(), "a,b > 0")
//    }
    
    /** 𝔼[x] = a/b */
    public var mean: Double { get { self.a / self.b } }
    
    /** Mode[x] = (a-1)/b*/
    public var mode: Double { get { (self.a - 1.0) / self.b } }
    
    /** Var[x] = a/b² */
    public var variance: Double { get { self.a / pow(self.b, 2.0) } }
    
    /**
     */
    public func PDF(_ x: Double) -> Double {
        assert(x > 0.0, "x > 0")
        return exp(-self.b * x) * pow(x, self.a - 1.0) * pow(self.b, self.a) / 𝚪(self.a)
    }
    
}

