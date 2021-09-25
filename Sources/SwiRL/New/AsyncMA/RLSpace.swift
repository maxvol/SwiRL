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

public extension RLSpace where T: Strideable, T.Stride: SignedInteger {
    func random() -> RLType<T> {
        switch self {
        case .scalar(let range):
            return .scalar(range.randomElement()!)
        case .vector(let array):
            return .vector(array.map { range in range.randomElement()! })
        }
    }
}

public extension RLSpace where T == Double {
    func random() -> RLType<T> {
        switch self {
        case .scalar(let range):
            return .scalar(T.random(in: range))
        case .vector(let array):
            return .vector(array.map { range in T.random(in: range) })
        }
    }
}

public extension RLSpace where T == Float {
    func random() -> RLType<T> {
        switch self {
        case .scalar(let range):
            return .scalar(T.random(in: range))
        case .vector(let array):
            return .vector(array.map { range in T.random(in: range) })
        }
    }
}

public extension RLSpace where T == Int {
    func random() -> RLType<T> {
        switch self {
        case .scalar(let range):
            return .scalar(T.random(in: range))
        case .vector(let array):
            return .vector(array.map { range in T.random(in: range) })
        }
    }
}

