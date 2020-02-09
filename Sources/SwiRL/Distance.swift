//
//  Distance.swift.swift
//  SwiRL
//
//  Created by Maxim Volgin on 09/02/2020.
//

import Foundation

public func MSE(_ y: [Double], _ ŷ: [Double]) -> Double {
    assert(y.count == ŷ.count, "length must be same")
    return ∑zip(y, ŷ).map { (y, ŷ) in pow(y - ŷ, 2) } / Double(ŷ.count)
}
