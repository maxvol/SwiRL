//: [Previous](@previous)

import Foundation
import SwiRL

enum SWFAction: RLAction1 {
    case left
    case right
}

enum SWFOutcome: RLValue {
    case forward = 0.50
    case stay = 0.3333
    case backward = 0.1666
}

//public struct RLOutcome {
//    let probability: RLValue
//    let next: RLState1
//    let reward: RLValue
//    let done: Bool
//}

typealias RLActionToOutcome = [SWFAction: [RLOutcome]]
typealias RLStateToActionToOutcome = [RLState1: RLActionToOutcome]

struct SWF: RLEnvironment1 {
    typealias A = SWFAction
    
    private(set) var P: RLStateToActionToOutcome = [
        0: [
            .left: [RLOutcome(probability: 1.0, next: 0, reward: 0.0, done: true)],
            .right: [RLOutcome(probability: 1.0, next: 0, reward: 0.0, done: true)]
        ],
        1: [
            .left: [],
            .right: []
        ],
        2: [
            .left: [],
            .right: []
        ],
        3: [
            .left: [],
            .right: []
        ],
        4: [
            .left: [],
            .right: []
        ],
        5: [
            .left: [],
            .right: []
        ],
        6: [
            .left: [RLOutcome(probability: 1.0, next: 0, reward: 0.0, done: true)],
            .right: [RLOutcome(probability: 1.0, next: 0, reward: 0.0, done: true)]
        ],
    ]
    
    var stateSpace: [RLState1] { get { Array(P.keys) } }
    
    func outcomeSpace(for state: RLState1, action: A) -> [RLOutcome] {
        P[state]![action]!
    }

    public init() {
        for key in P.keys {
            guard key != 0 && key != 6 else {
                continue
            }
            let lhs = key - 1
            let rhs = key + 1
            let reward: RLValue = key == 5 ? 1.0 : 0.0
            P[key] = [
                .left: [
                    RLOutcome(probability: SWFOutcome.forward.rawValue, next: lhs, reward: 0.0, done: true),
                    RLOutcome(probability: SWFOutcome.stay.rawValue, next: key, reward: 0.0, done: false),
                    RLOutcome(probability: SWFOutcome.backward.rawValue, next: rhs, reward: reward, done: false)
                ],
                .right: [
                    RLOutcome(probability: SWFOutcome.forward.rawValue, next: rhs, reward: reward, done: true),
                    RLOutcome(probability: SWFOutcome.stay.rawValue, next: key, reward: 0.0, done: false),
                    RLOutcome(probability: SWFOutcome.backward.rawValue, next: lhs, reward: 0.0, done: false)
                ]
            ]
        }
    }
    
}

struct SWFPolicy: RLPolicy1 {
    typealias A = SWFAction
    func action(for state: RLState1) -> A {
        .left
    }
}

let ipe = IterativePolicyEvaluation<SWF, SWFPolicy>()
ipe.evaluate(environment: SWF(), policy: SWFPolicy())

//: [Next](@next)
