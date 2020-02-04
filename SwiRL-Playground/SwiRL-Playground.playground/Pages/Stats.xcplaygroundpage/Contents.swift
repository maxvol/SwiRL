//: [Previous](@previous)

func odds(probability p: Double) -> Double { p / (1.0 - p) }
func probability(odds o: Double) -> Double { o / (1.0 + o) }

func bayes(likelihood: () -> Double, prior: () -> Double, evidence: () -> Double) -> Double { (likelihood() * prior()) / evidence() }

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

//: [Next](@next)
