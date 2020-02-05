//
//  Bandit.swift
//  SwiRL
//
//  Created by Maxim Volgin on 04/02/2020.
//

import Foundation

public class Bandit: BaseAlgorithm {    
    public struct Last {
        public var action: Action? = nil
    }
    public private(set) var last = Last(action: nil)
    
    public let k: Int
    public let ε: Double
    public var Q: Dictionary<Action, Value> = [:]
    public var N: Dictionary<Action, Int> = [:] // times action was chosen
    
    public init(_ k: Int, _ ε: Double) {
        self.k = k
        self.ε = ε
        for i in 1...k {
            self.Q[i] = 0.0
            self.N[i] = 0
        }
    }
    
    public func action() -> Action? {
        let random = Double.random(in: 0.0 ... 1.0)
        if random < self.ε {
            return Int.random(in: 1...k)
        } else {
            return argmax(self.Q)
        }
    }
    
    public func step(reward: Reward, state: State) -> Action? {
        self.backup(reward: reward, state: state)
        self.last.action = self.action()
        return self.last.action
    }
    
    override public func backup(reward: Reward, state: State) {
        guard let action = self.last.action else { return }
        self.N[action]? += 1
        let stepSize = 1.0 / Double(N[action] ?? 1)
        if let oldEstimate = self.Q[action] {
            self.Q[action]? = self.newEstimate(oldEstimate: oldEstimate, target: reward, stepSize: stepSize)
        }
    }
    
    func UCB(Qta: Double, Nta: Double, t: Double, c: Double) -> Double {
        assert({ c > 0.0 }(), "c > 0")
        return Qta + c * sqrt(ln(t) / Nta)
    }
    
}

