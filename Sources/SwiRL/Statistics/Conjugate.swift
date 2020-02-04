//
//  Conjugate.swift
//  SwiRL
//
//  Created by Maxim Volgin on 04/02/2020.
//

import Foundation

struct Conjugate {
    
    public static func bernoulliLikelihoodBetaPrior(N1: Double, N0: Double, a: Double, b: Double) -> Distribution {
        Beta(N1 + a, N0 + b)
    }
    
}
