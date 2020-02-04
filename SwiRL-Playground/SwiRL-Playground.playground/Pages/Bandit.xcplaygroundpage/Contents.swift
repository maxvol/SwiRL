//: [Previous](@previous)

import Foundation
import SwiRL

let bandit = Bandit(5, 0.1)
let arms: [Distribution] = [
    Normal(6, 10),
    Gamma(18, 3),
    Gamma(2, 2),
    Normal(0.1, 0.1),
    Gamma(3, 1)
]
let state = RLState(0, isTerminal: false)

for i in 0..<10000 {
    let x = Double.random(in: 0.0...100.0)
    if let k = bandit.last.action {
        let reward = arms[k - 1].PDF(x)
        bandit.step(reward: reward, state: state)
    } else {
        bandit.step(reward: 0.0, state: state)
    }
    bandit.N
    bandit.Q
}
bandit.N
bandit.Q

//: [Next](@next)
