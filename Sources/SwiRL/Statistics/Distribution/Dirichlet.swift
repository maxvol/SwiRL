//
//  Dirichlet.swift
//  SwiRL
//
//  Created by Maxim Volgin on 08/02/2020.
//

import Foundation

public struct Dirichlet { // : Distribution {
    public let α: [Double]
    public let θ: [Double]

    public init(_ α: [Double], _ θ: Double...) {
        assert(θ.filter { $0 < 0.0 }.count == 0, "θ >= 0")
        assert(θ.reduce(0,+) == 1.0, "∑θ = 1")
        self.α = α
        self.θ = θ
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
//    public func PDF(_ x: Double) -> Double {
////        assert(x >= 0.0 && x <= 1.0, "x ∊ [0,1]")
//        return ∏ zip(self.θ, self.α).map { pair in let (θ, α) = pair; pow(θ, α) } / B(self.α)
//    }

}
