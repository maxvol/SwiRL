//: [Previous](@previous)

import Foundation
import SwiRL
import GameplayKit

//https://developer.apple.com/documentation/gameplaykit/gkgaussiandistribution

let random = GKRandomSource()
let dice3d6 = GKGaussianDistribution(randomSource: random, lowestValue: 3, highestValue: 18)
// Roll the dice...
let diceRoll = dice3d6.nextInt()

let a = MonteCarlo.discrete(0.6, 0.1, 0.3)


let letters = "abracadabra"
let letterCount = letters.reduce(into: [:]) { counts, letter in
    counts[letter, default: 0] += 1
}
// letterCount == ["a": 5, "b": 2, "r": 2, "c": 1, "d": 1]


//: [Next](@next)
