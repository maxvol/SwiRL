//
//  MonteCarlo.swift
//  SwiRL
//
//  Created by Maxim Volgin on 08/02/2020.
//

import Foundation

public struct MonteCarlo {
    
    public static func discrete(_ p: Double...) -> Int {
        assert(p.reduce(0,+) == 1.0, "∑p = 1")
        var lower = 0.0
        var r: [Range<Double>] = Array<Range>()
        for p in p {
            let upper = lower + p
            r.append(lower..<upper)
            lower = upper
        }
        let sample = Double.random(in: 0..<1)
        for (i, r) in r.enumerated() {
            if r ~= sample {
                return i
            }
        }
        return -1
    }
}
