//: [Previous](@previous)

import Foundation
import SwiRL

let a = MonteCarlo.discrete(0.6, 0.1, 0.3)


let letters = "abracadabra"
let letterCount = letters.reduce(into: [:]) { counts, letter in
    counts[letter, default: 0] += 1
}
// letterCount == ["a": 5, "b": 2, "r": 2, "c": 1, "d": 1]


//: [Next](@next)
