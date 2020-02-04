//
//  ActorCritic.swift
//  SwiRL
//
//  Created by Maxim Volgin on 27/01/2020.
//

public class ActorCritic: Algorithm {
    
    struct StepSize {
        var averageReward: Reward = 0.5
        // TODO
    }
    
    let stepSize: StepSize = StepSize()
    var averageReward: Reward = 0.0
    public init() {}
    
    /**
     R̂ <- R̂ + αᴿδ
     */
    func updateAverageReward(tdError: Value) {
        self.averageReward += self.stepSize.averageReward * tdError
    }
    
    
    /**
     V(St) = V(St) + α[Gt - V(St)]
     Q(St, At) = Q(St, At) + α[Gt - Q(St, At)]
     */
    public func backup(reward: Value, state: State) {
//        var value = self.value(state: self.previousState)
//        value += self.stepSize * (target(reward: reward, state: state) - value)
//        self.setValue(value, for: self.previousState)
//        self.previousState = state.isTerminal ? RLState(1, isTerminal: false) : state
    }
    /**
     Rt+1 + ɣQ(St+1, At+1)
     */
    func expectedReturn() -> Value {
        return 0.0
    }
}
