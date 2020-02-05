//: [Previous](@previous)

import Foundation
import SwiRL

let bernoulli = Bernoulli()
bernoulli.likelihood(θ: 0.5, N1: 5, N0: 5)

let d = [ 1: 4, 2: 7, 3: 7, 4: 2 ]
argmax(d)

odds(probability: 0.5)
probability(odds: 1.0)
probability(odds: 0.5)

/* TODO: Swift 5.2
import Numerics
import Complex
import Real
// let z = Complex<Double>.i

func logit(probability p: Double) -> Double { Double.log(odds(probability: p)) }


logit(probability: 0.001)
logit(probability: 0.999)
*/


𝚪(1)
Β(1,2)

let beta2_2 = Beta(2, 2)
beta2_2.mean
let beta1_1 = Beta(1, 1)
let beta01_01 = Beta(0.1, 0.1)
let beta2_3 = Beta(2, 3)
let beta8_4 = Beta(8, 4)
let gamma18_3 = Gamma(18, 3)
let gamma1_1 = Gamma(1, 1)
let normal3_3 = Normal(3, 3)
let normal2_1 = Normal(2, 1)

beta8_4.mean

for x in stride(from: 0.0, through: 1.0, by: 0.05) {
    beta2_2.PDF(x)
    beta1_1.PDF(x)
    beta01_01.PDF(x)
    beta2_3.PDF(x)
    beta8_4.PDF(x)
}

for x in stride(from: 0.01, through: 10.0, by: 0.05) {
    gamma18_3.PDF(x)
    gamma1_1.PDF(x)
}

for x in stride(from: 0.0, through: 10.0, by: 0.05) {
    normal3_3.PDF(x)
    normal2_1.PDF(x)
}

let beta_ = Beta(mean: 0.8, variance: 0.01)
beta_.a
beta_.b
beta_.mean
beta_.variance

for x in stride(from: -10, through: 10.0, by: 0.05) {
    sigmoid(x)
    sigmoidDerivative(x)
}

//: [Next](@next)
