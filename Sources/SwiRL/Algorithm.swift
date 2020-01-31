//
//  Algorithm.swift
//  SwiRL
//
//  Created by Maxim Volgin on 26/01/2020.
//

// TODO: TD(λ), N-step TD

protocol Logic {
    
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
