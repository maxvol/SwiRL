//: [Previous](@previous)

// Prediction problem, Tabular val func, Model available
// TODO: implement with MPGS for performance

import Foundation

typealias RLState = Int
typealias RLValue = Float
//typealias RLReward = Float
//typealias RLMeasure = Float

protocol RLEnvironment {}

protocol RLAction {}

enum SWFAction: RLAction {
    case left
    case right
}

enum SWFOutcome: RLValue {
    case forward = 0.50
    case stay = 0.3333
    case backward = 0.1666
}

struct SWF: RLEnvironment {
    
    private(set) var stateSpace: [RLState] = [0, 1, 2, 3, 4, 5, 6]
    
    func reward(from: RLState, with action: SWFAction, to: RLState) -> RLValue {
        (from == 5 && to == 6) ? 1.0 : 0.0
    }
    
    func next(from state: RLState) -> [RLState] {
        switch state {
        case 0:
            return [0]
        case 6:
            return [6]
        default:
            return [state - 1, state, state + 1]
        }
    }
    
    func probability(of next: RLState, from state: RLState, with action: SWFAction) -> RLValue {
        if state == 0 || state == 6 {
            return next == state ? 1.0 : 0.0
        }
        if next == state {
            return SWFOutcome.stay.rawValue
        }
        if (next > state && action == .right) || (next < state && action == .left) {
            return SWFOutcome.forward.rawValue
        }
        if (next < state && action == .right) || (next > state && action == .left)  {
            return SWFOutcome.backward.rawValue
        }
        return 0.0
    }
}

struct SWFPolicy {
    func action(for state: RLState) -> SWFAction {
        .left
    }
}

// expected return is value of the initial state, i.e. V(3)
class IterativePolicyEvaluator {
    private(set) var bootstrap: [RLState: RLValue] = [:]
    
    func value(from state: RLState, with action: SWFAction, to next: RLState, in environment: SWF) -> RLValue {
        let probability = environment.probability(of: next, from: state, with: action)
        let reward = environment.reward(from: state, with: action, to: next)
        let value = self.bootstrap[next] ?? 0.0
//        print("p(\(next)|\(state),\(action)) = \(probability) r(\(state),\(action),\(next)) = \(reward) V(\(next)) = \(value)")
        return probability * (reward + value)
    }
    
    func callAsFunction(_ environment: SWF, _ policy: SWFPolicy, iterationCount: Int = 100) {
        for state in environment.stateSpace {
            self.bootstrap[state] = 0.0
        }
        for k in 0..<iterationCount {
            print("k=\(k) \(bootstrap)")
            var valueSpace: [RLState: RLValue] = [:]
            for state in environment.stateSpace {
                let action = policy.action(for: state)
                var value: RLValue = 0.0
                for next in environment.next(from: state) {
                    value += self.value(from: state, with: action, to: next, in: environment)
                }
                valueSpace[state] = value
            }
            var identical = true
            for state in environment.stateSpace {
                identical = identical && (self.bootstrap[state] == valueSpace[state])
            }
            if identical {
                print("converged at iteration #\(k)")
                break
            }
            self.bootstrap = valueSpace
        }
        print(bootstrap)
    }
    
}

let ipe = IterativePolicyEvaluator()
ipe(SWF(), SWFPolicy(), iterationCount: 105)

//: [Next](@next)
