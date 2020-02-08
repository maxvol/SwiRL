//
//  Dirichlet.swift
//  SwiRL
//
//  Created by Maxim Volgin on 08/02/2020.
//

import Foundation

public struct Dirichlet { // : Distribution {
    public let α: [Double]

    public init(_ α: [Double], _ θ: Double...) {
        assert(α.filter { $0 <= 0.0 }.count == 0, "α > 0")
        self.α = α
    }

//    /** 𝔼[x] = p */
//    public var mean: Double { get { self.p } }
//
//    /** Mode[x] =  */
//    public var mode: Double { get { 0.0 } } // TODO: implement
//
//    /** Var[x] = p (1 - p)  */
//    public var variance: Double { get { self.p * (1.0 - self.p) } }

    /**
     */
    public func PDF(_ θ: Double...) -> Double {
        assert(θ.count == self.α.count, "x count = \(self.α.count)")
        assert(θ.filter { $0 < 0.0 }.count == 0, "θ >= 0")
        assert(θ.reduce(0,+) == 1.0, "∑θ = 1")
        let α₀ = ∑self.α
        let α₊ = [α₀] + self.α
        let product: Array<Double> = zip(θ, α₊).map { pair in
                let (x, α) = pair
                return pow(x, α)
            }
        return ( ∏product ) / Β(self.α)
    }

}
