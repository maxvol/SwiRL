//
//  Math.swift
//  
//
//  Created by Maxim Volgin on 20/02/2020.
//

import Foundation

// https://github.com/apple/swift-evolution/blob/master/proposals/0253-callable.md

/// Represents a polynomial function, e.g. `2 + 3x + 4x²`.
public struct Polynomial<T: Numeric> {
    /// Represents the coefficients of the polynomial, starting from power zero.
    let coefficients: [T]
    public init(_ coefficients: T...) {
        self.coefficients = coefficients
    }
}

public extension Polynomial where T == Double {
    func callAsFunction(_ input: T) -> T {
        var result: T = 0
        for (i, c) in coefficients.enumerated() {
            result += c * pow(input, Double(i))
        }
        return result
    }
}

//struct Perceptron {
//    var weight: Vector<Float>
//    var bias: Float
//
//    func callAsFunction(_ input: Vector<Float>) -> Float {
//        return weight • input + bias
//    }
//}
