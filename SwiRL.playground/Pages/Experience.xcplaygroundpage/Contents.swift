//: [Previous](@previous)

import Foundation
import SwiRL

enum A1: Int, RLAction1 {
    case one
    case two
}

let trajectory = [
    RLExperience<A1>(state: 0, action: .one, reward: 0.4, next: 1),
    RLExperience<A1>(state: 0, action: .two, reward: 0.8, next: 1),
]

let trajectory1 = [
    RLExperience1<A1>(Sₜ: 0, Aₜ: .one, Rₜ₊₁: 0.4, Sₜ₊₁: 1),
    RLExperience1<A1>(Sₜ: 0, Aₜ: .one, Rₜ₊₁: 0.8, Sₜ₊₁: 1),
]

print(G(trajectory: trajectory))
print(G(trajectory: trajectory1))
print(G(trajectory: trajectory, gamma: 0.5))
print(G(trajectory: trajectory1, gamma: 0.5))

//: [Next](@next)
