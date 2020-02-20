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


var matrix = Matrix<Double>(0.0, shape: 10, 5, 2)
//print("\(matrix.count)")
matrix[7, 3, 1] = 6.9
print("\(matrix[7, 3, 1])")



//: [Next](@next)
