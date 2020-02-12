//
//  AR-Net.swift
//  SwiRL
//
//  Created by Maxim Volgin on 09/02/2020.
//

import Foundation

/**
 rand coeff, ∑|w| <= 1, + rand normal noise sd=1
 data must be normalized!
 */
public struct ARNet {
    
    public init() {}
    
    let L = MSE
    
    /**
     estimated or desired sparsity
     s = p̂ / p
     where p̂ - order of data, p - order of model
     */
    static let s = 1.0
    
    /**
    approx. SD_of_noise / 100
     */
    static let c = 1.0
    static let c₁ = 3.0 // for normalized data and coeff within [0,1]
    static let c₂ = 3.0 // for normalized data and coeff within [0,1]
    
    /** AR order, i.e. amoount of coefficients/weights and lags */
    public static let p = 6 // TEMP
    public var θ: [Double] = Array.init(repeating: Double.random(in: 0...1), count: ARNet.p)
    
    public var λ: Double { get { ARNet.c * (1.0 - ARNet.s) / ARNet.s } }
    
    /**
     regularization term
     */
    public var R: Double { get { ∑self.θ.map { θ in 2 * σ(ARNet.c₁ * pow(abs(θ), 1.0 / ARNet.c₂)) - 1.0} / Double(ARNet.p) } }
    
    public func ŷ(_ x: [Double]) -> [Double]  {
//        assert(x.count == self.θ.count, "length must be same as θ's")
        return zip(x, self.θ).map { (x, θ) in θ * x }
    }
    
    /**
     L(y,ŷ,θ) + λ(s) * R(θ)
     */
    public func J(_ x: [Double], _ y: [Double]) -> Double {
        assert(x.count == y.count && y.count == self.θ.count, "all lengths must be same as θ's")
        return L(y, zip(x, self.θ).map { (x, θ) in x * θ } ) + self.λ * self.R
    }
    
    /**
     x - lags from t-1 to t-p
     */
    public func predict(_ x: [Double]) -> Double {
//        assert(x.count == self.θ.count, "length must be same as θ's")
        return ∑ŷ(x)
    }
    
    func dx(_ x: Double) -> Double { x } // TEMP
    
    // updates theta by taking n gradient steps with learning rate α
    public mutating func gd(_ x: [Double], _ y: [Double], _ α: Double, _ n: Int) -> [Double] {
        assert(x.count == self.θ.count, "length must be same as θ's")
        let m = y.count // number of training examples
        var J_history: [Double] = Array.init(repeating: 0, count: n)
        for i in 0..<n {
            let θ = zip(zip(x, y), self.θ).map { (arg: ((Double, Double), Double)) -> Double in
                let (arg0, θ) = arg
                let (x, y) = arg0
                return θ - α * dx(x) * (x * θ - y) / Double(m)
            }
            for p in 0..<θ.count {
                self.θ[p] = θ[p]
            }
            J_history[i] = self.J(x, y)
        }
        return J_history
    }
    
    
}
