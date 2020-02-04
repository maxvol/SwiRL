//: [Previous](@previous)

import Foundation
import SwiRL

let bandit = Bandit(10, 0.1)

for i in 0..<100 {
    let reward = Double.random(in: 0.0...100.0)
    bandit.step(reward: reward)
}
bandit.N
bandit.Q

//: [Next](@next)
