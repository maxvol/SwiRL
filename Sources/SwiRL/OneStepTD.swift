//
//  OneStepTD.swift
//  SwiRL
//
//  Created by Maxim Volgin on 26/01/2020.
//

/**
 TD(0)
 */
public class OneStepTD: Algorithm {
    public let discount = 0.5
    public let stepSize = 0.5
    public var previousState: State = RLState(1, isTerminal: false)
    public var stateValue = Dictionary<Int, Value>()
    public init() {}
    func value(state: State) -> Value {
        if let value = self.stateValue[state.id] {
            return value
        }
        let initial = 0.0
        self.stateValue[state.id] = initial
        return initial
    }
    func setValue(_ value: Value, for state: State) {
        self.stateValue[state.id] = value
    }
        
    /**
     V(St) = V(St) + α[Rt+1 + ɣV(St+1) - V(St)]
         = V(St) + α[target - V(St)]
     */
    public func backup(reward: Value, state: State) {
        var value = self.value(state: self.previousState)
        value += self.stepSize * (target(reward: reward, state: state) - value)
        self.setValue(value, for: self.previousState)
        self.previousState = state.isTerminal ? RLState(1, isTerminal: false) : state
    }
    /**
     Rt+1 + ɣV(St+1)
     */
    func target(reward: Value, state: State) -> Value {
        return state.isTerminal ? 0.0 : reward + self.discount * self.value(state: state)
    }
}

