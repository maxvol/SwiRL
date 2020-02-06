//
//  GMM.swift
//  SwiRL
//
//  Created by Maxim Volgin on 06/02/2020.
//

import Foundation

/**
  Gaussian Mixture Model
 */
public struct GMM {    
    public let πN: [(Double, Normal)]
    
    public init(_ πN: (Double, Normal)...) {
        self.πN = πN
    }
    
    public func PDF(_ x: Double) -> Double {
        ∑self.πN.map { $0.0 * $0.1.PDF(x) }
    }
}
