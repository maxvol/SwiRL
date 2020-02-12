//
//  Probability.swift
//  SwiRL
//
//  Created by Maxim Volgin on 05/02/2020.
//

import Foundation

/**
 Probability Mass Function (discrete X)
 */
public func PMF(_ x: Double) -> Double { 0.0 } // TODO

/**
 Probability Density Function (continuous X)
 */
public func PDF(_ x: Double) -> Double { 0.0 } // TODO

public func odds(probability p: Double) -> Double { p / (1.0 - p) }
public func probability(odds o: Double) -> Double { o / (1.0 + o) }

public func logit(probability p: Double) -> Double { log(odds(probability: p)) }

public func softmax(_ value: Double, _ array: [Double]) -> Double {
    guard let max = array.max() else {
        return exp(value) / exp(array.reduce(0, +))
    }    
    return exp(value - max) / exp(array.map { $0 - max }.reduce(0, +))
}

public struct Probability {
    
    // MARK: Joint: P(X,Y) = P(X) * P(Y)

    /**
     P(X,Y) = P(X) * P(Y)
     joint = product of marginals
     (if independent)
     */
    public static func joint(marginals: Double...) -> Double { ∏marginals }

    // MARK: Conditional: P(X|Y) = P(X,Y) / P(Y)
    
    /**
     P(X|Y) = P(X,Y) / P(Y)
     conditional = joint / marginal
     = P(X) if independent, i.e. if P(X,Y) = P(X) * P(Y)
     */
    public static func conditional(joint xAndY: @autoclosure () -> Double, marginal pY: @autoclosure () -> Double) -> Double {
        xAndY() / pY()
    }
    
    // MARK: Chain rule: P(X,Y) = P(X|Y) * P(Y) or P(X,Y,Z) = P(X|Y,Z) * P(Y|Z) * P(Z) or P(X₁, ... Xn) = ∏ P(Xᵢ|X₁, ... Xᵢ₋₁)

    /**
     P(X,Y) = P(X|Y) * P(Y)
     P(X,Y,Z) = P(X|Y,Z) * P(Y|Z) * P(Z)
     P(X₁, ... Xn) = ∏ P(Xi|X₁, ... Xᵢ₋₁)
     joint = conditional * marginal
     */
    public static func chain(conditional xGivenY: @autoclosure () -> Double, marginal pY: @autoclosure () -> Double) -> Double {
        xGivenY() * pY()
    }

    /**
     p(X) = ∫ p(X,Y) dY
     marginal = ∫ joint by y
     summation rule
     */
    
    // MARK: On-line Bayes: Pᵢ(Θ) = P(Θ|Xᵢ) = P(Xᵢ|Θ) * Pᵢ₋₁(Θ) / P(Xᵢ)
    // MARK: Bayes: P(Θ|X) = P(X|Θ) * P(Θ) / P(X)
    
    /**
     P(Θ|X) = P(X|Θ) * P(Θ) / P(X)
     Θ - parameter
     X - observation
     - Parameters:
         - likelihood: P(X|Θ)
         - prior: P(Θ)
         - evidence:P(X)
     - Returns: P(Θ|X)
     */
    public static func bayes(likelihood xGivenΘ: @autoclosure () -> Double, prior pΘ: @autoclosure () -> Double, evidence pX: @autoclosure () -> Double) -> Double {
        xGivenΘ() * pΘ() / pX()
    }

    /**
     P(Θ|X) = P(X,Θ) / P(X)
     Θ - parameter
     X - observation
     
     - Parameters:
        - joint: P(X,Θ)
        - evidence:P(X)
     - Returns: P(Θ|X)
     */
    public static func bayes(joint xAndΘ: @autoclosure () -> Double, evidence pX: @autoclosure () -> Double) -> Double {
        xAndΘ() / pX()
    }
    
    
    // MLE: Â = argmaxₐP(X|A)
    
}


