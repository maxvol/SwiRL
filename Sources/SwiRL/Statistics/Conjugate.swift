//
//  Conjugate.swift
//  SwiRL
//
//  Created by Maxim Volgin on 04/02/2020.
//

import Foundation

struct Conjugate {
    
    public static func bernoulliLikelihoodBetaPrior(N1: Double, N0: Double, prior: Beta) -> Distribution {
        Beta(N1 + prior.a, N0 + prior.b)
    }
    
}
