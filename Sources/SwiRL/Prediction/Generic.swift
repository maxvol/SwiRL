//
//  File.swift
//  
//
//  Created by Maxim Volgin on 09/08/2020.
//

import Foundation

public typealias RLState1 = Int
public typealias RLValue = Float

public protocol RLAction1 {
    var rawValue: Int { get }
    init?(rawValue: Int)
}

public protocol RLPolicy1 {
    associatedtype A: RLAction1
    
    func action(for state: RLState1) -> A
}

public struct RLOutcome {
    public let probability: RLValue
    public let next: RLState1
    public let reward: RLValue
    public let done: Bool
    
    public init(probability: RLValue, next: RLState1, reward: RLValue, done: Bool) {
        self.probability = probability
        self.next = next
        self.reward = reward
        self.done = done
    }
}

//typealias RLActionToOutcome = [RLAction1: [RLOutcome]]
//typealias RLStateToActionToOutcome = [RLState1: RLActionToOutcome]
//
//struct RLModel {
//    let P: RLStateToActionToOutcome = [:]
//}

public protocol RLEnvironment1 {
    
    associatedtype A: RLAction1
    
    var stateSpace: [RLState1] { get }
    func actionSpace(for state: RLState1) -> [A]
    func outcomeSpace(for state: RLState1, action: A) -> [RLOutcome]
}

// MARK: - functions

public func argmax(_ array: [RLValue]) -> Int {
    var argmax: (Int, RLValue) = (-1, -RLValue.infinity)
    for element in array.enumerated() {
        if element.1 > argmax.1 {
            argmax = element
        }
    }
    return argmax.0
}
