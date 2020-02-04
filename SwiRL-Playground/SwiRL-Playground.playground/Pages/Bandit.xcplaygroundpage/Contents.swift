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
let steps = 5000
var frames: [[Action: Int]] = Array(repeating: [:], count: steps)
for i in 0..<steps {
    let x = Double.random(in: 0.0...100.0)
    if let k = bandit.last.action {
        let reward = arms[k - 1].PDF(x)
        bandit.step(reward: reward, state: state)
    } else {
        bandit.step(reward: 0.0, state: state)
    }
    frames[i] = bandit.N
}
bandit.Q
let optimal = argmax(bandit.Q)!
let percent = 100.0 * Double(bandit.N[optimal]!) / Double(steps)
for frame in frames {
    let percent = 100.0 * Double(frame[optimal]!) / Double(steps)
    percent
}

//: [Next](@next)
