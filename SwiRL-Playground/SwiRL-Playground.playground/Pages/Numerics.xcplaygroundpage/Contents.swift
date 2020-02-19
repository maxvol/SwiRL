//: [Previous](@previous)

// https://github.com/apple/swift-numerics/blob/master/Sources/Real/README.md

import Numerics
import Complex
import Real
let z = Complex<Double>.i

func sigmoid<T: Real>(_ x: T) -> T {
    1 / (1 + .exp(-x))
}

extension Real {
  // The real and imaginary parts of e^{-2πik/n}
  static func dftWeight(k: Int, n: Int) -> (r: Self, i: Self) {
    precondition(0 <= k && k < n, "k is out of range")
    guard let N = Self(exactly: n) else {
      preconditionFailure("n cannot be represented exactly.")
    }
    let theta = -2 * .pi * (Self(k) / N)
    return (r: .cos(theta), i: .sin(theta))
  }
}


//: [Next](@next)
