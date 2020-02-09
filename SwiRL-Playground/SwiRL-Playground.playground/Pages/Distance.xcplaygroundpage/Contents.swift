//: [Previous](@previous)

import Foundation
import SwiRL

let y = [1.0, 2.0, 3.0]
let ŷ = [1.5, 2.5, 3.5]
let mse = MSE(y, ŷ)

let arnet = ARNet()
let x = Array.init(repeating: Double.random(in: 0...1), count: ARNet.p)
let p = arnet.predict(x)



//: [Next](@next)
