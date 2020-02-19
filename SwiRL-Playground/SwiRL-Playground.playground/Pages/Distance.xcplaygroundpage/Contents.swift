//: [Previous](@previous)

import Foundation
import SwiRL

let y = [1.0, 2.0, 3.0, 1.0, 2.0, 3.0, 1.5, 2.5, 3.5, 2.0, 3.0, 1.0]
let ŷ = [1.5, 2.5, 3.5, 1.0, 2.0, 3.0, 1.0, 2.0, 3.0, 1.0, 2.0, 3.0]
let mse = MSE(y, ŷ)

let θ = [0.2, 0.3, -0.5] // p = 3
let seed = [0.7, -0.2, 0.8]
var ts = seed
for i in 0..<20 {
    let y = ∑zip(θ, ts).map { (θ, x) in θ * x }
    ts.insert(y, at: 0)
}
for y in ts {
    y
}

var arnet = ARNet()

var (head, slice) = arnet.sample(ts) ?? (0, [])
head
slice
print(head)
print(slice)
(head, slice) = arnet.sample(ts, 1) ?? (0, [])
print(head)
print(slice)

let x = Array.init(repeating: Double.random(in: 0...1), count: ARNet.p)
let J_history = arnet.gd(y, ŷ, 0.1, 100)
for i in 0..<100 {
    J_history[i]
}
let p = arnet.predict(x)
arnet.θ




//: [Next](@next)
