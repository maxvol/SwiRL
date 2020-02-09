//
//  AR-Net.swift
//  SwiRL
//
//  Created by Maxim Volgin on 09/02/2020.
//

import Foundation

public struct ARNet {
    let L = MSE
    
    static let s = 1.0
    static let c = 1.0
    static let c₁ = 3.0 // for normalized data and coeff within [0,1]
    static let c₂ = 3.0 // for normalized data and coeff within [0,1]
    
    static let p = 12 // TEMP
    var θ: [Double] = Array.init(repeating: Double.random(in: 0...1), count: ARNet.p)
    
    var λ: Double { get { ARNet.c * (1.0 - ARNet.s) / ARNet.s } }
    
    /**
     regularization term
     */
    var R: Double { get { ∑self.θ.map { θ in 2 * σ(ARNet.c₁ * pow(abs(θ), 1.0 / ARNet.c₂)) - 1.0} / Double(ARNet.p) } }
    
    /**
     L(y,ŷ,θ) + λ(s) * R(θ)
     */
    func cost(_ y: [Double], _ ŷ: [Double]) -> Double {
        assert(y.count == ŷ.count && ŷ.count == self.θ.count, "all lengths must be same as θ's")
        return L(y, ŷ) + self.λ * self.R
    }
    
}
