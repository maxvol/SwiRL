//
//  Algorithm.swift
//  SwiRL
//
//  Created by Maxim Volgin on 26/01/2020.
//

// TODO: TD(λ), N-step TD

public protocol Logic {
    
    /**
    q*(a) =𝔼[Rt | At = a]
     */
    func actionValue() -> Value
    
    /**
    𝔼[Rt | At = a] = ...
     */
    func expectedReward() -> Reward
    
    /**
    At = argmax Qt(a) with ties broken arbitrarily
     */
    func greedyAction() -> Action
    


}

public class BaseAlgorithm: Algorithm {
    
    public func backup(reward: Value, state: State) {
        
    }
    
    func estimateError(oldEstimate: Value, target: Value) -> Value {
        return target - oldEstimate
    }
    
    /**
    generic update rule
     */
    func newEstimate(oldEstimate: Value, target: Value, stepSize: Double) -> Value {
        return oldEstimate + stepSize * estimateError(oldEstimate: oldEstimate, target: target)
    }
    
    
}
