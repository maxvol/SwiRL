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

/**
 Β(xᵢ) = ∏𝚪(xᵢ)/∑𝚪(xᵢ)
*/
public func Β(_ x: Double...) -> Double {
    return ( ∏x.map { 𝚪($0) } ) / 𝚪(∑x)
}

/**
 Β(xᵢ) = ∏𝚪(xᵢ)/∑𝚪(xᵢ)
*/
public func Β(_ x: [Double]) -> Double {
    return ( ∏x.map { 𝚪($0) } ) / 𝚪(∑x)
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



//public func exponent(_ x: Double) -> Double { pow(Darwin.M_E, x) }
//public func e(_ x: Double) -> Double { pow(Darwin.M_E, x) }

public func ln(_ x: Double) -> Double { log(x) }


prefix operator ∑
public prefix func ∑ <S: Sequence>(values: S) -> S.Element where S.Element : Numeric & ExpressibleByIntegerLiteral {
    return values.reduce(0, +)
}

/** Cartesian product */
prefix operator ∏
public prefix func ∏ <S: Sequence>(values: S) -> S.Element where S.Element : Numeric & ExpressibleByIntegerLiteral {
    return values.reduce(1, *)
}
