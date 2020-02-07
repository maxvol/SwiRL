//
//  Statistics.swift
//  SwiRL
//
//  Created by Maxim Volgin on 04/02/2020.
//

import Foundation

/**
 𝚪 = (n-1)!
 */
public func 𝚪(_ n: Double) -> Double {
  return tgamma(n) // Foundation
}

/** ɣ = 1/σ² */
public func precision(variance: Double) -> Double { 1.0 / variance }

/**
 Β(a,b) = 𝚪(a)𝚪(b)/𝚪(a+b)
*/
public func Β(_ a: Double, _ b: Double) -> Double {
  return 𝚪(a)*𝚪(b)/𝚪(a+b)
}

//The lgamma* functions are the logarithms of the gamma function. For the gamma function, use tgamma, tgammaf, or tgammal
//double tgamma (double x)  
//float tgammaf (float x)
//long double tgammal (long double x)

public func argmax<Key, Value>(_ dictionary: Dictionary<Key, Value>) -> Key? where Key : Hashable, Value: Comparable {
    guard let max = dictionary.max(by: { lhs, rhs in lhs.value < rhs.value }) else { return nil }
    let ties = dictionary.filter { element in element.value == max.value }
    guard let random = ties.randomElement() else { return nil }
    return random.key
}

public func softmax(h: [Double], i: Int) -> Double {
    let h_exp = h.map { exp($0) }
    return h_exp[i] / h_exp.reduce(0.0, +)
}

//public func exponent(_ x: Double) -> Double { pow(Darwin.M_E, x) }
//public func e(_ x: Double) -> Double { pow(Darwin.M_E, x) }

public func ln(_ x: Double) -> Double { log(x) }

public func sigmoid(_ x: Double) -> Double { 1.0 / (1.0 + exp(-x)) }
public func σ(_ x: Double) -> Double { 1.0 / (1.0 + exp(-x)) }

public func sigmoidDerivative(_ x: Double) -> Double { sigmoid(x) * (1.0 - sigmoid(x)) }
public func σ_(_ x: Double) -> Double { sigmoid(x) * (1.0 - sigmoid(x)) }

prefix operator ∑
public prefix func ∑ <S: Sequence>(values: S) -> S.Element where S.Element : Numeric & ExpressibleByIntegerLiteral {
    return values.reduce(0, +)
}

/** Cartesian product */
prefix operator ∏
public prefix func ∏ <S: Sequence>(values: S) -> S.Element where S.Element : Numeric & ExpressibleByIntegerLiteral {
    return values.reduce(1, *)
}
