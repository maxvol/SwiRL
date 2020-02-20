//
//  EM.swift
//  SwiRL
//
//  Created by Maxim Volgin on 20/02/2020.
//

import Foundation

/**
Z - hidden var
X - observerd var
*/

// Jensen' inequality
// f(E[X]) <= E[f(X)]

// VLB / ELBO
// log p(X) = Eq[log p(X, Z)] + H[Z]

// H - Shannon entropy
// H[Z] = -Eq[log q(Z)]

// L - lower bound of the log probability of observations
// L = Eq[log p(X,Z)] + H[Z]

// KL[q(Z)||p(Z|X)] = -L + log p(X)
// L = log p(X) - KL[q(Z)||p(Z|X)]

// KL >= 0
// L <= log p(X)


public struct EM_GMM {
    
    public init() {}

    /**
        Performs E-step on GMM model
        Each input is numpy array:
        X: (N x d), data points
        pi: (C), mixture component weights
        mu: (C x d), mixture component means
        sigma: (C x d x d), mixture component covariance matrices

        Returns:
        gamma: (N x C), probabilities of clusters for objects
    */
    public func E_step(X: Matrix<Double>, pi: Matrix<Double>, mu: Matrix<Double>, sigma: Matrix<Double>) -> Matrix<Double> {
        let N = X.shape[0] // number of objects
        let C = pi.shape[0] // number of clusters
        let d = mu.shape[1] // dimension of each object
        var gamma = Matrix<Double>(0.0, shape: N, C) // distribution q(T)
        
        for c in 0..<C {
            // g_c = multivariate_normal(mu[c],sigma[c])
            for n in 0..<N {
                //pdf = g_c.pdf(X[n])
                let pdf = 1.0 // TODO: implement mvn pdf
                gamma[n, c] = pi[c] * pdf
            }
        }
        
        // TODO:  normalize
        
        return gamma
    }

}
