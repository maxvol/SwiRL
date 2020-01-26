//: [Previous](@previous)

import SwiRL


let env = RLEnvironment()
let oneStepTD = OneStepTD()
let sarsa = SARSA()
let agent0 = RLAgent(algorithm: oneStepTD)
let agent1 = RLAgent(algorithm: sarsa)
env.agents.append(agent0)
env.agents.append(agent1)
for _ in 1...100 {
    env.step()
}

oneStepTD.stateValue

/*
 More formally, we should first define Markov Decision Process (MDP) as a tuple (S, A, P, R, y), where:

 S is a finite set of states
 A is a finite set of actions
 P is a state transition probability matrix (probability of ending up in a state for each current state and each action)
 R is a reward function, given a state and an action
 y is a discount factor, between 0 and 1
 Then, a policy π is a probability distribution over actions given states.
 
 n plain words, in the simplest case, a policy π is a function that takes as input a state s and returns an action a. That is: π(s) → a

 In this way, the policy is typically used by the agent to decide what action a should be performed when it is in a given state s.

 Sometimes, the policy can be stochastic instead of deterministic. In such a case, instead of returning a unique action a, the policy returns a probability distribution over a set of actions.
 */



//: [Next](@next)
