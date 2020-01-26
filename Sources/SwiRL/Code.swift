public typealias Value = Double
public typealias Reward = Value
public typealias Return = Value

public protocol State {
    var id: Int { get }
    var isTerminal: Bool { get }
}
public protocol Action {}

public protocol Agent {
    func step(reward: Value, state: State)
}
public protocol Policy {}
public protocol Environment {}
public protocol Algorithm {
    func backup(reward: Value, state: State)
}

public class RLAlgorithm: Algorithm {
    // * means optimal
    // bootstrapping = using target
    // backup = update
    public func backup(reward: Value, state: State) {}
}

// TODO: TD(λ), N-step TD
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

public class SARSA: Algorithm {
    public init() {}
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
        return RLAction()
    }
}

public class RLAction: Action {
}

public class RLState: State {
    public var id: Int
    public var isTerminal: Bool
    init(_ id: Int, isTerminal: Bool) {
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
