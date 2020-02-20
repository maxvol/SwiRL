//: [Previous](@previous)

import Foundation
import SwiRL

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
func E_step(X: Matrix<Double>, pi: Matrix<Double>, mu: Matrix<Double>, sigma: Matrix<Double>) -> Matrix<Double> {
    let N = X.shape[0] // number of objects
    let C = pi.shape[0] // number of clusters
    let d = mu.shape[1] // dimension of each object
    let gamma = Matrix<Double>(0.0, shape: N, C) // distribution q(T)
    

    return gamma
}


var matrix = Matrix<Double>(0.0, shape: 10, 5, 2)
//print("\(matrix.count)")
matrix[7, 3, 1] = 6.9
print("\(matrix[7, 3, 1])")




//: [Next](@next)
