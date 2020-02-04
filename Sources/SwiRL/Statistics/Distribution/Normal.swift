//
//  Normal.swift
//  SwiRL
//
//  Created by Maxim Volgin on 04/02/2020.
//

import Foundation

public struct Normal: Distribution {
    public private(set) var mean: Double
    public private(set) var variance: Double
    
    public var mode: Double { get { 0.0 } } // TODO

    public init(mean: Double, variance: Double) {
        self.mean = mean
        self.variance = variance
//        assert({ a > 0.0 && b > 0.0 }(), "a,b > 0")
    }
    
    public func PDF(_ x: Double) -> Double {
//        assert({ x >= 0.0 && x <= 1.0 }(), "x ∊ [0,1]")
        let doubleVariance = 2.0 * self.variance
        let const = 1.0 / sqrt(Double.pi * doubleVariance)
        let parabola = pow(x - self.mean, 2.0) / doubleVariance
        return const * e(-parabola)
    }
}