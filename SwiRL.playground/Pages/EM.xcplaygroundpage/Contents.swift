//: [Previous](@previous)

import Foundation
import SwiRL

let emGMM = EM_GMM()

let X = Matrix<Double>(0.0, shape: 10, 2) // data points
let pi = Matrix<Double>(0.0, shape: 3) // mixture component weights
let mu = Matrix<Double>(0.0, shape: 3, 2) // mixture component means
let sigma = Matrix<Double>(0.0, shape: 3, 2, 2) // mixture component covariance matrices
let gamma = emGMM.E_step(X: X, pi: pi, mu: mu, sigma: sigma)
gamma


//: [Next](@next)
