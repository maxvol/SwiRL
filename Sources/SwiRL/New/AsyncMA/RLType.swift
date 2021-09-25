//
//  File.swift
//  
//
//  Created by Maxim Volgin on 24/09/2021.
//

import Foundation

public enum RLType<T: Comparable> {
    case scalar(T)
    case vector([T])
}

public extension RLType {
    var dimensionCount: Int {
        if case .vector(let array) = self {
            return array.count
        }
        return 1
    }
}
