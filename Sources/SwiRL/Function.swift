//
//  Function.swift
//  SwiRL
//
//  Created by Maxim Volgin on 25/02/2020.
//

import Foundation

public func softmax(h: [Double], i: Int) -> Double {
    let h_exp = h.map { exp($0) }
    return h_exp[i] / h_exp.reduce(0.0, +)
}

public func sigmoid(_ x: Double) -> Double { 1.0 / (1.0 + exp(-x)) }
public func σ(_ x: Double) -> Double { 1.0 / (1.0 + exp(-x)) }

public func sigmoidDerivative(_ x: Double) -> Double { sigmoid(x) * (1.0 - sigmoid(x)) }
public func σ_(_ x: Double) -> Double { sigmoid(x) * (1.0 - sigmoid(x)) }

public func softplus(_ x: Double) -> Double { ln(1.0 + exp(x)) }
public func softplusDerivative(_ x: Double) -> Double { exp(x) / (1.0 + exp(x)) }

public func ReLU(_ x: Double) -> Double { max(0, x) }

public func swish(_ x: Double) -> Double { x * sigmoid(x) }

public func tanh(_ x: Double) -> Double { (exp(x) - exp(-x)) / (exp(x) + exp(-x)) }
