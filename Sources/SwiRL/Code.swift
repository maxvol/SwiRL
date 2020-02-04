//
//  Global.swift
//  SwiRL
//
//  Created by Maxim Volgin on 26/01/2020.
//

public class RLAlgorithm: Algorithm {
    // * means optimal
    // bootstrapping = using target
    // backup = update
    public func backup(reward: Value, state: State) {}
}



public class RLAgent: Agent {
    let algorithm: Algorithm
    
    public init(algorithm: Algorithm) {
        self.algorithm = algorithm
    }
    
    func optimalPolicy() -> Policy {
        return RLPolicy()
    }
    func currentPolicy() -> Policy {
        return RLPolicy()
    }
    public func step(reward: Value, state: State) {
        self.algorithm.backup(reward: reward, state: state)
        
    }
}

public class RLPolicy: Policy {
    // greedy, softmax, random
    func nextAction() -> Action {
        return Action()
    }
}

public class RLState: State {
    public var id: Int
    public var isTerminal: Bool
    public init(_ id: Int, isTerminal: Bool) {
        self.id = id
        self.isTerminal = isTerminal
    }
}

public class RLEnvironment: Environment {
    public var agents: [Agent] = []
    public init() {}
    public func step() {
        for agent in self.agents {
            let reward = Value.random(in: -10.0 ..< 20.0)
            let state = Int.random(in: 1 ..< 10)
            let terminal = state == 9
            agent.step(reward: reward, state: RLState(state, isTerminal: terminal))
        }
    }
}
