//
//  RLSpace.swift
//  
//
//  Created by Maxim Volgin on 24/09/2021.
//

import Foundation

public enum RLSpace<T: Comparable> {
    case scalar(ClosedRange<T>)
    case vector([ClosedRange<T>])
}

public extension RLSpace {
    var dimensionCount: Int {
        if case .vector(let array) = self {
            return array.count
        }
        return 1
    }
}
