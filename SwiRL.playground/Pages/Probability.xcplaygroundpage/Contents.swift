//: [Previous](@previous)

import Foundation
import SwiRL

Probability.conditional(joint: 0.25, marginal: 0.4)

Probability.bayes(joint: 0.25, evidence: 0.4)

Probability.bayes(likelihood: 0.25, prior: 0.5, evidence: 0.4)



odds(probability: 0.5)
probability(odds: 1.0)
probability(odds: 0.5)
logit(probability: 0.001)
logit(probability: 0.999)

//: [Next](@next)
