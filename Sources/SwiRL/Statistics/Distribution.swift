//
//  Distribution.swift
//  SwiRL
//
//  Created by Maxim Volgin on 04/02/2020.
//

import Foundation

public protocol Distribution {
    func PDF(_ x: Double) -> Double
    var mode: Double { get }
    var mean: Double { get }
    var variance: Double { get }
}

